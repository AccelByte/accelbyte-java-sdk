package titlematchmaking.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import net.accelbyte.sdk.api.dsmc.models.ModelsClaimSessionRequest;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchMember;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchParty;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchingAlly;
import net.accelbyte.sdk.api.dsmc.models.ModelsServer;
import net.accelbyte.sdk.api.dsmc.operations.session.ClaimServer;
import net.accelbyte.sdk.api.iam.models.ModelPublicUserResponseV3;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.VerifyTokenV3;
import net.accelbyte.sdk.api.iam.operations.users.PublicGetUserByUserIdV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.lobby.models.ModelFreeFormNotificationRequest;
import net.accelbyte.sdk.api.lobby.operations.notification.FreeFormNotificationByUserID;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsAddPlayerRequest;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsCreateSessionRequest;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsGameSessionSetting;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionResponse;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.AddPlayerToSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.CreateSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.GetSession;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy.RetryIntervalType;
import net.accelbyte.sdk.core.client.ReliableHttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import redis.clients.jedis.Jedis;

public class App
    implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {

  public APIGatewayProxyResponseEvent handleRequest(
      final APIGatewayProxyRequestEvent request, final Context context) {
    final Map<String, String> headers = new HashMap<>();

    headers.put("Content-Type", "application/json");

    final APIGatewayProxyResponseEvent response =
        new APIGatewayProxyResponseEvent().withHeaders(headers);

    try {
      // Get user access token from authorization header

      final String authorization = request.getHeaders().get("Authorization");

      if (authorization == null || authorization.isEmpty()) {
        return response
            .withStatusCode(401)
            .withBody(getErrorJson(40101, "Authorization header is null or empty"));
      }

      final String[] authorizationSplit = authorization.split(" ");

      if (authorizationSplit.length != 2) {
        return response
            .withStatusCode(401)
            .withBody(getErrorJson(40102, "Authorization header is not valid"));
      }

      final String userAccessToken = authorizationSplit[1];

      // Initialize

      final String namespace = System.getenv("AB_NAMESPACE");
      final String redisHost = System.getenv("REDIS_HOST");

      final DefaultHttpRetryPolicy retryPolicy =
          new DefaultHttpRetryPolicy() {
            @Override
            public boolean doRetry(
                int attempt, Operation operation, HttpResponse response, Exception exception) {
              // Custom logic to handle DSMC claim server 425 server is not ready
              if (attempt < this.getMaxRetry()) {
                if (response != null && response.getCode() == 425) {
                  try {
                    final int multiplier =
                        this.getRetryIntervalType() == RetryIntervalType.EXPONENTIAL ? attempt : 1;
                    // Wait before retry
                    Thread.sleep(this.getRetryInterval() * multiplier);
                  } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                  }

                  return true;
                }
              }

              return false;
            }
          };

      retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);
      retryPolicy.setCallTimeout(5000);
      retryPolicy.setMaxRetry(20);
      retryPolicy.setRetryInterval(2000);

      final AccelByteSDK sdk =
          new AccelByteSDK(
              new ReliableHttpClient(retryPolicy),
              new DefaultTokenRepository(),
              new DefaultConfigRepository());

      final OAuth20 oauth20Wrapper = new OAuth20(sdk);
      final Users usersWrapper = new Users(sdk);
      final Session sessionWrapper = new Session(sdk);
      final net.accelbyte.sdk.api.dsmc.wrappers.Session dsmcSessionWrapper =
          new net.accelbyte.sdk.api.dsmc.wrappers.Session(sdk);
      final Notification notifWrapper = new Notification(sdk);

      sdk.loginClient();

      // Verify access token and get user id

      final VerifyTokenV3 verifyTokenV3Op = VerifyTokenV3.builder().token(userAccessToken).build();

      verifyTokenV3Op.setPreferredSecurityMethod(Operation.Security.Basic.toString());

      final OauthmodelTokenResponseV3 verifyTokenV3Result =
          oauth20Wrapper.verifyTokenV3(verifyTokenV3Op);

      final String userId = verifyTokenV3Result.getUserId();

      if (userId == null || userId.isEmpty()) {
        return response
            .withStatusCode(503)
            .withBody(getErrorJson(50301, "User id is null or empty"));
      }

      // Create matchmaking request

      final String waitingUserIdKey = "waiting-user-id";

      String waitingUserId = null;

      try (final Jedis jedis = new Jedis(redisHost)) {
        waitingUserId = jedis.get(waitingUserIdKey);
        if (waitingUserId == null) {
          jedis.set(waitingUserIdKey, userId);
        } else {
          jedis.del(waitingUserIdKey);
        }
      }

      if (waitingUserId == null) {
        final ModelFreeFormNotificationRequest notifBody =
            ModelFreeFormNotificationRequest.builder()
                .topic("titleMatchmakingNotif")
                .message("Waiting for player 2")
                .build();

        notifWrapper.freeFormNotificationByUserID(
            FreeFormNotificationByUserID.builder()
                .namespace(namespace)
                .userId(userId)
                .body(notifBody)
                .build());
      } else {
        final ModelFreeFormNotificationRequest notifBody =
            ModelFreeFormNotificationRequest.builder()
                .topic("titleMatchmakingNotif")
                .message("Found player 1 waiting")
                .build();

        notifWrapper.freeFormNotificationByUserID(
            FreeFormNotificationByUserID.builder()
                .namespace(namespace)
                .userId(userId)
                .body(notifBody)
                .build());
      }

      if (waitingUserId == null) {
        return response
            .withStatusCode(200)
            .withBody(getSuccessJson("ok - player 1")); // Stop here if we are
        // waiting for an opponent
      }

      // Continue if we found an opponent waiting

      final ModelPublicUserResponseV3 getUserResult =
          usersWrapper.publicGetUserByUserIdV3(
              PublicGetUserByUserIdV3.builder().namespace(namespace).userId(userId).build());

      final String username = getUserResult.getUserName();

      final String[] playerUserIds = new String[] {waitingUserId, userId};

      // Create session

      final ModelsGameSessionSetting gameSessionSetting =
          ModelsGameSessionSetting.builder()
              .allowJoinInProgress(true)
              .currentInternalPlayer(0)
              .currentPlayer(0)
              .mapName("Java Server SDK Title Matchmaking Sample App")
              .maxInternalPlayer(2)
              .maxPlayer(0)
              .mode("duel")
              .numBot(0)
              .password("")
              .build();

      final ModelsCreateSessionRequest createSessionBody =
          ModelsCreateSessionRequest.builder()
              .namespace(namespace)
              .sessionType("p2p")
              .gameVersion("1.0.0")
              .username(username)
              .gameSessionSetting(gameSessionSetting)
              .build();

      final ModelsSessionResponse createSessionResult =
          sessionWrapper.createSession(
              CreateSession.builder().namespace(namespace).body(createSessionBody).build());

      final String sessionId = createSessionResult.getSessionId();

      // Register session to DSMC

      final List<ModelsRequestMatchMember> partyMembers = new ArrayList<>();

      for (String uid : playerUserIds) {
        partyMembers.add(ModelsRequestMatchMember.builder().userId(uid).build());
      }

      final List<ModelsRequestMatchParty> matchingParties =
          Arrays.asList(
              new ModelsRequestMatchParty[] {
                ModelsRequestMatchParty.builder()
                    .partyAttributes(new HashMap<String, Object>())
                    .partyId(UUID.randomUUID().toString())
                    .partyMembers(partyMembers)
                    .build()
              });

      final List<ModelsRequestMatchingAlly> matchingAllies =
          Arrays.asList(
              new ModelsRequestMatchingAlly[] {
                ModelsRequestMatchingAlly.builder().matchingParties(matchingParties).build()
              });

      final net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest createSessionDsmcBody =
          net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest.builder()
              .clientVersion("1.0.0")
              .configuration("")
              .deployment("default")
              .gameMode("duel")
              .matchingAllies(matchingAllies)
              .region("")
              .podName("")
              .sessionId(sessionId)
              .namespace(namespace)
              .build();

      dsmcSessionWrapper.createSession(
          net.accelbyte.sdk.api.dsmc.operations.session.CreateSession.builder()
              .namespace(namespace)
              .body(createSessionDsmcBody)
              .build());

      // Claim Server (retry if we got 425 server is not ready)

      for (String uid : playerUserIds) {
        final ModelFreeFormNotificationRequest notifBody =
            ModelFreeFormNotificationRequest.builder()
                .topic("titleMatchmakingNotif")
                .message("Claiming server, please wait")
                .build();

        notifWrapper.freeFormNotificationByUserID(
            FreeFormNotificationByUserID.builder()
                .namespace(namespace)
                .userId(uid)
                .body(notifBody)
                .build());
      }

      final ModelsClaimSessionRequest claimServerBody =
          ModelsClaimSessionRequest.builder().sessionId(sessionId).build();

      dsmcSessionWrapper.claimServer(
          ClaimServer.builder().namespace(namespace).body(claimServerBody).build());

      // Get server info

      final net.accelbyte.sdk.api.dsmc.models.ModelsSessionResponse getSessionDsmcResult =
          dsmcSessionWrapper.getSession(
              net.accelbyte.sdk.api.dsmc.operations.session.GetSession.builder()
                  .namespace(namespace)
                  .sessionID(sessionId)
                  .build());

      final ModelsServer server = getSessionDsmcResult.getSession().getServer();

      // Add players to session

      for (String uid : playerUserIds) {
        final ModelsAddPlayerRequest addPlayerToSessionBody =
            ModelsAddPlayerRequest.builder().userId(uid).asSpectator(false).build();

        sessionWrapper.addPlayerToSession(
            AddPlayerToSession.builder()
                .namespace(namespace)
                .sessionID(sessionId)
                .body(addPlayerToSessionBody)
                .build());
      }

      // Get session update

      final ModelsSessionResponse getSessionResult =
          sessionWrapper.getSession(
              GetSession.builder().namespace(namespace).sessionID(sessionId).build());

      if (!getSessionResult.getJoinable()) {
        return response
            .withStatusCode(503)
            .withBody(getErrorJson(50302, "Session is not joinable"));
      }

      // Send server info to all players via lobby websocket notification

      for (String uid : playerUserIds) {
        final ModelFreeFormNotificationRequest notifBody =
            ModelFreeFormNotificationRequest.builder()
                .topic("titleMatchmakingNotif")
                .message(
                    String.format("Done, server is at %s:%s", server.getIp(), server.getPort()))
                .build();

        notifWrapper.freeFormNotificationByUserID(
            FreeFormNotificationByUserID.builder()
                .namespace(namespace)
                .userId(uid)
                .body(notifBody)
                .build());
      }

      return response.withStatusCode(200).withBody(getSuccessJson("ok - player 2"));
    } catch (Exception e) {
      e.printStackTrace();
      return response
          .withStatusCode(503)
          .withBody(getErrorJson(50300, String.format("%s", e.getMessage())));
    }
  }

  private String getSuccessJson(String result) {
    return String.format("{\"result\":\"%s\"}", result);
  }

  private String getErrorJson(int code, String message) {
    return String.format("{\"code\":\"%d\",\"message\":\"%s\"}", code, message);
  }
}

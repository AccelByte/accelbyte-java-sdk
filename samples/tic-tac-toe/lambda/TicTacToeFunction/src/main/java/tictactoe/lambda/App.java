package tictactoe.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.HashMap;
import java.util.Map;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.VerifyTokenV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.api.lobby.models.ModelFreeFormNotificationRequest;
import net.accelbyte.sdk.api.lobby.operations.notification.FreeFormNotificationByUserID;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import redis.clients.jedis.Jedis;
import tictactoe.lambda.Game.State;

public class App
    implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {

  private final String Namespace = System.getenv("AB_NAMESPACE");
  private final String RedisHost = System.getenv("REDIS_HOST");

  private static final String GameKey = "tictactoe";
  private static final String NotificationTopic = "ticTacToeNotif";
  private static final char Player1Move = 'X';
  private static final char Player2Move = 'O';

  private final AccelByteSDK SDK =
      new AccelByteSDK(
          new OkhttpClient(), new DefaultTokenRepository(), new DefaultConfigRepository());

  private final OAuth20 oauth20Wrapper = new OAuth20(SDK);
  private final Notification notifWrapper = new Notification(SDK);

  public APIGatewayProxyResponseEvent handleRequest(
      final APIGatewayProxyRequestEvent request, final Context context) {
    final Map<String, String> headers = new HashMap<>();

    headers.put("Content-Type", "application/json");

    final APIGatewayProxyResponseEvent response =
        new APIGatewayProxyResponseEvent().withHeaders(headers);

    try {
      final String path = request.getPath();

      // Login using Client ID and Client Secret as required

      if (path.endsWith("/start") || path.endsWith("/move")) {
        SDK.loginClient();
      }

      // Perform routing

      if (path != null) {
        if (path.endsWith("/start")) {
          return doStartGame(request, response);
        } else if (path.endsWith("/state")) {
          return doGetState(request, response);
        } else if (path.endsWith("/move")) {
          final ObjectMapper mapper = new ObjectMapper();
          final String body = request.getBody();
          final Map<String, String> map =
              mapper.readValue(body, new TypeReference<Map<String, String>>() {});
          final int moveIdx = Integer.parseInt(map.get("move"));
          return doMakeMove(request, response, moveIdx);
        } else if (path.endsWith("/reset")) {
          return doResetGame(request, response);
        }
      }

      return response.withStatusCode(404).withBody(getErrorJson(40400, "Path not found"));
    } catch (Exception e) {
      e.printStackTrace();
      return response
          .withStatusCode(503)
          .withBody(getErrorJson(50300, String.format("%s", e.getMessage())));
    }
  }

  private APIGatewayProxyResponseEvent doStartGame(
      APIGatewayProxyRequestEvent request, APIGatewayProxyResponseEvent response) throws Exception {
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

    // Verify user access token and get user id

    final VerifyTokenV3 verifyTokenV3Op = VerifyTokenV3.builder().token(userAccessToken).build();

    verifyTokenV3Op.setPreferredSecurityMethod(Operation.Security.Basic.toString());

    final OauthmodelTokenResponseV3 verifyTokenV3Result =
        oauth20Wrapper.verifyTokenV3(verifyTokenV3Op);

    final String userId = verifyTokenV3Result.getUserId();

    if (userId == null || userId.isEmpty()) {
      return response.withStatusCode(503).withBody(getErrorJson(50301, "User id is null or empty"));
    }

    // Start a game

    Game game = null;

    try (final Jedis jedis = new Jedis(RedisHost)) {
      final ObjectMapper mapper = new ObjectMapper();

      String gameJson = jedis.get(GameKey);

      if (gameJson != null) {
        game = mapper.readValue(gameJson, Game.class); // Load existing game
      } else {
        game = new Game(); // Create new game
      }

      if (game.player1 == null) {
        game.player1 = userId;
      } else if (game.player2 == null) {
        game.player2 = userId;
      } else {
        return response
            .withStatusCode(503)
            .withBody(getErrorJson(50302, "There is an existing game"));
      }

      gameJson = mapper.writeValueAsString(game);

      jedis.set(GameKey, gameJson);
    }

    if (game.player2 == null) {
      // Stop here if we are waiting for player 2
      return response.withStatusCode(200).withBody(getSuccessJson("ok - player 1"));
    }

    // Continue if we found player 1 waiting

    final ModelFreeFormNotificationRequest notifBody =
        ModelFreeFormNotificationRequest.builder()
            .topic(NotificationTopic)
            .message("GAME START")
            .build();

    notifWrapper.freeFormNotificationByUserID(
        FreeFormNotificationByUserID.builder()
            .namespace(Namespace)
            .userId(game.player1)
            .body(notifBody)
            .build());

    notifWrapper.freeFormNotificationByUserID(
        FreeFormNotificationByUserID.builder()
            .namespace(Namespace)
            .userId(game.player2)
            .body(notifBody)
            .build());

    return response.withStatusCode(200).withBody(getSuccessJson("ok - player 2 - game start"));
  }

  private APIGatewayProxyResponseEvent doGetState(
      APIGatewayProxyRequestEvent request, APIGatewayProxyResponseEvent response) throws Exception {
    try (final Jedis jedis = new Jedis(RedisHost)) {
      final String gameJson = jedis.get(GameKey);

      return response.withStatusCode(200).withBody(gameJson);
    }
  }

  private APIGatewayProxyResponseEvent doMakeMove(
      APIGatewayProxyRequestEvent request, APIGatewayProxyResponseEvent response, int moveIdx)
      throws Exception {
    final int rowIdx = (moveIdx - 1) / 3;
    final int colIdx = (moveIdx - 1) % 3;

    Game game = null;

    try (final Jedis jedis = new Jedis(RedisHost)) {
      final ObjectMapper mapper = new ObjectMapper();

      String gameJson = jedis.get(GameKey);

      game = mapper.readValue(gameJson, Game.class); // Load existing game

      if (game.board[rowIdx][colIdx] == Player1Move || game.board[rowIdx][colIdx] == Player2Move) {
        return response.withStatusCode(503).withBody(getErrorJson(50303, "Wrong move"));
      }

      game.board[rowIdx][colIdx] =
          game.state == State.PLAYER1_TURN ? Player1Move : Player2Move; // Make a move

      game.state = nextState(game, rowIdx, colIdx); // Update state

      gameJson = mapper.writeValueAsString(game);

      jedis.set(GameKey, gameJson);
    }

    final ModelFreeFormNotificationRequest notifBody =
        ModelFreeFormNotificationRequest.builder()
            .topic(NotificationTopic)
            .message("BOARD UPDATE")
            .build();

    notifWrapper.freeFormNotificationByUserID(
        FreeFormNotificationByUserID.builder()
            .namespace(Namespace)
            .userId(game.player1)
            .body(notifBody)
            .build());

    notifWrapper.freeFormNotificationByUserID(
        FreeFormNotificationByUserID.builder()
            .namespace(Namespace)
            .userId(game.player2)
            .body(notifBody)
            .build());

    return response.withStatusCode(200).withBody(getSuccessJson("ok"));
  }

  private APIGatewayProxyResponseEvent doResetGame(
      APIGatewayProxyRequestEvent request, APIGatewayProxyResponseEvent response) throws Exception {
    try (final Jedis jedis = new Jedis(RedisHost)) {
      jedis.del(GameKey);
    }

    return response.withStatusCode(200).withBody(getSuccessJson("ok"));
  }

  private Game.State nextState(Game game, int rowIdx, int colIdx) {
    final char playerMove = game.board[rowIdx][colIdx];
    final int n = game.board.length;

    boolean win = false;

    // Check horizontal

    for (int i = 0; i < n; i++) {
      if (game.board[rowIdx][i] != playerMove) {
        break;
      }
      if (i == n - 1) {
        win = true;
      }
    }

    // Check vertical

    for (int i = 0; i < n; i++) {
      if (game.board[i][colIdx] != playerMove) {
        break;
      }
      if (i == n - 1) {
        win = true;
      }
    }

    // Check diagonal

    for (int i = 0; i < n; i++) {
      if (game.board[i][i] != playerMove) {
        break;
      }
      if (i == n - 1) {
        win = true;
      }
    }

    for (int i = 0; i < n; i++) {
      if (game.board[i][n - 1 - i] != playerMove) {
        break;
      }
      if (i == n - 1) {
        win = true;
      }
    }

    if (win) {
      if (playerMove == Player1Move) {
        return State.PLAYER1_WINS; // Player 1 wins
      } else {
        return State.PLAYER2_WINS; // Player 2 wins
      }
    } else {
      boolean draw = true;

      for (int r = 0; r < n; r++) {
        for (int c = 0; c < n; c++) {
          if (game.board[r][c] != Player1Move && game.board[r][c] != Player2Move) {
            draw = false;
            break;
          }
        }
        if (!draw) {
          break;
        }
      }

      if (draw) {
        return State.DRAW; // Draw
      }
    }

    return game.state == State.PLAYER1_TURN
        ? State.PLAYER2_TURN
        : State.PLAYER1_TURN; // Change player turn
  }

  private String getSuccessJson(String result) {
    return String.format("{\"result\":\"%s\"}", result);
  }

  private String getErrorJson(int code, String message) {
    return String.format("{\"code\":\"%d\",\"message\":\"%s\"}", code, message);
  }
}

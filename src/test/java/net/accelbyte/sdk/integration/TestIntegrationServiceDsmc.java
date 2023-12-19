/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.HashMap;
import lombok.SneakyThrows;
import net.accelbyte.sdk.api.dsmc.models.ModelsClaimSessionRequest;
import net.accelbyte.sdk.api.dsmc.models.ModelsDeploymentWithOverride;
import net.accelbyte.sdk.api.dsmc.models.ModelsListServerResponse;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchMember;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchParty;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchingAlly;
import net.accelbyte.sdk.api.dsmc.operations.admin.ListLocalServer;
import net.accelbyte.sdk.api.dsmc.operations.deployment_config.GetDeployment;
import net.accelbyte.sdk.api.dsmc.operations.session.ClaimServer;
import net.accelbyte.sdk.api.dsmc.wrappers.Admin;
import net.accelbyte.sdk.api.dsmc.wrappers.DeploymentConfig;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsAdminSessionResponse;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsCreateSessionRequest;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsGameSessionSetting;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionResponse;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.AdminDeleteSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.CreateSession;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy.RetryIntervalType;
import net.accelbyte.sdk.core.client.ReliableHttpClient;
import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationServiceDsmc extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    final String targetUsername = "dummy@example.com";
    final String targetNamespace = this.namespace;
    final String targetDeployment = "default";
    final String gameMode = "GAME_MODE";
    final String partyId = "PARTY_ID";
    final String sessionType = "dedicated";

    final net.accelbyte.sdk.api.dsmc.wrappers.Session dsmcSessionWrapper =
        new net.accelbyte.sdk.api.dsmc.wrappers.Session(sdk);
    final Admin dsmcAdminWrapper = new Admin(sdk);
    final Session sessionBrowserWrapper = new Session(sdk);
    final DeploymentConfig dsmcDeploymentConfigWrapper = new DeploymentConfig(sdk);

    // CASE List local servers

    final ModelsListServerResponse listLocalServerResult =
        dsmcAdminWrapper.listLocalServer(
            ListLocalServer.builder().namespace(this.namespace).build());

    // ESAC

    assertNotNull(listLocalServerResult);

    // CASE Get deployment

    ModelsDeploymentWithOverride getDeploymentResult =
        dsmcDeploymentConfigWrapper.getDeployment(
            GetDeployment.builder().deployment(targetDeployment).namespace(namespace).build());

    // ESAC

    assertNotNull(getDeploymentResult);
    assertNotNull(getDeploymentResult.getGameVersion());

    final String gameVersion = getDeploymentResult.getGameVersion();

    // Create a session (SessionBrowser)

    final ModelsCreateSessionRequest createSessionBody =
        ModelsCreateSessionRequest.builder()
            .sessionType(sessionType)
            .gameVersion(gameVersion)
            .namespace(targetNamespace)
            .username(targetUsername)
            .gameSessionSetting(
                ModelsGameSessionSetting.builder()
                    .mode(gameMode)
                    .allowJoinInProgress(true)
                    .mapName("Java Server SDK Integration Test")
                    .maxPlayer(100)
                    .build())
            .build();

    final ModelsSessionResponse createSessionResult =
        sessionBrowserWrapper.createSession(
            CreateSession.builder().namespace(targetNamespace).body(createSessionBody).build());

    assertNotNull(createSessionResult);
    assertEquals(targetUsername, createSessionResult.getUsername());

    final String sessionId = createSessionResult.getSessionId();

    // CASE Create a session (DSMC)

    final net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest createSessionDsmcBody =
        net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest.builder()
            .clientVersion(gameVersion)
            .configuration("")
            .deployment(targetDeployment)
            .gameMode(gameMode)
            .matchingAllies(
                Arrays.asList(
                    new ModelsRequestMatchingAlly[] {
                      ModelsRequestMatchingAlly.builder()
                          .matchingParties(
                              Arrays.asList(
                                  new ModelsRequestMatchParty[] {
                                    ModelsRequestMatchParty.builder()
                                        .partyAttributes(new HashMap<String, Object>())
                                        .partyId(partyId)
                                        .partyMembers(
                                            Arrays.asList(
                                                new ModelsRequestMatchMember[] {
                                                  ModelsRequestMatchMember.builder()
                                                      .userId(this.username)
                                                      .build()
                                                }))
                                        .build()
                                  }))
                          .build()
                    }))
            .region("")
            .podName("")
            .sessionId(sessionId)
            .namespace(targetNamespace)
            .build();

    final net.accelbyte.sdk.api.dsmc.models.ModelsSessionResponse createSessionDsmcResult =
        dsmcSessionWrapper.createSession(
            net.accelbyte.sdk.api.dsmc.operations.session.CreateSession.builder()
                .namespace(targetNamespace)
                .body(createSessionDsmcBody)
                .build());

    // ESAC

    assertNotNull(createSessionDsmcResult);

    // CASE Get session (DSMC)

    final net.accelbyte.sdk.api.dsmc.models.ModelsSessionResponse getSessionDsmcResult =
        dsmcSessionWrapper.getSession(
            net.accelbyte.sdk.api.dsmc.operations.session.GetSession.builder()
                .namespace(targetNamespace)
                .sessionID(sessionId)
                .build());

    // ESAC

    assertNotNull(getSessionDsmcResult);

    try {

      // CASE Claim server (for example, using HTTP retry)

      final DefaultHttpRetryPolicy retryPolicy =
          new DefaultHttpRetryPolicy() {
            @SneakyThrows
            @Override
            public boolean doRetry(
                int attempt, Operation operation, HttpResponse response, Exception exception) {
              // Custom logic to handle DSMC claim server 425 server is not ready
              if (attempt < this.getMaxRetry()) {
                if (response == null) {
                  return false;
                }
                // if we hit to fast we might get 500 error, but what makes it weird the error
                // message, something like:
                // "Job not found 404",
                // so here by adding a retry in the case we got that message we will just retry it
                String responseMsg =
                    IOUtils.toString(response.getPayload(), Charset.defaultCharset());
                if (response.getCode() == 425 || responseMsg.contains("404")) {
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

      final AccelByteSDK reliableSdk =
          new AccelByteSDK(
              new ReliableHttpClient(retryPolicy),
              sdk.getSdkConfiguration().getTokenRepository(),
              sdk.getSdkConfiguration().getConfigRepository());

      retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);
      retryPolicy.setCallTimeout(5000);
      retryPolicy.setMaxRetry(20);
      retryPolicy.setRetryInterval(2000);

      final net.accelbyte.sdk.api.dsmc.wrappers.Session dsmcSessionReliableWrapper =
          new net.accelbyte.sdk.api.dsmc.wrappers.Session(reliableSdk);

      ModelsClaimSessionRequest claimServerBody =
          ModelsClaimSessionRequest.builder().sessionId(sessionId).build();

      dsmcSessionReliableWrapper.claimServer(
          ClaimServer.builder().namespace(targetNamespace).body(claimServerBody).build());

      // ESAC

    } catch (HttpResponseException hrex) {
      if (hrex.getHttpCode() == 425) {
        // Due test environment issue, ignore if we get 425 - 720219 ClaimServerNotReady
        // during integration test for now
      } else {
        throw hrex;
      }
    }

    // CASE Delete session (DSMC)

    dsmcAdminWrapper.deleteSession(
        net.accelbyte.sdk.api.dsmc.operations.admin.DeleteSession.builder()
            .namespace(targetNamespace)
            .sessionID(sessionId)
            .build());

    // ESAC

    // Delete session (SessionBrowser)

    ModelsAdminSessionResponse deleteSessionResult =
        sessionBrowserWrapper.adminDeleteSession(
            AdminDeleteSession.builder().namespace(targetNamespace).sessionID(sessionId).build());

    assertNotNull(deleteSessionResult);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

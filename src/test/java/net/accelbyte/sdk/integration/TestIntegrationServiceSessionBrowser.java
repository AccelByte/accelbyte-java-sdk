/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.sessionbrowser.models.ModelsCreateSessionRequest;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsGameSessionSetting;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionResponse;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsUpdateSessionRequest;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.CreateSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.DeleteSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.GetSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.UpdateSession;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
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
public class TestIntegrationServiceSessionBrowser extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String sessionUsername = "email@example.com";
    final String sessionGameVersion = "0.3.0";
    final String sessionType = "p2p";
    final String mode = "deathmatch";
    final String mapName = "Java Server SDK Integration Test";

    final Session sessionWrapper = new Session(sdk);

    // CASE Create a session

    final ModelsCreateSessionRequest createSession =
        ModelsCreateSessionRequest.builder()
            .namespace(this.namespace)
            .sessionType(sessionType)
            .gameVersion(sessionGameVersion)
            .username(sessionUsername)
            .gameSessionSetting(
                ModelsGameSessionSetting.builder()
                    .mode(mode)
                    .allowJoinInProgress(true)
                    .mapName(mapName)
                    .maxPlayer(100)
                    .build())
            .build();

    final ModelsSessionResponse createSessionResult =
        sessionWrapper.createSession(
            CreateSession.builder().namespace(this.namespace).body(createSession).build());

    // ESAC

    assertNotNull(createSessionResult);
    assertEquals(sessionUsername, createSessionResult.getUsername());

    final String sessionId = createSessionResult.getSessionId();

    // CASE Get a session

    final ModelsSessionResponse getSessionResult =
        sessionWrapper.getSession(
            GetSession.builder().namespace(this.namespace).sessionID(sessionId).build());

    // ESAC

    assertNotNull(getSessionResult);
    assertEquals(sessionGameVersion, getSessionResult.getGameVersion());

    // CASE Update a session

    final ModelsUpdateSessionRequest updateSession =
        ModelsUpdateSessionRequest.builder().gameMaxPlayer(150).build();

    final ModelsSessionResponse updateSessionResult =
        sessionWrapper.updateSession(
            UpdateSession.builder()
                .namespace(this.namespace)
                .sessionID(sessionId)
                .body(updateSession)
                .build());

    // ESAC

    assertNotNull(updateSessionResult);
    assertEquals(150, updateSessionResult.getGameSessionSetting().getMaxPlayer());

    // CASE Delete a session

    final ModelsSessionResponse deleteSessionResult =
        sessionWrapper.deleteSession(
            DeleteSession.builder().namespace(this.namespace).sessionID(sessionId).build());

    // ESAC

    assertNotNull(deleteSessionResult);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

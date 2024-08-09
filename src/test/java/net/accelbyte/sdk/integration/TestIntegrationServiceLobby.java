/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import net.accelbyte.sdk.api.lobby.models.ModelFreeFormNotificationRequest;
import net.accelbyte.sdk.api.lobby.operations.admin.FreeFormNotification;
import net.accelbyte.sdk.api.lobby.wrappers.Admin;
import net.accelbyte.sdk.api.lobby.ws_models.PartyCreateRequest;
import net.accelbyte.sdk.core.client.LobbyWebSocketClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.jetbrains.annotations.NotNull;
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
class TestIntegrationServiceLobby extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void testLobby() throws Exception {
    final String topic = "java_server_sdk_integration_test";
    final String message = "This is a Java Server SDK integration test";

    final Admin adminWrapper = new Admin(sdk);

    // CASE Sending a free from notification to users

    final ModelFreeFormNotificationRequest notifBody =
        ModelFreeFormNotificationRequest.builder().topic(topic).message(message).build();

    adminWrapper.freeFormNotification(
        FreeFormNotification.builder().namespace(this.namespace).body(notifBody).build());

    // ESAC
  }

  @Test
  @Order(2)
  public void testLobbyWebsocket() throws Exception {
    final String request_id = TestHelper.generateRandomId(64);
    final CountDownLatch response = new CountDownLatch(1);
    final StringBuilder responseMessage = new StringBuilder();

    final WebSocketListener listener =
        new WebSocketListener() {
          @Override
          public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
            if (response.getCount() > 0) {
              responseMessage.append(text);
              response.countDown();
            }
          }
        };

    final LobbyWebSocketClient ws =
            LobbyWebSocketClient.create(
            new DefaultConfigRepository(), DefaultTokenRepository.getInstance(), listener, 0, 5, 0);

    ws.connect();

    final String requestMessage = PartyCreateRequest.builder().id(request_id).build().toWSM();

    System.out.println(requestMessage + "\n");

    ws.sendMessage(requestMessage);

    response.await(10, TimeUnit.SECONDS);

    System.out.println(responseMessage + "\n");

    ws.close(1000, "normal close");
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

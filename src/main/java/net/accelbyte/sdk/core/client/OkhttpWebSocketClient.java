/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import java.util.concurrent.TimeUnit;
import lombok.extern.java.Log;
import net.accelbyte.sdk.api.lobby.ws_models.RefreshTokenRequest;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepositoryCallback;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

@Log
public class OkhttpWebSocketClient extends TokenRepositoryCallback {

  public static OkhttpWebSocketClient create(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener listener)
      throws Exception {
    final OkHttpClient client = new OkHttpClient.Builder().readTimeout(0, TimeUnit.SECONDS).build();
    String baseURL = configRepository.getBaseURL();
    if (baseURL == null || baseURL.isEmpty()) {
      throw new IllegalArgumentException("Base URL cannot be null or empty");
    }
    String url = configRepository.getBaseURL() + "/lobby/";
    String accessToken = tokenRepository.getToken();
    Request request =
        new Request.Builder()
            .url(url)
            .addHeader("Authorization", String.format("Bearer %s", accessToken))
            .build();
    WebSocket websocket = client.newWebSocket(request, listener);
    OkhttpWebSocketClient webSocketClient = new OkhttpWebSocketClient(websocket);
    tokenRepository.registerTokenRepositoryCallback(webSocketClient);
    return webSocketClient;
  }

  private final WebSocket websocket;

  private OkhttpWebSocketClient(WebSocket websocket) {
    this.websocket = websocket;
  }

  public void sendMessage(String message) {
    if (this.websocket != null) {
      this.websocket.send(message);
    }
  }

  public void close(int code, String reason) {
    if (this.websocket != null) {
      this.websocket.close(code, reason);
    }
  }

  @Override
  public void onAccessTokenRefreshed(String newToken) {
    log.info("send websocket refresh token request because token refreshed");
    RefreshTokenRequest request =
        RefreshTokenRequest.builder().id(Helper.generateUUID()).token(newToken).build();
    sendMessage(request.toWSM());
  }
}

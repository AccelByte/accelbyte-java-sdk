/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
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

  // OkhttpWebSocketClient, with websocket reconnect disabled
  public static OkhttpWebSocketClient create(
          ConfigRepository configRepository,
          TokenRepository tokenRepository,
          WebSocketListener listener)
          throws Exception {
    return create(configRepository,
            tokenRepository,
            listener,
    -1);
  }

  // OkhttpWebSocketClient, with websocket reconnect
  // reconnectDelayMs > 0 to turn on websocket reconnect
  public static OkhttpWebSocketClient create(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener listener,
      long reconnectDelayMs)
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

    OkhttpWebSocketClient webSocketClient = new OkhttpWebSocketClient(configRepository, tokenRepository);
    ReliableWebSocketListener reliableWebSocketListener = new ReliableWebSocketListener(listener, webSocketClient, reconnectDelayMs);
    webSocketClient.setReliableWebSocketListener(reliableWebSocketListener);

    WebSocket websocket = client.newWebSocket(request, reliableWebSocketListener);
    webSocketClient.setWebsocket(websocket);

    tokenRepository.registerTokenRepositoryCallback(webSocketClient);
    return webSocketClient;
  }

  private final boolean isXHeaderLobbySessionIdEnabled = true;
  private WebSocket websocket = null;
  private final ConfigRepository configRepository;
  private final TokenRepository tokenRepository;

  private String lobbySessionId = null;
  private ReliableWebSocketListener reliableWebSocketListener;
  private OkhttpWebSocketClient(ConfigRepository configRepository,
                                TokenRepository tokenRepository) {
    this.configRepository = configRepository;
    this.tokenRepository = tokenRepository;
  }

  public void setWebsocket(WebSocket websocket) {
    this.websocket = websocket;
  }

  public void setLobbySessionId(String lobbySessionId) {
    this.lobbySessionId = lobbySessionId;
  }

  public void setReliableWebSocketListener(ReliableWebSocketListener reliableWebSocketListener) {
    this.reliableWebSocketListener = reliableWebSocketListener;
  }

  public void reconnect(long reconnectDelayMs) throws Exception {
    log.info("Reconnect with reconnectDelayMs: " + reconnectDelayMs);

    Thread.sleep(reconnectDelayMs);

    String baseURL = configRepository.getBaseURL();
    if (baseURL == null || baseURL.isEmpty()) {
      throw new IllegalArgumentException("Base URL cannot be null or empty");
    }
    String url = configRepository.getBaseURL() + "/lobby/";
    String accessToken = tokenRepository.getToken();

    Request.Builder builder =
            new Request.Builder()
                    .url(url)
                    .addHeader("Authorization", String.format("Bearer %s", accessToken));

    // inject lobby session id if not empty
    if (isXHeaderLobbySessionIdEnabled && lobbySessionId != null && !lobbySessionId.isEmpty()) {
      log.info("Adding header X-Ab-LobbySessionID: " + lobbySessionId);
      builder = builder.addHeader("X-Ab-LobbySessionID", this.lobbySessionId);
    }
    Request request = builder.build();

    final OkHttpClient client = new OkHttpClient.Builder().readTimeout(0, TimeUnit.SECONDS).build();
    this.websocket = client.newWebSocket(request, reliableWebSocketListener);
  }

  public void sendMessage(String message) {
    if (this.websocket != null) {
      this.websocket.send(message);
    }
  }

  public void close(int code, String reason) {
    if (this.tokenRepository != null) {
      log.info("Close: unregisterTokenRepositoryCallback");
      this.tokenRepository.unregisterTokenRepositoryCallback(this);
    }

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

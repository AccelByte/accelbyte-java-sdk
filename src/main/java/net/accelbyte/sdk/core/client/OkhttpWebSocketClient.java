/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import java.util.concurrent.TimeUnit;
import lombok.extern.java.Log;
import net.accelbyte.sdk.api.lobby.ws_models.ConnectNotif;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okio.ByteString;

@Log
public class OkhttpWebSocketClient extends WebSocketListener {

  // OkhttpWebSocketClient, with websocket reconnect disabled
  public static OkhttpWebSocketClient create(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener listener)
      throws Exception {
    return create(configRepository, tokenRepository, listener, 0, 0);
  }

  // OkhttpWebSocketClient, with websocket reconnect
  // reconnectDelayMs = 0 to turn off websocket reconnect
  // pingIntervalMs = 0 to turn off websocket ping frames
  public static OkhttpWebSocketClient create(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener listener,
      int reconnectDelayMs,
      int pingIntervalMs)
      throws Exception {
    if (configRepository == null)
      throw new IllegalArgumentException("configRepository can't be null");
    if (tokenRepository == null)
      throw new IllegalArgumentException("tokenRepository can't be null");
    if (listener == null) throw new IllegalArgumentException("listener can't be null");

    if (reconnectDelayMs < 0)
      throw new IllegalArgumentException("reconnectDelayMs can't be negative");
    if (pingIntervalMs < 0) throw new IllegalArgumentException("pingIntervalMs can't be negative");

    OkhttpWebSocketClient webSocketClient =
        new OkhttpWebSocketClient(
            configRepository, tokenRepository, listener, reconnectDelayMs, pingIntervalMs);
    return webSocketClient;
  }

  private static final int WS_CODE_NORMAL_CLOSURE = 1000;
  private static final int WS_CODE_DISCONNECT_WITHOUT_RECONNECT = 4000;
  private static final boolean isXHeaderLobbySessionIdEnabled = false;

  private OkHttpClient client;
  private WebSocket websocket = null;
  private final ConfigRepository configRepository;
  private final TokenRepository tokenRepository;
  private final WebSocketListener webSocketListener;
  private String lobbySessionId = null;
  private TokenRepositoryCallbackListener tokenRepositoryCallbackListener;
  private boolean isSocketConnected = false;
  private int pingIntervalMs;
  private int reconnectDelayMs;

  private OkhttpWebSocketClient(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener webSocketListener,
      int reconnectDelayMs,
      int pingIntervalMs)
      throws Exception {
    this.configRepository = configRepository;
    this.tokenRepository = tokenRepository;
    this.webSocketListener = webSocketListener;
    this.pingIntervalMs = pingIntervalMs;
    this.reconnectDelayMs = reconnectDelayMs;
    if (isReconnectEnabled()) {
      log.info("Websocket Reconnect Interval: " + reconnectDelayMs + "ms");
    } else {
      log.info("Websocket Reconnect is disabled");
    }

    this.client = constructOkHttpClient();

    createNewWebSocket();

    this.tokenRepositoryCallbackListener =
        new TokenRepositoryCallbackListener(tokenRepository, this);
    registerCallbacks();
  }

  private void createNewWebSocket() throws Exception {
    final Request request = constructOkHttpRequest();
    this.websocket = client.newWebSocket(request, this);
  }

  private void reconnect() throws Exception {
    try {
      log.info("Attempting to reconnect in " + reconnectDelayMs + "ms");
      Thread.sleep(reconnectDelayMs);

      createNewWebSocket();
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private Request constructOkHttpRequest() throws Exception {
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
      builder = builder.addHeader("X-Ab-LobbySessionID", lobbySessionId);
    }

    return builder.build();
  }

  private OkHttpClient constructOkHttpClient() {
    final OkHttpClient.Builder builder =
        new OkHttpClient.Builder().readTimeout(0, TimeUnit.MILLISECONDS);

    if (isAutomaticPingEnabled()) {
      log.info("Websocket Ping Interval: " + this.pingIntervalMs + "ms");
      builder.pingInterval(this.pingIntervalMs, TimeUnit.MILLISECONDS);
    } else {
      log.info("Websocket Automatic Ping is disabled");
    }

    return builder.build();
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
  public void onOpen(WebSocket webSocket, okhttp3.Response response) {
    super.onOpen(webSocket, response);

    isSocketConnected = true;
    log.info("Websocket is opened successfully");

    webSocketListener.onOpen(webSocket, response);
  }

  @Override
  public void onMessage(WebSocket webSocket, String text) {
    super.onMessage(webSocket, text);

    if (text.contains("connectNotif")) {
      final ConnectNotif notif = ConnectNotif.createFromWSM(text);
      final String lobbySessionId = notif.getLobbySessionID();
      log.info("lobbySessionID: " + lobbySessionId);
      this.lobbySessionId = lobbySessionId;
    }

    webSocketListener.onMessage(webSocket, text);
  }

  @Override
  public void onMessage(WebSocket webSocket, ByteString bytes) {
    super.onMessage(webSocket, bytes);

    webSocketListener.onMessage(webSocket, bytes);
  }

  @Override
  public void onClosing(WebSocket webSocket, int code, String reason) {
    super.onClosing(webSocket, code, reason);

    log.info("onClosing: " + code + " / " + reason);
    webSocketListener.onClosing(webSocket, code, reason);

    close(code, reason);
  }

  @Override
  public void onClosed(WebSocket webSocket, int code, String reason) {
    super.onClosed(webSocket, code, reason);

    isSocketConnected = false;
    log.info("onClosed: " + code + " / " + reason);

    webSocketListener.onClosed(webSocket, code, reason);

    if (shouldReconnectOnClosed(code)) {
      try {
        reconnect();
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    } else {
      unregisterCallbacks();
    }
  }

  @Override
  public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
    super.onFailure(webSocket, t, response);

    isSocketConnected = false;
    log.info("onFailure: " + t.getMessage());

    webSocketListener.onFailure(webSocket, t, response);

    if (shouldReconnectOnFailure()) {
      try {
        reconnect();
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    } else {
      unregisterCallbacks();
    }
  }

  private boolean shouldReconnectOnClosed(int code) {
    return (isReconnectEnabled()
        && !isSocketConnected
        && code < WS_CODE_DISCONNECT_WITHOUT_RECONNECT
        && code != WS_CODE_NORMAL_CLOSURE);
  }

  private boolean shouldReconnectOnFailure() {
    return (isReconnectEnabled() && !isSocketConnected);
  }

  private boolean isReconnectEnabled() {
    return this.reconnectDelayMs > 0;
  }

  private boolean isAutomaticPingEnabled() {
    return this.pingIntervalMs > 0;
  }

  private void registerCallbacks() {
    tokenRepositoryCallbackListener.registerCallback();
  }

  private void unregisterCallbacks() {
    tokenRepositoryCallbackListener.unregisterCallback();
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import lombok.extern.java.Log;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okio.ByteString;

@Log
public class BaseWebSocketClient extends WebSocketListener {
  // reconnectDelayMs = 0 to turn off websocket reconnect
  // maxNumReconnectAttempts = -1 for unlimited reconnect attempts, given reconnectDelayMs > 0
  // pingIntervalMs = 0 to turn off websocket ping frames
  public static BaseWebSocketClient create(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener listener,
      int reconnectDelayMs,
      int maxNumReconnectAttempts,
      int pingIntervalMs,
      String wsServicePathName)
      throws Exception {
    BaseWebSocketClient webSocketClient =
        new BaseWebSocketClient(
            configRepository,
            tokenRepository,
            listener,
            reconnectDelayMs,
            maxNumReconnectAttempts,
            pingIntervalMs,
            wsServicePathName);
    return webSocketClient;
  }

  protected OkHttpClient client;
  protected WebSocket websocket = null;
  protected final ConfigRepository configRepository;
  protected final TokenRepository tokenRepository;
  protected final WebSocketListener webSocketListener;
  protected boolean isSocketConnected = false;
  protected int pingIntervalMs;
  protected int reconnectDelayMs;
  protected int maxNumReconnectAttempts;
  protected int numReconnectAttempts;
  protected String wsUrl;
  protected HashMap<String, Object> dataMap = new HashMap<>();

  public Object getData(String key) {
    return dataMap.get(key);
  }

  public boolean hasData(String key) {
    return null != dataMap.get(key);
  }

  protected void setData(String key, Object value) {
    dataMap.put(key, value);
  }

  protected void clearData(String key) {
    dataMap.remove(key);
  }

  protected void clearAllData() {
    dataMap.clear();
  }

  protected HashMap<String, String> headers = new HashMap<>();

  public BaseWebSocketClient(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener webSocketListener,
      int reconnectDelayMs,
      int maxNumReconnectAttempts,
      int pingIntervalMs,
      String wsServicePathName) {

    if (configRepository == null)
      throw new IllegalArgumentException("configRepository can't be null");
    if (tokenRepository == null)
      throw new IllegalArgumentException("tokenRepository can't be null");
    if (webSocketListener == null) throw new IllegalArgumentException("listener can't be null");
    if (reconnectDelayMs < 0)
      throw new IllegalArgumentException("reconnectDelayMs can't be negative");
    if (maxNumReconnectAttempts == 0)
      throw new IllegalArgumentException("maxNumReconnectAttempts can't be 0");
    if (pingIntervalMs < 0) throw new IllegalArgumentException("pingIntervalMs can't be negative");

    if (wsServicePathName == null)
      throw new IllegalArgumentException("Websocket service path name can't be null");
    if (wsServicePathName.isEmpty())
      throw new IllegalArgumentException("Websocket service path name can't be an empty string");

    this.configRepository = configRepository;
    this.tokenRepository = tokenRepository;
    this.webSocketListener = webSocketListener;
    this.pingIntervalMs = pingIntervalMs;
    this.maxNumReconnectAttempts = maxNumReconnectAttempts;
    this.reconnectDelayMs = reconnectDelayMs;
    this.wsUrl = configRepository.getBaseURL() + "/" + wsServicePathName + "/";

    if (isReconnectEnabled()) {
      log.info("Websocket Reconnect Interval (initial w/ exp backoff): " + reconnectDelayMs + "ms");
    } else {
      log.info("Websocket Reconnect is disabled");
    }

    this.client = constructOkHttpClient();
  }

  // get sleep time in ms
  private long reconnectDelay(int numberOfAttempts) {
    final double BACKOFF_RATE = 2.0;
    return (reconnectDelayMs * (long) Math.pow(BACKOFF_RATE, numberOfAttempts - 1));
  }

  public void connect() throws Exception {
    connect(false);
  }

  public void connect(boolean isReconnecting) throws Exception {
    try {
      if (isReconnecting) {
        numReconnectAttempts++;
        long currentReconnectDelayMs = reconnectDelay(numReconnectAttempts);
        log.info(
            "# reconnect attempts: "
                + numReconnectAttempts
                + ", attempting to reconnect in "
                + currentReconnectDelayMs
                + "ms");
        Thread.sleep(currentReconnectDelayMs);
      }

      log.info("connecting to websocket");
      final Request request = constructOkHttpRequest();
      this.websocket = client.newWebSocket(request, this);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  private Request constructOkHttpRequest() throws Exception {
    String baseURL = configRepository.getBaseURL();
    if (baseURL == null || baseURL.isEmpty()) {
      throw new IllegalArgumentException("Base URL cannot be null or empty");
    }
    String accessToken = tokenRepository.getToken();

    Request.Builder builder =
        new Request.Builder()
            .url(wsUrl)
            .addHeader("Authorization", String.format("Bearer %s", accessToken));

    if (!headers.isEmpty()) {
      headers.forEach((k, v) -> builder.addHeader(k, v));
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
    numReconnectAttempts = 0;

    super.onOpen(webSocket, response);

    isSocketConnected = true;
    log.info("Websocket is opened successfully");

    webSocketListener.onOpen(webSocket, response);
  }

  @Override
  public void onMessage(WebSocket webSocket, String text) {
    super.onMessage(webSocket, text);

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

  public boolean isConnected() {
    return isSocketConnected;
  }

  @Override
  public void onClosed(WebSocket webSocket, int code, String reason) {
    super.onClosed(webSocket, code, reason);

    isSocketConnected = false;

    log.info("onClosed: " + code + " / " + reason);

    webSocketListener.onClosed(webSocket, code, reason);

    if (shouldReconnect(code, reason, this.numReconnectAttempts)) {
      try {
        connect(true);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    } else {
      clearAllData();
    }
  }

  @Override
  public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
    super.onFailure(webSocket, t, response);

    isSocketConnected = false;

    log.info("onFailure: " + t.getMessage());

    webSocketListener.onFailure(webSocket, t, response);

    if (shouldReconnectOnFailure(this.numReconnectAttempts)) {
      try {
        connect(true);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    } else {
      clearAllData();
    }
  }

  protected boolean shouldReconnect(int code) {
    return shouldReconnect(code, "");
  }

  protected boolean shouldReconnect(int code, String reason) {
    return shouldReconnect(code, reason, -1);
  }

  protected boolean shouldReconnect(int code, String reason, int numReconnectAttempts) {
    if (isReconnectEnabled()) {
      if (isExceedingMaxAttempts(numReconnectAttempts)) {
        return false;
      }

      return (code >= 1001 && code <= 2999);
    }

    return false;
  }

  protected boolean shouldReconnectOnFailure() {
    return shouldReconnectOnFailure(0);
  }

  protected boolean shouldReconnectOnFailure(int numReconnectAttempts) {
    if (isReconnectEnabled()) {
      if (isExceedingMaxAttempts(numReconnectAttempts)) {
        return false;
      }

      return true;
    }

    return false;
  }

  private boolean isExceedingMaxAttempts(int numReconnectAttempts) {
    return this.maxNumReconnectAttempts > 0
        && numReconnectAttempts > 0
        && numReconnectAttempts >= this.maxNumReconnectAttempts;
  }

  protected boolean isReconnectEnabled() {
    return this.reconnectDelayMs > 0;
  }

  private boolean isAutomaticPingEnabled() {
    return this.pingIntervalMs > 0;
  }
}

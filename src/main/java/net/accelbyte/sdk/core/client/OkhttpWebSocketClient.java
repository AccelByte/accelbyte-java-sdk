package net.accelbyte.sdk.core.client;

import lombok.extern.java.Log;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.WebSocketListener;

@Log
// @deprecated 2024-08-08 - Use LobbyWebSocketClient instead as it allows you flexibility to control
// when to trigger connect().
@Deprecated
public class OkhttpWebSocketClient extends LobbyWebSocketClient {

  // OkhttpWebSocketClient, with websocket reconnect disabled
  public static OkhttpWebSocketClient create(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener listener)
      throws Exception {
    OkhttpWebSocketClient webSocketClient =
        new OkhttpWebSocketClient(configRepository, tokenRepository, listener, 0, 0);
    return webSocketClient;
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
    OkhttpWebSocketClient webSocketClient =
        new OkhttpWebSocketClient(
            configRepository, tokenRepository, listener, reconnectDelayMs, pingIntervalMs);
    return webSocketClient;
  }

  // reconnectDelayMs = 0 to turn off websocket reconnect
  // pingIntervalMs = 0 to turn off websocket ping frames
  public OkhttpWebSocketClient(
      ConfigRepository configRepository,
      TokenRepository tokenRepository,
      WebSocketListener webSocketListener,
      int reconnectDelayMs,
      int pingIntervalMs)
      throws Exception {
    super(
        configRepository, tokenRepository, webSocketListener, reconnectDelayMs, -1, pingIntervalMs);

    connect();
  }
}

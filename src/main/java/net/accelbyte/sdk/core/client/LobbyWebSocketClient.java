package net.accelbyte.sdk.core.client;

import lombok.extern.java.Log;
import net.accelbyte.sdk.api.lobby.ws_models.ConnectNotif;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

@Log
public class LobbyWebSocketClient extends BaseWebSocketClient {
    public static String LOBBY_SESSION_ID_DATAMAP_KEY = "lobbySessionId";
    private static String WS_SERVICE_PATH_NAME = "lobby";
    private TokenRepositoryCallbackListener tokenRepositoryCallbackListener;
    public static LobbyWebSocketClient create(
            ConfigRepository configRepository,
            TokenRepository tokenRepository,
            WebSocketListener listener) throws Exception {
        LobbyWebSocketClient webSocketClient =
                new LobbyWebSocketClient(
                        configRepository, tokenRepository, listener, 0, -1, 0);
        return webSocketClient;
    }

    // reconnectDelayMs = 0 to turn off websocket reconnect
    // maxNumReconnectAttempts = -1 for unlimited reconnect attempts, given reconnectDelayMs > 0
    // pingIntervalMs = 0 to turn off websocket ping frames
    public static LobbyWebSocketClient create(
            ConfigRepository configRepository,
            TokenRepository tokenRepository,
            WebSocketListener listener,
            int reconnectDelayMs,
            int maxNumReconnectAttempts,
            int pingIntervalMs)
            throws Exception {
        LobbyWebSocketClient webSocketClient =
                new LobbyWebSocketClient(
                        configRepository, tokenRepository, listener, reconnectDelayMs, maxNumReconnectAttempts, pingIntervalMs);
        return webSocketClient;
    }

    // reconnectDelayMs = 0 to turn off websocket reconnect
    // pingIntervalMs = 0 to turn off websocket ping frames
    public LobbyWebSocketClient(
            ConfigRepository configRepository,
            TokenRepository tokenRepository,
            WebSocketListener webSocketListener,
            int reconnectDelayMs,
            int maxNumReconnectAttempts,
            int pingIntervalMs)
            throws Exception {
        super(configRepository, tokenRepository, webSocketListener, reconnectDelayMs, maxNumReconnectAttempts, pingIntervalMs, WS_SERVICE_PATH_NAME);

        this.tokenRepositoryCallbackListener =
                new TokenRepositoryCallbackListener(tokenRepository, this);
    }

    @Override
    public void onMessage(WebSocket webSocket, String text) {
        if (text.contains(ConnectNotif.getType())) {
            final ConnectNotif notif = ConnectNotif.createFromWSM(text);
            final String lobbySessionId = notif.getLobbySessionID();
            log.info("lobbySessionID: " + lobbySessionId);

            this.setData(LOBBY_SESSION_ID_DATAMAP_KEY, lobbySessionId);
        }

        super.onMessage(webSocket, text);
    }

    @Override
    public void connect(boolean isReconnecting) throws Exception {
        if (isReconnecting && this.hasData(LOBBY_SESSION_ID_DATAMAP_KEY)) {
            String lobbySessionId = (String) this.getData(LOBBY_SESSION_ID_DATAMAP_KEY);
            this.headers.put("X-Ab-LobbySessionID", lobbySessionId);
        }

        super.connect(isReconnecting);
    }

    @Override
    public void onOpen(WebSocket webSocket, Response response) {
        numReconnectAttempts = 0;

        isSocketConnected = true;
        log.info("Websocket is opened successfully");

        // register cbs first, then notify listener onOpen
        registerCallbacks();
        webSocketListener.onOpen(webSocket, response);
    }

    @Override
    public void onClosing(WebSocket webSocket, int code, String reason) {
        unregisterCallbacks();
        super.onClosing(webSocket, code, reason);
    }

    @Override
    public void onFailure(WebSocket webSocket, Throwable t, Response response) {
        unregisterCallbacks();
        super.onFailure(webSocket, t, response);
    }

    private void registerCallbacks() {
        tokenRepositoryCallbackListener.registerCallback();
    }

    private void unregisterCallbacks() {
        tokenRepositoryCallbackListener.unregisterCallback();
    }
}

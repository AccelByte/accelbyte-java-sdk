package net.accelbyte.sdk.core.client;

import lombok.extern.java.Log;
import net.accelbyte.sdk.api.lobby.ws_models.ConnectNotif;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.*;

@Log
public class LobbyWebSocketClient extends BaseWebSocketClient {
    private static String LOBBY_SESSION_ID_DATAMAP_KEY = "lobbySessionId";
    private static String WS_SERVICE_PATH_NAME = "lobby";
    private static final boolean isXHeaderLobbySessionIdEnabled = false;

    private TokenRepositoryCallbackListener tokenRepositoryCallbackListener;

    // reconnectDelayMs = 0 to turn off websocket reconnect
    // pingIntervalMs = 0 to turn off websocket ping frames
    public static LobbyWebSocketClient create(
            ConfigRepository configRepository,
            TokenRepository tokenRepository,
            WebSocketListener listener,
            int reconnectDelayMs,
            int pingIntervalMs)
            throws Exception {
        LobbyWebSocketClient webSocketClient =
                new LobbyWebSocketClient(
                        configRepository, tokenRepository, listener, reconnectDelayMs, pingIntervalMs);
        return webSocketClient;
    }

    // reconnectDelayMs = 0 to turn off websocket reconnect
    // pingIntervalMs = 0 to turn off websocket ping frames
    public LobbyWebSocketClient(
            ConfigRepository configRepository,
            TokenRepository tokenRepository,
            WebSocketListener webSocketListener,
            int reconnectDelayMs,
            int pingIntervalMs)
            throws Exception {
        super(configRepository, tokenRepository, webSocketListener, reconnectDelayMs, pingIntervalMs, WS_SERVICE_PATH_NAME);

        this.tokenRepositoryCallbackListener =
                new TokenRepositoryCallbackListener(tokenRepository, this);
        registerCallbacks();
    }

    @Override
    public void onMessage(WebSocket webSocket, String text) {
        if (text.contains("connectNotif")) {
            final ConnectNotif notif = ConnectNotif.createFromWSM(text);
            final String lobbySessionId = notif.getLobbySessionID();
            log.info("lobbySessionID: " + lobbySessionId);

            this.setData(LOBBY_SESSION_ID_DATAMAP_KEY, lobbySessionId);
        }

        super.onMessage(webSocket, text);
    }

    @Override
    public void onClosed(WebSocket webSocket, int code, String reason) {
        super.onClosed(webSocket, code, reason);

        if (!shouldReconnect(code, reason)) {
            unregisterCallbacks();
        }
    }

    @Override
    public void onFailure(WebSocket webSocket, Throwable t, Response response) {
        super.onFailure(webSocket, t, response);

        if (shouldReconnectOnFailure()) {
            unregisterCallbacks();
        }
    }

    @Override
    public void connect(boolean isReconnecting) throws Exception {
        if (isReconnecting && this.hasData(LOBBY_SESSION_ID_DATAMAP_KEY)) {
            String lobbySessionId = (String) this.getData(LOBBY_SESSION_ID_DATAMAP_KEY);
            this.headers.put("X-Ab-LobbySessionID", lobbySessionId);
        }

        super.connect(isReconnecting);
    }

    private void registerCallbacks() {
        tokenRepositoryCallbackListener.registerCallback();
    }

    private void unregisterCallbacks() {
        tokenRepositoryCallbackListener.unregisterCallback();
    }
}

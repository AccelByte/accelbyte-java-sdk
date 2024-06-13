/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import lombok.extern.java.Log;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okio.ByteString;

import java.util.Map;

import static net.accelbyte.sdk.core.util.Helper.parseWSM;
@Log
public class WebSocketListenerWrapper extends WebSocketListener {
    private final WebSocketListener wrappedListener;
    private final OkhttpWebSocketClient okhttpWebSocketClient;
    private final long reconnectDelayMs;
    private boolean isReconnectOnClosing;
    // reconnectDelayMs > 0 to turn on websocket reconnect
    public WebSocketListenerWrapper(WebSocketListener wrappedListener, OkhttpWebSocketClient okhttpWebSocketClient, long reconnectDelayMs, boolean isReconnectOnClosing) {
        if (wrappedListener == null) throw new IllegalArgumentException("wrappedListener can't be null");
        if (okhttpWebSocketClient == null) throw new IllegalArgumentException("okhttpWebSocketClient can't be null");

        this.wrappedListener = wrappedListener;
        this.okhttpWebSocketClient = okhttpWebSocketClient;
        this.reconnectDelayMs = reconnectDelayMs;
        this.isReconnectOnClosing = isReconnectOnClosing;
    }

    @Override
    public void onOpen(WebSocket webSocket, okhttp3.Response response) {
        wrappedListener.onOpen(webSocket, response);
    }

    /* Temp workaround until OpenAPI is fixed for the casing of lobby session id from "lobbySessionId" to "lobbySessionID"
    https://bitbucket.org/accelbyte/justice-codegen-sdk-spec/src/master/spec/stage_main/lobby.schema.yaml
        connectNotif:
        properties:
          lobbySessionId:    << should be lobbySessionID
            type: string
     */
    public static String createFromWSMWorkaround(String message) {
        final String LOBBY_SESSION_ID_KEY = "lobbySessionID";
        Map<String, String> response = parseWSM(message);
        String lobbySessionId =
                response.get(LOBBY_SESSION_ID_KEY) != null ? response.get(LOBBY_SESSION_ID_KEY) : null;
        return lobbySessionId;
    }

    @Override
    public void onMessage(WebSocket webSocket, String text) {
        if (text.contains("connectNotif")) {
// Uncommented when OpenAPI spec indicated above is fixed:
//            ConnectNotif notif = ConnectNotif.createFromWSM(text);
//            final String lobbySessionId = notif.getLobbySessionId();
            final String lobbySessionId = createFromWSMWorkaround(text);

            log.info("WebSocketListenerWrapper - lobbySessionId: " + lobbySessionId);

            okhttpWebSocketClient.setLobbySessionId(lobbySessionId);
        }

        log.info("WebSocketListenerWrapper onMessage: " + text);

        // Additional handling
        wrappedListener.onMessage(webSocket, text);
    }

    @Override
    public void onMessage(WebSocket webSocket, ByteString bytes) {
        // Additional handling
        wrappedListener.onMessage(webSocket, bytes);
    }

    @Override
    public void onClosing(WebSocket webSocket, int code, String reason) {
        log.info("WebSocketListenerWrapper onClosing: " + code + " / " + reason);

        okhttpWebSocketClient.close(code, null);

        if (isReconnectOnClosing) {
            reconnect();
        }

        wrappedListener.onClosing(webSocket, code, reason);
    }

    @Override
    public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
        log.info("WebSocketListenerWrapper onFailure: " + t.getMessage());
        reconnect();
        wrappedListener.onFailure(webSocket, t, response);
    }

    private void reconnect() {
        // Reconnect if reconnectDelaySecs > 0, disabled <= 0
        if (reconnectDelayMs > 0) {
            try {
                okhttpWebSocketClient.reconnect(reconnectDelayMs);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }
}
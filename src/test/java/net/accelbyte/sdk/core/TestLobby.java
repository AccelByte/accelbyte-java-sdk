/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.extern.java.Log;
import net.accelbyte.sdk.api.lobby.ws_models.ConnectNotif;
import net.accelbyte.sdk.api.lobby.ws_models.PartyCreateRequest;
import net.accelbyte.sdk.api.lobby.ws_models.RefreshTokenRequest;
import net.accelbyte.sdk.core.client.LobbyWebSocketClient;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import okhttp3.*;
import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import static org.junit.jupiter.api.Assertions.*;

@Log
@Tag("test-core")
class TestLobby {
  private final OkHttpClient client = new OkHttpClient();
    public class TestLobbyListener extends WebSocketListener {

        @Getter
        private String lobbySessionId;

        @Getter
        private String token;

        @Getter
        private int numPartyCreateRequestsReceived;

        @Getter
        private CountDownLatch lobbySesionIdLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch tokenLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch partyRequestLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch onOpenedLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch onClosedLatch = new CountDownLatch(1);

        public void resetLobbySessionIdLatch() {
            lobbySesionIdLatch = new CountDownLatch(1);
        }

        public void resetTokenLatch() {
            tokenLatch = new CountDownLatch(1);
        }

        public void resetOnOpenedLatch() {
            onOpenedLatch = new CountDownLatch(1);
        }

        public void resetOnClosedLatch() {
            onClosedLatch = new CountDownLatch(1);
        }

        public void resetPartyRequestLatch() {
            partyRequestLatch = new CountDownLatch(1);
        }

        public void resetNumPartyCreateRequestsReceived() {
            numPartyCreateRequestsReceived = 0;
        }
        @Override
        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
            log.info("Client onMessage: --> " + text);
            if (text.contains(ConnectNotif.getType())) {
                final ConnectNotif notif = ConnectNotif.createFromWSM(text);
                lobbySessionId = notif.getLobbySessionID();
                log.info("lobbySessionID: " + lobbySessionId);
                lobbySesionIdLatch.countDown();
            } else if (text.contains(RefreshTokenRequest.getType())) {
                final RefreshTokenRequest notif = RefreshTokenRequest.createFromWSM(text);
                token = notif.getToken();
                log.info("Refreshed token: " + token);
                tokenLatch.countDown();
            } else if (text.contains(PartyCreateRequest.getType())) {
                final PartyCreateRequest notif = PartyCreateRequest.createFromWSM(text);
                log.info("Party create request id: " + notif.getId());
                numPartyCreateRequestsReceived++;
                partyRequestLatch.countDown();
            }
        }

        @Override
        public void onOpen(WebSocket webSocket, Response response) {
            onOpenedLatch.countDown();
            log.info("Client onOpen");
        }

        @Override
        public void onClosing(WebSocket webSocket, int code, String reason) {
            log.info("Client onClosing");
        }

        @Override
        public void onClosed(WebSocket webSocket, int code, String reason) {
            onClosedLatch.countDown();
            log.info("Client onClosed");
        }

        @Override
        public void onFailure(WebSocket webSocket, Throwable t, Response response) {
            log.info("Client onFailure");
        }
    }

    public void forceCloseMockServer(String baseUrl, int statusCode, TestLobbyListener lobbyListener) throws Exception {
        // reset onOpened and onClosed latches prior
        lobbyListener.resetOnClosedLatch();
        lobbyListener.resetOnOpenedLatch();

        // Build the POST request without a body
        Request request = new Request.Builder()
                .url(baseUrl + "/ws/lobby/force-close?errorCode=" + statusCode)
                .post(RequestBody.create(null, new byte[0])) // Use an empty body
                .build();

        // Execute the request and get the response
        try (Response response = client.newCall(request).execute()) {
            // Assert the status code of the response
            assertEquals(204, response.code());     // 204 No Content
        }
    }

    // Verifies a ws closure of 2000 status code will yield auto-reconnect, and the previous lobby session id will be reused
    // In conjunction validates the lobby token refresh for the ws event still works after reconnect
    @Test
    public void testLobbyReconnectWithTokenRefresh() throws Exception {
        final int FORCE_WS_CLOSE_STATUS_CODE = 2000;
        final int RECONNECT_DELAY_MS = 3000;
        final int PING_INTERVAL_MS = 1000;
        final int MAX_NUM_RECONNECT_ATTEMPTS = 10;

        final MockServerConfigRepository configRepo = new MockServerConfigRepository();

        final TestLobbyListener lobbyListener = new TestLobbyListener();

        final LobbyWebSocketClient ws =
            LobbyWebSocketClient.create(
                configRepo,
                DefaultTokenRepository.getInstance(),
                lobbyListener,
                RECONNECT_DELAY_MS,
                MAX_NUM_RECONNECT_ATTEMPTS,
                PING_INTERVAL_MS);

        // Connect to the Mock Server’s Lobby Service.
        ws.connect();

        // Assert we're connected
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Await for the connectNotif message, or timeout
        lobbyListener.getLobbySesionIdLatch().await(5, TimeUnit.SECONDS);
        lobbyListener.resetLobbySessionIdLatch();

        // Assert that the value from the WebSocket Client using GetData("LobbySessionId") is equal to originalLobbySessionId.
        String originalLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(lobbyListener.getLobbySessionId(), originalLobbySessionId);

        // Force close the Mock Server WS connection
        log.info("force closing mock server - status " + FORCE_WS_CLOSE_STATUS_CODE);
        forceCloseMockServer(configRepo.getBaseURL(), FORCE_WS_CLOSE_STATUS_CODE, lobbyListener);

        // Assert that the websocket connection has disconnected.
        lobbyListener.getOnClosedLatch().await(RECONNECT_DELAY_MS, TimeUnit.MILLISECONDS);
        assertFalse(ws.isConnected());
        lobbyListener.resetOnClosedLatch();

        // Assert that the websocket connection has reconnected.
        lobbyListener.getOnOpenedLatch().await(RECONNECT_DELAY_MS + 2000, TimeUnit.MILLISECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        String newLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(lobbyListener.getLobbySessionId(), newLobbySessionId);

        // Assert that the originalLobbySessionId is equal to newLobbySessionId
        assertEquals(originalLobbySessionId, newLobbySessionId);

        // Manually trigger a token refresh to test the token callback still works to trigger a ws message -> echo back
        lobbyListener.resetTokenLatch();
        DefaultTokenRepository.getInstance().storeToken("mockToken1");
        // only the 2nd token will trigger a token refresh (by design)
        DefaultTokenRepository.getInstance().storeToken("mockToken2");
        lobbyListener.getTokenLatch().await(20, TimeUnit.SECONDS);
        log.info("waited for token message arrived, or timed out");
        assertEquals("mockToken2", lobbyListener.getToken());

        ws.close(1000, "Normal close");
    }

    @Test
    public void testLobbyReconnectWithMultipleMessages() throws Exception {
        final int FORCE_WS_CLOSE_STATUS_CODE = 2000;
        final int RECONNECT_DELAY_MS = 2000;
        final int PING_INTERVAL_MS = 1000;
        final int MAX_NUM_RECONNECT_ATTEMPTS = 10;

        final MockServerConfigRepository configRepo = new MockServerConfigRepository();

        final TestLobbyListener lobbyListener = new TestLobbyListener();

        final LobbyWebSocketClient ws =
                LobbyWebSocketClient.create(
                        configRepo,
                        DefaultTokenRepository.getInstance(),
                        lobbyListener,
                        RECONNECT_DELAY_MS,
                        MAX_NUM_RECONNECT_ATTEMPTS,
                        PING_INTERVAL_MS);

        // Connect to the Mock Server’s Lobby Service.
        ws.connect();

        // Assert we're connected
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // sends a party request message (partyCreateRequestId_1)
        ws.sendMessage(PartyCreateRequest.builder().id("partyCreateRequestId_1").build().toWSM());

        // awaits for the party request message to be echo-ed back
        lobbyListener.getPartyRequestLatch().await(3, TimeUnit.SECONDS);
        lobbyListener.resetPartyRequestLatch();

        // Force close the Mock Server WS connection
        log.info("force closing mock server - status " + FORCE_WS_CLOSE_STATUS_CODE);
        forceCloseMockServer(configRepo.getBaseURL(), FORCE_WS_CLOSE_STATUS_CODE, lobbyListener);

        // Assert that the websocket connection has disconnected.
        lobbyListener.getOnClosedLatch().await(RECONNECT_DELAY_MS, TimeUnit.MILLISECONDS);
        assertFalse(ws.isConnected());
        lobbyListener.resetOnClosedLatch();

        // Assert that the websocket connection has reconnected.
        lobbyListener.getOnOpenedLatch().await(RECONNECT_DELAY_MS + 5000, TimeUnit.MILLISECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Multiple ws events check (1 before reconnect, 2 after reconnect)
        // Sends a party request message (partyCreateRequestId_2 & partyCreateRequestId_3)
        int NUM_MSG_TO_SEND = 3;
        for (int i=2; i <= NUM_MSG_TO_SEND; i++) {
            ws.sendMessage(PartyCreateRequest.builder().id("partyCreateRequestId_" + i).build().toWSM());
            // awaits for the party request message to be echo-ed back
            lobbyListener.getPartyRequestLatch().await(3, TimeUnit.SECONDS);
            lobbyListener.resetPartyRequestLatch();
        }

        // Lastly, check if have gotten NUM_MSG_TO_SEND party create requests (1 before disconnect + NUM_MSG_TO_SEND-1 after reconnection)
        assertEquals(NUM_MSG_TO_SEND, lobbyListener.getNumPartyCreateRequestsReceived());

        ws.close(1000, "Normal close");
    }

    // Verifies that a closure code of 4000 (DisconnectServerShutdown) code will not reconnect
    // Ensures a subsequent new websocket the lobby session id will use a different one
    @Test
    public void testLobbyDisconnectServerShutdown() throws Exception {
        final int FORCE_WS_CLOSE_STATUS_CODE = 4000;
        final int RECONNECT_DELAY_MS = 2000;
        final int PING_INTERVAL_MS = 1000;
        final int MAX_NUM_RECONNECT_ATTEMPTS = 10;

        final MockServerConfigRepository configRepo = new MockServerConfigRepository();

        final TestLobbyListener lobbyListener = new TestLobbyListener();

        LobbyWebSocketClient ws =
                LobbyWebSocketClient.create(
                        configRepo,
                        DefaultTokenRepository.getInstance(),
                        lobbyListener,
                        RECONNECT_DELAY_MS,
                        MAX_NUM_RECONNECT_ATTEMPTS,
                        PING_INTERVAL_MS);

        // Connect to the Mock Server’s Lobby Service.
        ws.connect();

        // Await for the connectNotif message, or timeout
        lobbyListener.getLobbySesionIdLatch().await(10, TimeUnit.SECONDS);
        lobbyListener.resetLobbySessionIdLatch();

        // Assert we're connected
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Assert that the value from the WebSocket Client using GetData("LobbySessionId") is equal to originalLobbySessionId.
        final String originalLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(lobbyListener.getLobbySessionId(), originalLobbySessionId);

        // Force close the Mock Server WS connection
        log.info("force closing mock server - status " + FORCE_WS_CLOSE_STATUS_CODE);
        forceCloseMockServer(configRepo.getBaseURL(), FORCE_WS_CLOSE_STATUS_CODE, lobbyListener);

        // make sure we get onClosed
        lobbyListener.getOnClosedLatch().await(RECONNECT_DELAY_MS, TimeUnit.MILLISECONDS);
        lobbyListener.resetOnClosedLatch();

        // Wait for X second to allow reconnection to happen (shouldn't be).
        Thread.sleep(RECONNECT_DELAY_MS + 3000);
        // Assert that the websocket connection is still disconnected and didn't reconnect
        assertFalse(ws.isConnected());

        // Assert that the value from the WebSocket Client using GetData("LobbySessionId") is null
        String newLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(null, newLobbySessionId);

        // Start a new connection to the Mock Server’s Lobby Service.
        ws = LobbyWebSocketClient.create(
                configRepo,
                DefaultTokenRepository.getInstance(),
                lobbyListener,
                MAX_NUM_RECONNECT_ATTEMPTS,
                RECONNECT_DELAY_MS,
                PING_INTERVAL_MS);

        ws.connect();

        // Wait til onOpened
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Wait for the connectNotif message, store lobbySessionId from the connectNotif message into the temporary variable: newLobbySessionId.
        lobbyListener.getLobbySesionIdLatch().await(10, TimeUnit.SECONDS);
        lobbyListener.resetLobbySessionIdLatch();
        newLobbySessionId = lobbyListener.getLobbySessionId();
        assertEquals(newLobbySessionId, (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY));

        // Assert that the originalLobbySessionId is not equal to newLobbySessionId.
        assertNotEquals(newLobbySessionId, originalLobbySessionId);

        ws.close(1000, "Normal close");
    }
}
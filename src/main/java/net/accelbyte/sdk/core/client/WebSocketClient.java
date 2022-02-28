/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

import java.util.concurrent.TimeUnit;

public class WebSocketClient {

    private static WebSocketClient instance = null;

    private WebSocket webSocket;

    private WebSocketClient() {

    }

    public static WebSocketClient create(ConfigRepository configRepository, TokenRepository tokenRepository, WebSocketListener listener) {
        String baseURL = configRepository.getBaseURL();
        if (baseURL == null || baseURL.isEmpty()) {
            throw new IllegalArgumentException("Base URL cannot be null or empty");
        }
        if (instance == null) {
            WebSocketClient webSocketClient = new WebSocketClient();
            String url = configRepository.getBaseURL()+"/lobby/";
            OkHttpClient client = new OkHttpClient.Builder()
                    .readTimeout(0, TimeUnit.SECONDS)
                    .build();
            Request request = new Request.Builder()
                    .url(url)
                    .addHeader("Authorization", String.format("Bearer %s", tokenRepository.getToken()))
                    .build();
            webSocketClient.webSocket = client.newWebSocket(request, listener);
            client.dispatcher().executorService().shutdown();
            instance = webSocketClient;
        }
        return instance;
    }

    public void sendMessage(String message) {
        if (this.webSocket != null) {
            this.webSocket.send(message);
        }
    }

    public void close(int code, String reason) {
        if (this.webSocket != null) {
            this.webSocket.close(code, reason);
        }
    }
}

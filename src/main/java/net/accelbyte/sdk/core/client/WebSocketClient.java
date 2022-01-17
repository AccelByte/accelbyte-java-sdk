package net.accelbyte.sdk.core.client;

import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

import java.net.URISyntaxException;
import java.util.concurrent.TimeUnit;

public class WebSocketClient {

    private static WebSocketClient instance = null;

    private WebSocket webSocket;

    protected WebSocketClient() {

    }

    public static WebSocketClient create(ConfigRepository configRepository, TokenRepository tokenRepository, WebSocketListener listener) {
        if (instance == null) {
            synchronized (WebSocketClient.class) {
                if (instance == null) {
                    final WebSocketClient webSocketClient = new WebSocketClient();
                    String host;
                    try {
                        host = Helper.getHost(configRepository.getBaseURL());
                        OkHttpClient client = new OkHttpClient.Builder()
                                .readTimeout(0, TimeUnit.SECONDS)
                                .build();
                        Request request = new Request.Builder()
                                .url(String.format("wss://%s/lobby/", host))
                                .addHeader("Authorization", String.format("Bearer %s", tokenRepository.getToken()))
                                .build();
                        webSocketClient.webSocket = client.newWebSocket(request, listener);
                        client.dispatcher().executorService().shutdown();
                        instance = webSocketClient;
                    } catch (URISyntaxException e) {
                        e.printStackTrace();
                    }
                }
                return instance;
            }
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

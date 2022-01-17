package net.accelbyte.sdk;

import net.accelbyte.sdk.api.lobby.ws_models.JoinDefaultChannelRequest;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import net.accelbyte.sdk.core.repository.TokenRepositoryImpl;
import net.accelbyte.sdk.core.client.WebSocketClient;


public class Main {
    public static void main(String[] args) {

       AccelByteConfig config = new AccelByteConfig(
                new OkhttpClient(),
                TokenRepositoryImpl.getInstance(),
                new ConfigRepositoryImpl()
        );
        AccelByteSDK sdk = new AccelByteSDK(config);

        // login
        boolean login = sdk.loginUser("myUsername", "myPassword");
        if (!login) {
            System.out.println("login failed");
            return;
        }

        // create listener object
        Listener listener = new Listener();

        // create websocket object
        WebSocketClient ws = WebSocketClient.create(
                new ConfigRepositoryImpl(),
                TokenRepositoryImpl.getInstance(),
                listener
        );

        // construct message
        String message = JoinDefaultChannelRequest.builder().build().toWSM();

        // send message asynchronously
        ws.sendMessage(message);
    }
}

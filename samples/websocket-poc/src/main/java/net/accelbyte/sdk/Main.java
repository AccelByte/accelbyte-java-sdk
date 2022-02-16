/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk;

import net.accelbyte.sdk.api.lobby.ws_models.JoinDefaultChannelRequest;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.client.WebSocketClient;


public class Main {
    public static void main(String[] args) {

       AccelByteConfig config = new AccelByteConfig(
                new OkhttpClient(),
                DefaultTokenRepository.getInstance(),
                new DefaultConfigRepository()
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
                new DefaultConfigRepository(),
                DefaultTokenRepository.getInstance(),
                listener
        );

        // construct message
        String message = JoinDefaultChannelRequest.builder().build().toWSM();

        // send message asynchronously
        ws.sendMessage(message);
    }
}

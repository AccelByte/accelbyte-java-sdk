/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import lombok.extern.java.Log;
import net.accelbyte.sdk.api.lobby.ws_models.RefreshTokenRequest;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepositoryCallback;
import net.accelbyte.sdk.core.util.Helper;

@Log
public class TokenRepositoryCallbackListener extends TokenRepositoryCallback {
    private final TokenRepository tokenRepository;
    private final OkhttpWebSocketClient okhttpWebSocketClient;
    public TokenRepositoryCallbackListener(TokenRepository tokenRepository, OkhttpWebSocketClient okhttpWebSocketClient) {
        this.tokenRepository = tokenRepository;
        this.okhttpWebSocketClient = okhttpWebSocketClient;
    }

    @Override
    public void onAccessTokenRefreshed(String newToken) {
        log.info("send websocket refresh token request because token refreshed");
        RefreshTokenRequest request =
                RefreshTokenRequest.builder().id(Helper.generateUUID()).token(newToken).build();
        okhttpWebSocketClient.sendMessage(request.toWSM());
    }
    public void registerCallback() {
        log.info("registerTokenRepositoryCallback");
        tokenRepository.registerTokenRepositoryCallback(this);
    }
    public void unregisterCallback() {
        log.info("unregisterTokenRepositoryCallback");
        tokenRepository.unregisterTokenRepositoryCallback(this);
    }
}
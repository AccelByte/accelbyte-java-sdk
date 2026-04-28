/*
 * Copyright (c) 2026 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

public class RepoTestPlayer implements TestPlayer {
  private final AccelByteSDK sdk;
  private final TokenRepository tokenRepo;

  public RepoTestPlayer(ConfigRepository config) {
    this.tokenRepo = new DefaultTokenRepository();
    this.sdk =
        new AccelByteSDK(new AccelByteConfig(new OkhttpClient(), this.tokenRepo, config));
  }

  public boolean loginUser(String username, String password) throws Exception {
    return sdk.loginUser(username, password);
  }

  public boolean loginClient() throws Exception {
    return sdk.loginClient();
  }

  @Override
  public void login() throws Exception {
    // No-op: login is handled externally via loginUser() or loginClient()
  }

  @Override
  public void logout() throws Exception {
    sdk.logout();
  }

  @Override
  public AccelByteSDK getSdk() {
    return sdk;
  }

  @Override
  public String getAccessToken() throws Exception {
    return tokenRepo.getToken();
  }

  @Override
  public String getUserId() throws Exception {
    final String token = getAccessToken();
    if (token == null || token.isEmpty()) {
      return null;
    }
    return sdk.parseAccessToken(token, false).getSub();
  }

  @Override
  public void run(TestPlayer.PlayerAction action) throws Exception {
    action.accept(sdk, this);
  }
}

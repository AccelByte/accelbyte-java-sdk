/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

public class TestIntegration {
  protected AccelByteSDK sdk;
  protected String namespace;
  protected String username;
  protected String password;

  protected void setup() throws Exception {
    setup(true);
  }

  protected void setup(boolean loginUser) throws Exception {
    final HttpClient<?> httpClient = new OkhttpClient();
    final TokenRepository tokenRepo = DefaultTokenRepository.getInstance();
    final ConfigRepository configRepo = new DefaultConfigRepository();
    final AccelByteConfig sdkConfig = new AccelByteConfig(httpClient, tokenRepo, configRepo);

    final String baseUrl = configRepo.getBaseURL();
    final String clientId = configRepo.getClientId();
    final String clientSecret = configRepo.getClientSecret();
    final String username = System.getenv("AB_USERNAME");
    final String password = System.getenv("AB_PASSWORD");
    final String namespace = System.getenv("AB_NAMESPACE");

    assertTrue(baseUrl != null && !baseUrl.isEmpty());
    assertTrue(clientId != null && !clientId.isEmpty());
    assertTrue(clientSecret != null && !clientSecret.isEmpty());
    assertTrue(username != null && !username.isEmpty());
    assertTrue(password != null && !password.isEmpty());
    assertTrue(namespace != null && !namespace.isEmpty());

    this.sdk = new AccelByteSDK(sdkConfig);
    this.namespace = namespace;
    this.username = username;
    this.password = password;

    if (loginUser) {
      final boolean isLoginUserOk = sdk.loginUser(username, password);
      final String token = tokenRepo.getToken();

      assertTrue(isLoginUserOk);
      assertTrue(token != null && !token.isEmpty());
    }
  }

  protected void tear() throws Exception {
    final boolean isLogoutOk = sdk.logout();
    final String token = sdk.getSdkConfiguration().getTokenRepository().getToken();

    assertTrue(isLogoutOk);
    assertTrue(token == null || token.isEmpty());
  }

  protected boolean isUsingAGSStarter() {
    final String baseUrl = sdk.getSdkConfiguration().getConfigRepository().getBaseURL();
    return baseUrl.contains("gamingservices.accelbyte.io");
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationLoginPlatform extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    final OkHttpClient phClient = new OkHttpClient();
    final String phantAuthBaseUrl = TestHelper.getPhantauthBaseUrl();

    final Request tokenRequest =
        new Request.Builder()
            .url(phantAuthBaseUrl + "/user/test.serversdk1/token/authorization")
            .build();

    String phToken = null;

    try (final Response tokenResponse = phClient.newCall(tokenRequest).execute()) {
      phToken = tokenResponse.body().string();
    }

    assertTrue(phToken != null && !phToken.isEmpty());

    final Request authRequest =
        new Request.Builder()
            .url(phantAuthBaseUrl + "/auth/token")
            .post(
                new FormBody.Builder()
                    .add("grant_type", "authorization_code")
                    .add("client_id", "test.client")
                    .add("client_secret", "UTBcWwt5")
                    .add("redirect_uri", "http://localhost")
                    .add("code", phToken)
                    .build())
            .build();

    PhantauthTokens phAuth = null;

    try (Response authResponse = phClient.newCall(authRequest).execute()) {
      phAuth =
          new ObjectMapper()
              .readValue(authResponse.body().string(), new TypeReference<PhantauthTokens>() {});
    }

    assertTrue(phAuth != null);
    assertTrue(phAuth.getAccessToken() != null && !phAuth.getAccessToken().isEmpty());
    assertTrue(phAuth.getIdToken() != null && !phAuth.getIdToken().isEmpty());
    assertTrue(phAuth.getRefreshToken() != null && !phAuth.getRefreshToken().isEmpty());
    assertTrue(phAuth.getTokenType() != null && !phAuth.getTokenType().isEmpty());

    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRefreshRepository tokenRepository = new DefaultTokenRefreshRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, configRepository);

    final boolean isLoginOk = sdk.loginPlatform("phantauth", phAuth.getIdToken());

    assertTrue(isLoginOk);

    assertTrue(tokenRepository.getToken() != null && !tokenRepository.getToken().isEmpty());
    assertTrue(tokenRepository.getRefreshToken() != null);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

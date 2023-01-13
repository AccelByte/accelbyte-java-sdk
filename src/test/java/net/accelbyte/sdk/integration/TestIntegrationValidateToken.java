/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
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
public class TestIntegrationValidateToken extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Test
  @Order(1)
  public void testToken() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRepository tokenRepository = new DefaultTokenRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk1 = new AccelByteSDK(httpClient, tokenRepository, configRepository);
    final OAuth20 oauth20Wrapper = new OAuth20(sdk1);

    // sdk1.loginClient();
    sdk1.loginUser(this.username, this.password);

    // Validate token after login

    final boolean isValidateTokenOk1 = sdk1.validateToken(tokenRepository.getToken());

    assertTrue(isValidateTokenOk1);

    final net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenRevocationV3 operation =
        net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenRevocationV3.builder()
            .token(tokenRepository.getToken())
            .build();

    // Revoke token

    oauth20Wrapper.tokenRevocationV3(operation);

    Thread.sleep(3000);

    // Validate token after revoke (new sdk instance will request new revocation
    // list immediately)

    final AccelByteSDK sdk2 = new AccelByteSDK(httpClient, tokenRepository, configRepository);

    final boolean isValidateTokenOk2 = sdk2.validateToken(tokenRepository.getToken());

    assertFalse(isValidateTokenOk2);
  }

  @Test
  @Order(1)
  public void testPermission() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRepository tokenRepository = new DefaultTokenRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk1 = new AccelByteSDK(httpClient, tokenRepository, configRepository);
    sdk1.loginClient();

    // Validate token with permission (test credential must have
    // ADMIN:NAMESPACE:{NAMESPACE}:INFORMATION:USER:* [CREATE,READ,UPDATE,DELETE]
    // permission)

    final String goodPermission1 =
        "ADMIN:NAMESPACE:" + this.namespace + ":INFORMATION:USER:0000000";
    final String badPermission1 =
        "ADMIN:NAMESPACE:" + this.namespace + ":INFORMATION:PLAYER:0000000";
    final String badPermission2 =
        "ADMIN:NAMESPACE:" + this.namespace + ":INFORMATION:USER:0000000:DATA";
    final int goodAction = 2; // Read only action

    final boolean isGoodPermissionOk1 =
        sdk1.validateToken(tokenRepository.getToken(), goodPermission1, goodAction);
    final boolean isBadPermissionOk1 =
        sdk1.validateToken(tokenRepository.getToken(), badPermission1, goodAction);
    final boolean isBadPermissionOk2 =
        sdk1.validateToken(tokenRepository.getToken(), badPermission2, goodAction);

    assertTrue(isGoodPermissionOk1);
    assertFalse(isBadPermissionOk1);
    assertFalse(isBadPermissionOk2);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenRevocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationValidateToken extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @ParameterizedTest
  @ValueSource(booleans = {true, false})
  @Order(1)
  public void testClientToken(boolean localTokenValidationEnabled) throws Exception {
    // Setup

    final DefaultConfigRepository configRepo1 = new DefaultConfigRepository();

    configRepo1.setLocalTokenValidationEnabled(localTokenValidationEnabled);
    configRepo1.setJwksRefreshInterval(3); // 3 seconds for testing purpose only
    configRepo1.setRevocationListRefreshInterval(3); // 3 seconds for testing purpose only

    final AccelByteSDK sdk1 =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

    final AccelByteSDK sdk2 =
        new AccelByteSDK(
            new AccelByteConfig(
                new OkhttpClient(), new DefaultTokenRepository(), new DefaultConfigRepository()));

    sdk1.loginClient();

    // Login client

    sdk2.loginClient();

    // Validate token after login

    final String token = sdk2.getSdkConfiguration().getTokenRepository().getToken();

    assertTrue(sdk1.validateToken(token));

    // Revoke token

    final OAuth20 oauth20Wrapper = new OAuth20(sdk1);

    oauth20Wrapper.tokenRevocationV3(TokenRevocationV3.builder().token(token).build());

    // Wait 12 seconds for testing purpose only

    Thread.sleep(12000);

    // Validate token after revoke

    assertFalse(sdk1.validateToken(token));
  }

  @ParameterizedTest
  @ValueSource(booleans = {true, false})
  @Order(1)
  public void testUserToken(boolean localTokenValidationEnabled) throws Exception {
    // Setup

    final DefaultConfigRepository configRepo1 = new DefaultConfigRepository();

    configRepo1.setLocalTokenValidationEnabled(localTokenValidationEnabled);
    configRepo1.setJwksRefreshInterval(3); // 3 seconds for testing purpose only
    configRepo1.setRevocationListRefreshInterval(3); // 3 seconds for testing purpose only

    final AccelByteSDK sdk1 =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

    final AccelByteSDK sdk2 =
        new AccelByteSDK(
            new AccelByteConfig(
                new OkhttpClient(), new DefaultTokenRepository(), new DefaultConfigRepository()));

    sdk1.loginClient();

    // Login user

    sdk2.loginUser(this.username, this.password);

    // Validate token after login

    final String token = sdk2.getSdkConfiguration().getTokenRepository().getToken();

    assertTrue(sdk1.validateToken(token));

    // Revoke token

    final OAuth20 oauth20Wrapper = new OAuth20(sdk1);

    oauth20Wrapper.tokenRevocationV3(TokenRevocationV3.builder().token(token).build());

    // Wait 12 seconds for testing purpose only

    Thread.sleep(12000);

    // Validate token after revoke

    assertFalse(sdk1.validateToken(token));
  }

  @Test
  @Order(1)
  public void testPermission() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final DefaultTokenRepository tokenRepository1 = new DefaultTokenRepository();
    final AccelByteSDK sdk1 = new AccelByteSDK(httpClient, tokenRepository1, configRepository);

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
        sdk1.validateToken(tokenRepository1.getToken(), goodPermission1, goodAction);
    final boolean isBadPermissionOk1 =
        sdk1.validateToken(tokenRepository1.getToken(), badPermission1, goodAction);
    final boolean isBadPermissionOk2 =
        sdk1.validateToken(tokenRepository1.getToken(), badPermission2, goodAction);

    assertTrue(isGoodPermissionOk1);
    assertFalse(isBadPermissionOk1);
    assertFalse(isBadPermissionOk2);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

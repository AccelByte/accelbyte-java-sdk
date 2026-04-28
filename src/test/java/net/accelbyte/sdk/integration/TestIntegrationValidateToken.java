/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenRevocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.validator.UserAuthContext;
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
    super.setup(true, IntegrationTestConfigRepository.Admin);
  }

  @ParameterizedTest
  @ValueSource(booleans = {true, false})
  @Order(1)
  public void testClientToken(boolean localTokenValidationEnabled) throws Exception {
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    // Setup

    final IntegrationTestConfigRepository configRepo1 = IntegrationTestConfigRepository.Admin;

    configRepo1.setLocalTokenValidationEnabled(localTokenValidationEnabled);
    configRepo1.setJwksRefreshInterval(3); // 3 seconds for testing purpose only
    configRepo1.setRevocationListRefreshInterval(3); // 3 seconds for testing purpose only

    final AccelByteSDK sdk1 =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

    final AccelByteSDK sdk2 =
        new AccelByteSDK(
            new AccelByteConfig(
                new OkhttpClient(), new DefaultTokenRepository(), IntegrationTestConfigRepository.Admin));

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
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    // Setup

    final IntegrationTestConfigRepository configRepo1 = IntegrationTestConfigRepository.Admin;

    configRepo1.setLocalTokenValidationEnabled(localTokenValidationEnabled);
    configRepo1.setJwksRefreshInterval(3); // 3 seconds for testing purpose only
    configRepo1.setRevocationListRefreshInterval(3); // 3 seconds for testing purpose only

    final AccelByteSDK sdk1 =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

    final AccelByteSDK sdk2 =
        new AccelByteSDK(
            new AccelByteConfig(
                new OkhttpClient(), new DefaultTokenRepository(), IntegrationTestConfigRepository.Admin));

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
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();

    final DefaultTokenRepository tokenRepository1 = new DefaultTokenRepository();
    final AccelByteSDK sdk1 = new AccelByteSDK(httpClient, tokenRepository1, IntegrationTestConfigRepository.Basic);

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

  @Test
  @Order(2)
  public void testCustomPermissionClientToken() throws Exception {
    final AccelByteSDK customSdk =
        new AccelByteSDK(
            new AccelByteConfig(
                new OkhttpClient(),
                new DefaultTokenRepository(),
                IntegrationTestConfigRepository.CustomPermission));

    customSdk.loginClient();

    final String token = customSdk.getSdkConfiguration().getTokenRepository().getToken();

    assertTrue(
        customSdk.validateToken(
            token, "CUSTOM:ADMIN:NAMESPACE:" + namespace + ":GUILD", 2));
  }

  @Test
  public void testValidateUserTokenRolePermission() throws Exception {
    final String token = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final String userId = sdk.parseAccessToken(token, false).getSub();

    final UserAuthContext authContext =
        UserAuthContext.builder().token(token).namespace(namespace).userId(userId).build();
    final AccessTokenPayload.Types.Permission permission =
        AccessTokenPayload.Types.Permission.builder()
            .resource("ADMIN:NAMESPACE:{namespace}:CLOUDSAVE:RECORD")
            .action(2)
            .build();
    boolean result = sdk.validateToken(authContext, permission);

    assertTrue(result);
  }

  @Test
  public void testUserTokenValidationFromDifferentStudio() throws Exception {
    final String diffBaseUrl = System.getenv("DIFFENV_AB_BASE_URL");
    final String diffClientId = System.getenv("DIFFENV_AB_CLIENT_ID");
    final String diffClientSecret = System.getenv("DIFFENV_AB_CLIENT_SECRET");
    final String diffNamespace = System.getenv("DIFFENV_AB_NAMESPACE");

    // [HIGH feedback: use assumeTrue instead of silent return so JUnit marks test as skipped, not passed]
    assumeTrue(
        diffBaseUrl != null && diffClientId != null && diffClientSecret != null && diffNamespace != null,
        "DIFFENV_AB_* vars not configured — skipping cross-studio test");

    // Build a SDK instance pointing at the different studio environment
    final DefaultConfigRepository diffConfig =
        new DefaultConfigRepository() {
          @Override
          public String getBaseURL() {
            return diffBaseUrl;
          }

          @Override
          public String getClientId() {
            return diffClientId;
          }

          @Override
          public String getClientSecret() {
            return diffClientSecret;
          }

          @Override
          public String getNamespace() {
            return diffNamespace;
          }
        };
    diffConfig.setLocalTokenValidationEnabled(true);

    final AccelByteSDK diffSdk =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), diffConfig));
    diffSdk.loginClient();

    // [HIGH feedback: explicitly log in a user on the primary SDK to obtain a user token,
    // not a client credential token. super.setup(true) performs a client login.]
    sdk.loginUser(this.username, this.password);
    final String token = sdk.getSdkConfiguration().getTokenRepository().getToken();
    // System.out.println("Token from primary SDK: " + token);

    final String diffToken = diffSdk.getSdkConfiguration().getTokenRepository().getToken();
    // System.out.println("Token from different-studio SDK: " + diffToken);

    // The primary user's token should be rejected by the different-studio SDK
    final boolean result = diffSdk.validateToken(token);
    assertFalse(result, "Token from a different studio should be rejected");
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

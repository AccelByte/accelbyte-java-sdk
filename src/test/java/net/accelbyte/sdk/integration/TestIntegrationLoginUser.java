/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
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
public class TestIntegrationLoginUser extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Test
  @Order(1)
  public void testLoginUser() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRefreshRepository tokenRefreshRepository =
        new DefaultTokenRefreshRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRefreshRepository, configRepository);

    boolean isLoginOk  = sdk.loginUser(this.username, this.password);

    assertTrue(isLoginOk);
  }

  @Test
  @Order(1)
  public void testLoginUserWithScope() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRefreshRepository tokenRefreshRepository =
        new DefaultTokenRefreshRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRefreshRepository, configRepository);

    boolean isLoginOk  = sdk.loginUser(this.username, this.password, "account");

    assertTrue(isLoginOk);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

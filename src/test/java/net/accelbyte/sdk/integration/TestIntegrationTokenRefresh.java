/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Instant;
import java.util.Date;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GetCountryLocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
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
public class TestIntegrationTokenRefresh extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Test
  @Order(1)
  public void testUser() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRefreshRepository tokenRefreshRepository =
        new DefaultTokenRefreshRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRefreshRepository, configRepository);

    final OAuth20Extension wrapper = new OAuth20Extension(sdk);

    sdk.loginUser(this.username, this.password);

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken() != null
            && !"".equals(tokenRefreshRepository.getRefreshToken()));

    // Simulate token expiry within threshold
    tokenRefreshRepository.setTokenExpiresAt(Date.from(Instant.now().plusSeconds(60)));

    wrapper.getCountryLocationV3(GetCountryLocationV3.builder().build());

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken() != null
            && !"".equals(tokenRefreshRepository.getRefreshToken()));
  }

  @Test
  @Order(1)
  public void testClient() throws Exception {
    final HttpClient<?> httpClient = super.sdk.getSdkConfiguration().getHttpClient();
    final DefaultTokenRefreshRepository tokenRefreshRepository =
        new DefaultTokenRefreshRepository();
    final ConfigRepository configRepository = super.sdk.getSdkConfiguration().getConfigRepository();

    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRefreshRepository, configRepository);

    final OAuth20Extension wrapper = new OAuth20Extension(sdk);

    sdk.loginClient();

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken() == null); // Login client does not return refresh
    // token

    // Simulate token expiry within threshold
    tokenRefreshRepository.setTokenExpiresAt(Date.from(Instant.now().plusSeconds(60)));

    wrapper.getCountryLocationV3(GetCountryLocationV3.builder().build());

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken() == null); // Login client does not return refresh
    // token
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

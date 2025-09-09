package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Instant;
import java.util.Date;

import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload;
import net.accelbyte.sdk.core.repository.OnDemandTokenRefreshOptions;
import net.accelbyte.sdk.core.repository.TokenRefresh;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationLoginOrRefresh extends TestIntegration {

  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshUser() throws Exception {
    final OnDemandTokenRefreshOptions refreshOpts = OnDemandTokenRefreshOptions.getDefault();
    refreshOpts.setRate(0.0005f);  // ~1.8 second

    final AccelByteConfig sdkConfig = AccelByteConfig.getDefault().useOnDemandTokenRefresh(refreshOpts);
    final AccelByteSDK sdk = new AccelByteSDK(sdkConfig);

    final int expirationDuration = 10; // in seconds

    final Date firstLoginTime = Date.from(Instant.now());
    final boolean firstLoginOk = sdk.loginOrRefreshUser(username, password);

    final TokenRefresh refreshRepo = (TokenRefresh)sdk.getSdkConfiguration().getTokenRepository();

    assertTrue(firstLoginOk);

    final String firstLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date firstLoginTokenExpiredTime = refreshRepo.getTokenExpiringAt();

    assertTrue(getTimeDifferenceInSeconds(firstLoginTime, firstLoginTokenExpiredTime) <= expirationDuration);

    final AccessTokenPayload firstLoginTokenPayload = sdk.parseAccessToken(firstLoginToken, false);

    assertNotNull(firstLoginTokenPayload);
    assertEquals(namespace, firstLoginTokenPayload.getNamespace());
    assertEquals(sdk.getSdkConfiguration().getConfigRepository().getClientId(), firstLoginTokenPayload.getClientId());

    Thread.sleep(expirationDuration * 1000); // sleep for 2 second, since expiredAt was set 1.8 second

    final Date secondLoginTime = Date.from(Instant.now());
    final boolean secondLoginOk = sdk.loginOrRefreshUser(username, password);

    assertTrue(secondLoginOk);

    final String secondLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date secondLoginExpiredTime = refreshRepo.getTokenExpiringAt();
    assertTrue(getTimeDifferenceInSeconds(secondLoginTime, secondLoginExpiredTime) <= expirationDuration);

    final AccessTokenPayload secondLoginTokenPayload =
        sdk.parseAccessToken(secondLoginToken, false);

    assertNotNull(secondLoginTokenPayload);
    assertEquals(namespace, secondLoginTokenPayload.getNamespace());
    assertEquals(sdk.getSdkConfiguration().getConfigRepository().getClientId(), secondLoginTokenPayload.getClientId());

    assertNotEquals(firstLoginToken, secondLoginToken);
    assertNotEquals(firstLoginTokenExpiredTime, secondLoginExpiredTime);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshClient() throws Exception {
    final OnDemandTokenRefreshOptions refreshOpts = OnDemandTokenRefreshOptions.getDefault();
    refreshOpts.setRate(0.0005f);  // ~1.8 second

    final AccelByteConfig sdkConfig = AccelByteConfig.getDefault().useOnDemandTokenRefresh(refreshOpts);
    final AccelByteSDK sdk = new AccelByteSDK(sdkConfig);

    final int expirationDuration = 10; // in second

    final Date firstLoginTime = Date.from(Instant.now());
    final boolean firstLoginOk = sdk.loginOrRefreshClient();

    final TokenRefresh refreshRepo = (TokenRefresh)sdk.getSdkConfiguration().getTokenRepository();

    assertTrue(firstLoginOk);

    final String firstLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date firstLoginTokenExpiredTime = refreshRepo.getTokenExpiringAt();

    assertTrue(getTimeDifferenceInSeconds(firstLoginTime, firstLoginTokenExpiredTime) <= expirationDuration);

    final AccessTokenPayload firstLoginTokenPayload = sdk.parseAccessToken(firstLoginToken, false);

    assertNotNull(firstLoginTokenPayload);
    assertEquals(namespace, firstLoginTokenPayload.getNamespace());
    assertEquals(sdk.getSdkConfiguration().getConfigRepository().getClientId(), firstLoginTokenPayload.getClientId());

    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    final Date secondLoginTime = Date.from(Instant.now());
    final boolean secondLoginOk = sdk.loginOrRefreshClient();

    assertTrue(secondLoginOk);

    final String secondLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date secondLoginTokenExpiredTime = refreshRepo.getTokenExpiringAt();
    assertTrue(getTimeDifferenceInSeconds(secondLoginTime, secondLoginTokenExpiredTime) <= expirationDuration);

    final AccessTokenPayload secondLoginTokenPayload =
        sdk.parseAccessToken(secondLoginToken, false);

    assertNotNull(secondLoginTokenPayload);
    assertEquals(namespace, secondLoginTokenPayload.getNamespace());
    assertEquals(sdk.getSdkConfiguration().getConfigRepository().getClientId(), secondLoginTokenPayload.getClientId());

    assertNotEquals(firstLoginToken, secondLoginToken);
    assertNotEquals(firstLoginTokenExpiredTime, secondLoginTokenExpiredTime);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }

  private int getTimeDifferenceInSeconds(Date date1, Date date2) {
    long differenceInMillis = Math.abs(date1.getTime() - date2.getTime());
    return (int) (differenceInMillis / 1000);
  }
}

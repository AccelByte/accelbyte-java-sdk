package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import java.lang.reflect.Field;
import java.time.Instant;
import java.util.Date;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
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
    final OkhttpClient httpClient = new OkhttpClient();
    final DefaultConfigRepository configRepo = new DefaultConfigRepository();
    final DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, refreshRepo, configRepo);

    forceSetRefreshRatioTestingOnly(sdk, 0.0005f); // ~1.8 second

    final int expirationDuration = 10; // in seconds

    final Date firstLoginTime = Date.from(Instant.now());
    final boolean firstLoginOk = sdk.loginOrRefreshUser(username, password);

    assertTrue(firstLoginOk);

    final String firstLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date firstLoginTokenExpiredTime =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();

    assertTrue(getTimeDifferenceInSeconds(firstLoginTime, firstLoginTokenExpiredTime) <= expirationDuration);

    final AccessTokenPayload firstLoginTokenPayload = sdk.parseAccessToken(firstLoginToken, false);

    assertNotNull(firstLoginTokenPayload);
    assertEquals(namespace, firstLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), firstLoginTokenPayload.getClientId());

    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    final Date secondLoginTime = Date.from(Instant.now());
    final boolean secondLoginOk = sdk.loginOrRefreshUser(username, password);

    assertTrue(secondLoginOk);

    final String secondLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date secondLoginExpiredTime =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(getTimeDifferenceInSeconds(secondLoginTime, secondLoginExpiredTime) <= expirationDuration);

    final AccessTokenPayload secondLoginTokenPayload = sdk.parseAccessToken(secondLoginToken, false);

    assertNotNull(secondLoginTokenPayload);
    assertEquals(namespace, secondLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), secondLoginTokenPayload.getClientId());

    assertNotEquals(firstLoginToken, secondLoginToken);
    assertNotEquals(firstLoginTokenExpiredTime, secondLoginExpiredTime);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshClient() throws Exception {
    final OkhttpClient httpClient = new OkhttpClient();
    final DefaultConfigRepository configRepo = new DefaultConfigRepository();
    final DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, refreshRepo, configRepo);

    forceSetRefreshRatioTestingOnly(sdk, 0.0005f); // ~1.8 second

    final int expirationDuration = 10; // in second

    final Date firstLoginTime = Date.from(Instant.now());
    final boolean firstLoginOk = sdk.loginOrRefreshClient();

    assertTrue(firstLoginOk);

    final String firstLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date firstLoginTokenExpiredTime =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(getTimeDifferenceInSeconds(firstLoginTime, firstLoginTokenExpiredTime) <= expirationDuration);

    final AccessTokenPayload firstLoginTokenPayload = sdk.parseAccessToken(firstLoginToken, false);

    assertNotNull(firstLoginTokenPayload);
    assertEquals(namespace, firstLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), firstLoginTokenPayload.getClientId());

    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    final Date secondLoginTime = Date.from(Instant.now());
    final boolean secondLoginOk = sdk.loginOrRefreshClient();

    assertTrue(secondLoginOk);

    final String secondLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Date secondLoginTokenExpiredTime =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(getTimeDifferenceInSeconds(secondLoginTime, secondLoginTokenExpiredTime) <= expirationDuration);

    final AccessTokenPayload secondLoginTokenPayload = sdk.parseAccessToken(secondLoginToken, false);

    assertNotNull(secondLoginTokenPayload);
    assertEquals(namespace, secondLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), secondLoginTokenPayload.getClientId());

    assertNotEquals(firstLoginToken, secondLoginToken);
    assertNotEquals(firstLoginTokenExpiredTime, secondLoginTokenExpiredTime);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }

  private void forceSetRefreshRatioTestingOnly(AccelByteSDK sdk, float refreshRatio) {
    Field fieldRefreshRation;
    try {
      fieldRefreshRation = AccelByteSDK.class.getDeclaredField("tokenRefreshRatio");
      fieldRefreshRation.setAccessible(true);
      fieldRefreshRation.setFloat(sdk, refreshRatio);
    } catch (NoSuchFieldException | IllegalAccessException e) {
      throw new RuntimeException(e);
    }
  }

  private int getTimeDifferenceInSeconds(Date date1, Date date2) {
    long differenceInMillis = Math.abs(date1.getTime() - date2.getTime());
    return (int) (differenceInMillis / 1000);
  }
}

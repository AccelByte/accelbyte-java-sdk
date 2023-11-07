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

  private void reflectionSetRefreshRatio(AccelByteSDK sdk, float refreshRatio) {
    Field fieldRefreshRation;
    try {
      fieldRefreshRation = AccelByteSDK.class.getDeclaredField("tokenRefreshRatio");
      fieldRefreshRation.setAccessible(true);
      fieldRefreshRation.setFloat(sdk, refreshRatio);
    } catch (NoSuchFieldException | IllegalAccessException e) {
      throw new RuntimeException(e);
    }
  }

  public static int timeDifferenceInSeconds(Date date1, Date date2) {
    long differenceInMillis = Math.abs(date1.getTime() - date2.getTime());
    return (int) (differenceInMillis / 1000);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshUser() throws Exception {

    DefaultConfigRepository configRepo = new DefaultConfigRepository();
    DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();

    final AccelByteSDK sdk = new AccelByteSDK(new OkhttpClient(), refreshRepo, configRepo);
    reflectionSetRefreshRatio(sdk, 0.0005f); // ~1.8 second
    final int expirationDuration = 2; // in second

    Date startDate1 = Date.from(Instant.now());
    boolean loggedIn = sdk.loginOrRefreshUser(username, password);
    assertTrue(loggedIn);

    final String token1 = sdk.getSdkConfiguration().getTokenRepository().getToken();
    Date tokenExpiredAt1 =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(timeDifferenceInSeconds(startDate1, tokenExpiredAt1) <= expirationDuration);

    final AccessTokenPayload payload1 = sdk.parseAccessToken(token1, false);
    assertNotNull(payload1);

    assertEquals(namespace, payload1.getNamespace());
    assertEquals(configRepo.getClientId(), payload1.getClientId());

    // TODO: make the scheduler 'test-able' and follow SOLID
    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    Date startDate2 = Date.from(Instant.now());
    boolean loggedIn2 = sdk.loginOrRefreshUser(username, password);
    assertTrue(loggedIn2);

    final String token2 = sdk.getSdkConfiguration().getTokenRepository().getToken();
    Date tokenExpiredAt2 =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(timeDifferenceInSeconds(startDate2, tokenExpiredAt2) <= expirationDuration);

    final AccessTokenPayload payload2 = sdk.parseAccessToken(token2, false);
    assertNotNull(payload2);

    assertEquals(namespace, payload2.getNamespace());
    assertEquals(configRepo.getClientId(), payload2.getClientId());

    assertNotEquals(token1, token2);
    assertNotEquals(tokenExpiredAt1, tokenExpiredAt2);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshClient() throws Exception {

    DefaultConfigRepository configRepo = new DefaultConfigRepository();
    DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();

    final AccelByteSDK sdk = new AccelByteSDK(new OkhttpClient(), refreshRepo, configRepo);
    reflectionSetRefreshRatio(sdk, 0.0005f); // ~1.8 second
    final int expirationDuration = 2; // in second

    Date startDate1 = Date.from(Instant.now());
    boolean loggedIn = sdk.loginOrRefreshClient();
    assertTrue(loggedIn);

    final String token1 = sdk.getSdkConfiguration().getTokenRepository().getToken();
    Date tokenExpiredAt1 =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(timeDifferenceInSeconds(startDate1, tokenExpiredAt1) <= expirationDuration);

    final AccessTokenPayload payload1 = sdk.parseAccessToken(token1, false);
    assertNotNull(payload1);

    assertEquals(namespace, payload1.getNamespace());
    assertEquals(configRepo.getClientId(), payload1.getClientId());

    // TODO: make the scheduler 'test-able' and follow SOLID
    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    Date startDate2 = Date.from(Instant.now());
    boolean loggedIn2 = sdk.loginOrRefreshClient();
    assertTrue(loggedIn2);

    final String token2 = sdk.getSdkConfiguration().getTokenRepository().getToken();
    Date tokenExpiredAt2 =
        ((TokenRefresh) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(timeDifferenceInSeconds(startDate2, tokenExpiredAt2) <= expirationDuration);

    final AccessTokenPayload payload2 = sdk.parseAccessToken(token2, false);
    assertNotNull(payload2);

    assertEquals(namespace, payload2.getNamespace());
    assertEquals(configRepo.getClientId(), payload2.getClientId());

    assertNotEquals(token1, token2);
    assertNotEquals(tokenExpiredAt1, tokenExpiredAt2);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

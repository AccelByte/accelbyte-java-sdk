package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.stream.Collectors;
import lombok.Data;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.repository.OnDemandTokenRefreshOptions;

import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationRefreshToken extends TestIntegration {

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

  @Data
  private static class RefreshedToken {
    private final boolean isSuccess;
    private final String newToken;
  }

  @Order(1)
  @Test
  public void testRefreshUserToken() throws Exception {

    OnDemandTokenRefreshOptions refreshOpts = OnDemandTokenRefreshOptions.getDefault();
    refreshOpts.setRate(0.0005f);  // ~1.8 second

    final AccelByteConfig sdkConfig = AccelByteConfig.getDefault()
      .useOnDemandTokenRefresh(refreshOpts);
    final AccelByteSDK sdk = new AccelByteSDK(sdkConfig);

    final int expirationDuration = 2; // in second

    boolean loggedIn = sdk.loginOrRefreshUser(username, password);
    assertTrue(loggedIn);

    Thread.sleep(expirationDuration * 1000); // sleep for 2 second, since expiredAt was set 1.8 second

    CountDownLatch latch = new CountDownLatch(1); // all threads will wait on this latch
    int numWorker = 2;
    ExecutorService executor = Executors.newFixedThreadPool(numWorker);
    ArrayList<Future<RefreshedToken>> result = new ArrayList<>();

    for (int i = 0; i < numWorker; i++) {
      result.add(
          executor.submit(
              () -> {
                latch.await();
                boolean success = sdk.refreshToken();
                return new RefreshedToken(
                    success, sdk.getSdkConfiguration().getTokenRepository().getToken());
              }));
    }

    latch.countDown(); // release the lock of all threads at once

    List<String> newTokens =
        result.stream()
            .map(it -> assertDoesNotThrow(() -> it.get(1, TimeUnit.SECONDS)))
            .filter(it -> it.isSuccess)
            .map(RefreshedToken::getNewToken)
            .collect(Collectors.toList());

    assertEquals(2, newTokens.size());
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

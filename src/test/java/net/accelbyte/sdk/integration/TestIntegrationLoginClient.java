package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.doReturn;

import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import org.junit.jupiter.api.*;
import org.mockito.Mockito;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationLoginClient extends TestIntegration {

  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Order(1)
  @Test
  public void testLoginPublicClient() throws Exception {

    /*
     * WARNING: Please use loginClient() function with confidential OAuth client.
     * Using loginClient() function with public OAuth client is not supported.
     * This test is kept here for historical reason only.
     */

    DefaultConfigRepository configRepo1 = Mockito.spy(new DefaultConfigRepository());
    doReturn(System.getenv("PUBLIC_AB_CLIENT_ID")).when(configRepo1).getClientId();
    doReturn("").when(configRepo1).getClientSecret();

    final AccelByteSDK sdk1 =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

    boolean loggedIn = sdk1.loginClient();
    assertTrue(loggedIn);

    final String token = sdk1.getSdkConfiguration().getTokenRepository().getToken();

    final AccessTokenPayload payload = sdk1.parseAccessToken(token, false);
    assertNotNull(payload);

    assertEquals(namespace, payload.getNamespace());
    assertEquals(configRepo1.getClientId(), payload.getClientId());
  }

  @Order(1)
  @Test
  public void testLoginConfidentialClient() throws Exception {

    DefaultConfigRepository configRepo1 = new DefaultConfigRepository();

    final AccelByteSDK sdk1 =
        new AccelByteSDK(
            new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

    boolean loggedIn = sdk1.loginClient();
    assertTrue(loggedIn);

    final String token = sdk1.getSdkConfiguration().getTokenRepository().getToken();

    final AccessTokenPayload payload = sdk1.parseAccessToken(token, false);
    assertNotNull(payload);

    assertEquals(namespace, payload.getNamespace());
    assertEquals(configRepo1.getClientId(), payload.getClientId());
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

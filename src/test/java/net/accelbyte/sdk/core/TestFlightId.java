package net.accelbyte.sdk.core;

import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static org.junit.jupiter.api.Assertions.*;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.WireMock;
import com.github.tomakehurst.wiremock.core.WireMockConfiguration;
import com.github.tomakehurst.wiremock.verification.LoggedRequest;
import java.util.List;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.utils.EnvVarTestUtils;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

@Tag("test-core")
public class TestFlightId {

  private static WireMockServer wireMockServer;

  @BeforeAll
  public static void setup() throws NoSuchFieldException, IllegalAccessException {
    WireMockConfiguration config =
        WireMockConfiguration.options().bindAddress("localhost").port(11111);
    wireMockServer = new WireMockServer(config);
    wireMockServer.start();

    // Set up a catch-all stub
    wireMockServer.stubFor(
        any(urlMatching(".*")) // Matches any URL
            .willReturn(
                aResponse()
                    .withStatus(200)
                    .withHeader("Content-Type", "application/json")
                    .withBody("{\"message\":\"This is a stubbed response\"}")));

    EnvVarTestUtils.setEnvironmentVariable("AB_BASE_URL", "http://localhost:11111");
  }

  @AfterAll
  public static void tearDown() throws NoSuchFieldException, IllegalAccessException {
    wireMockServer.stop();
    EnvVarTestUtils.removeEnvironmentVariable("AB_BASE_URL");
  }

  private final OkhttpClient httpClient = new OkhttpClient();

  @Test
  public void testMultipleSdkInstanceHaveSameFlightId() throws Exception {

    AccelByteSDK sdk1 =
        new AccelByteSDK(httpClient, new DefaultTokenRepository(), new DefaultConfigRepository());
    AccelByteSDK sdk2 =
        new AccelByteSDK(httpClient, new DefaultTokenRepository(), new DefaultConfigRepository());

    assertEquals(
        sdk1.getSdkConfiguration().getFlightIdRepository().getFlightId(),
        sdk2.getSdkConfiguration().getFlightIdRepository().getFlightId());
  }

  @Test
  public void testHttpHeaderContainsFlightId() throws Exception {
    // given
    AccelByteSDK sdk =
        new AccelByteSDK(httpClient, new DefaultTokenRepository(), new DefaultConfigRepository());

    // when
    sdk.loginUser(
        "testUser",
        "testPassword"); // this call will fail, but it's fine since we only need to capture the
                         // request header

    // then
    List<LoggedRequest> requests =
        wireMockServer.findAll(anyRequestedFor(WireMock.urlMatching(".*")));
    boolean allRequestsHaveHeader =
        requests.stream().allMatch(request -> request.getHeader(HttpHeaders.X_FLIGHT_ID) != null);

    assertFalse(requests.isEmpty(), "No requests were made.");
    assertTrue(allRequestsHaveHeader, "Not all requests contained the flightId header.");
  }

  @Test
  public void testHttpHeaderForOperationWithCustomFlightId() throws Exception {
    // given
    AccelByteSDK sdk =
        new AccelByteSDK(httpClient, new DefaultTokenRepository(), new DefaultConfigRepository());
    OAuth20 testApiWrapper = new OAuth20(sdk);
    AuthorizeV3 testOperation = AuthorizeV3.builder().build();
    String customFlightId = "custom-flight-id";

    // when
    testOperation.setXFlightId(customFlightId);
    try {
      // this call will fail, but it's fine since we only need to capture the request header
      testApiWrapper.authorizeV3(testOperation);
    } catch (Exception ignore) {
    }

    // then
    List<LoggedRequest> requests =
        wireMockServer.findAll(anyRequestedFor(WireMock.urlMatching(".*")));
    boolean allRequestsHaveHeader =
        requests.stream().allMatch(request -> request.getHeader(HttpHeaders.X_FLIGHT_ID) != null);
    boolean isRequestHaveCustomFlightId =
        requests.stream()
            .allMatch(it -> it.getHeader(HttpHeaders.X_FLIGHT_ID).equals(customFlightId));

    assertFalse(requests.isEmpty(), "No requests were made.");
    assertTrue(allRequestsHaveHeader, "Not all requests contained the flightId header.");
    assertTrue(isRequestHaveCustomFlightId, "Request not using custom flightId");
  }
}

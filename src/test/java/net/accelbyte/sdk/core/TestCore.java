/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import static java.lang.Thread.sleep;
import static org.junit.jupiter.api.Assertions.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import lombok.Getter;
import lombok.extern.java.Log;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GetCountryLocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.api.lobby.ws_models.ConnectNotif;
import net.accelbyte.sdk.api.lobby.ws_models.PartyCreateRequest;
import net.accelbyte.sdk.api.lobby.ws_models.RefreshTokenRequest;
import net.accelbyte.sdk.core.client.*;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy.RetryIntervalType;
import net.accelbyte.sdk.core.repository.*;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.integration.TestHelper;
import okhttp3.*;
import org.checkerframework.checker.units.qual.C;
import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

@Log
@Tag("test-core")
class TestCore {
  private final OkhttpClient httpClient = new OkhttpClient();
  private final ReliableHttpClient reliableHttpClient = new ReliableHttpClient(null);
  private final TokenRepository tokenRepository = DefaultTokenRepository.getInstance();
  private final ConfigRepository httpbinConfigRepository = new HttpbinConfigRepository();
  private final ConfigRepository mockServerConfigRepository = new MockServerConfigRepository();
  private final OkHttpClient client = new OkHttpClient();

  @ParameterizedTest
  @ValueSource(strings = {"GET", "POST", "PUT", "PATCH", "DELETE"})
  public void testHttpRequestMethod(String input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/anything";
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertEquals(input, result.getMethod());
  }

  @Test
  public void testHttpRequestPathParams() throws Exception {
    final String testParams = "abc/def:123?x=1&y=2";
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "POST";
          }

          @Override
          public String getPath() {
            return "/anything/{test_path_param}";
          }

          @Override
          public Map<String, String> getPathParams() {
            return Collections.singletonMap("test_path_param", testParams);
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertEquals("POST", result.getMethod());
    assertFalse(result.getArgs().size() > 0);
  }

  @Test
  public void testHttpRequestQueryParams() throws Exception {
    final Map<String, List<String>> testParams =
        Collections.singletonMap("?key=1&", Arrays.asList("?value=1&"));
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/anything";
          }

          @Override
          public Map<String, List<String>> getQueryParams() {
            return testParams;
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertEquals("GET", result.getMethod());
    assertTrue(result.getArgs().size() == testParams.size());
    assertEquals("?value=1&", result.getArgs().get("?key=1&"));
  }

  static Stream<String> queryParamsArrayFormats() {
    return Stream.of(null, "", "csv", "multi", "ssv", "tsv", "pipes", "unknown");
  }

  @ParameterizedTest
  @MethodSource("queryParamsArrayFormats")
  public void testHttpRequestQueryParamsArray(String format) throws Exception {
    final Map<String, List<String>> testParams =
        Collections.singletonMap("?key=1&", Arrays.asList("?value\"1a&", "?value\"1b&"));
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/anything";
          }

          @Override
          public Map<String, List<String>> getQueryParams() {
            return testParams;
          }

          @Override
          protected Map<String, String> getCollectionFormatMap() {
            return Collections.singletonMap("?key=1&", format);
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertEquals("GET", result.getMethod());
    assertTrue(result.getArgs().size() == testParams.size());
    String delimiter = ","; // Collection format CSV by default
    if ("ssv".equals(format)) {
      delimiter = " ";
    } else if ("tsv".equals(format)) {
      delimiter = "\t";
    } else if ("pipes".equals(format)) {
      delimiter = "|";
    }
    if ("multi".equals(format)) {
      assertEquals("[?value\"1a&, ?value\"1b&]", result.getArgs().get("?key=1&").toString());
    } else {
      assertEquals(
          "\"?value\"\"1a&\"" + delimiter + "\"?value\"\"1b&\"", result.getArgs().get("?key=1&"));
    }
  }

  @ParameterizedTest
  @ValueSource(strings = {"GET"})
  public void testHttpRequestUserAgent(String input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/anything";
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertNotNull(result.getHeaders().get(HttpHeaders.USER_AGENT));
    final String pattern = "(.*)/(.*) \\((.*)/(.*)\\)";
    final Pattern r = Pattern.compile(pattern);
    final Matcher m = r.matcher(result.getHeaders().get(HttpHeaders.USER_AGENT));
    assertTrue(m.find());
    assertEquals(SDKInfo.getInstance().getSdkName(), m.group(1));
    assertEquals(SDKInfo.getInstance().getSdkVersion(), m.group(2));
    final AppInfo appInfo = httpbinConfigRepository.getAppInfo();
    assertEquals(appInfo.getAppName(), m.group(3));
    assertEquals(appInfo.getAppVersion(), m.group(4));
  }

  @ParameterizedTest
  @ValueSource(strings = {"GET"})
  public void testHttpRequestAmazonTraceId(String input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/anything";
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertNotNull(result.getHeaders().get(HttpHeaders.X_AMZN_TRACE_ID));
    final String pattern =
        (httpbinConfigRepository.getAmazonTraceIdVersion() + "-([0-9a-f]+)-([0-9a-f]+)");
    final Pattern r = Pattern.compile(pattern);
    final Matcher m = r.matcher(result.getHeaders().get(HttpHeaders.X_AMZN_TRACE_ID));
    assertTrue(m.find());
  }

  @Test
  public void testHttpRequestCookie() throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/anything";
          }

          @Override
          public Map<String, String> getCookieParams() {
            Map<String, String> cookies = new HashMap<>();
            cookies.put("test 1=1", "value 1=1");
            cookies.put("test 2=2", "value 2=2");
            cookies.put("test 3=3", "value 3=3");
            return cookies;
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    final String cookies = result.headers.get(HttpHeaders.COOKIE);
    assertNotNull(cookies); // Make sure cookie header is present
    for (Map.Entry<String, String> c : op.getCookieParams().entrySet()) {
      // Make sure each cookie key and value is escaped
      assertTrue(
          cookies.contains(
              URLEncoder.encode(c.getKey(), "UTF-8")
                  + "="
                  + URLEncoder.encode(c.getValue(), "UTF-8")));
    }
    assertTrue(cookies.contains("; ")); // Make sure there is space after semicolon
  }

  @Test
  public void testHttpRequestCookieAccessToken() throws Exception {
    final String token = "token12345";
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    tokenRepository.storeToken(token);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/anything";
          }
        };
    op.getSecurities().add("Cookie");
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    final String cookies = result.headers.get(HttpHeaders.COOKIE);
    assertNotNull(cookies); // Make sure cookie header is present
    assertTrue(cookies.contains("access_token=" + token));
  }

  @ParameterizedTest
  @ValueSource(strings = {"POST"})
  public void testHttpRequestForm(String input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/anything";
          }

          @Override
          public Map<String, Object> getFormParams() {
            Map<String, Object> params = new HashMap<>();
            params.put("?key=1&", "value=1&");
            params.put("?key=2&", "value=2&");
            return params;
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertEquals("value=1&", result.getForm().get("?key=1&"));
    assertEquals("value=2&", result.getForm().get("?key=2&"));
  }

  @ParameterizedTest
  @ValueSource(strings = {"POST"})
  public void testHttpRequestJson(String input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/anything";
          }

          @Override
          public Object getBodyParams() {
            return new DummyGameRecord("1", "2", 3);
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    final DummyGameRecord ret =
        new ObjectMapper().readValue(result.getData(), DummyGameRecord.class);
    assertEquals("1", ret.getFoo());
    assertEquals("2", ret.getFooBar());
    assertEquals(3, ret.getFooValue());
  }

  @ParameterizedTest
  @ValueSource(strings = {"POST"})
  public void testHttpRequestMultipart(String input) throws Exception {
    final File testFile = new File("test.json");
    final String testJson = "{ \"data\" : \"test http request multipart\"}";
    final String testStrategy = "replace";
    testFile.deleteOnExit();
    try (OutputStreamWriter testFileWriter =
        new OutputStreamWriter(new FileOutputStream(testFile), StandardCharsets.UTF_8)) {
      testFileWriter.write(testJson);
    }
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/anything";
          }

          @Override
          public List<String> getConsumes() {
            return Arrays.asList("multipart/form-data");
          }

          @Override
          public Map<String, Object> getFormParams() {
            Map<String, Object> params = new HashMap<>();
            params.put("file", testFile);
            params.put("strategy", testStrategy);
            return params;
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final HttpbinAnythingResponse result =
        op.parseResponse(res.getCode(), res.getContentType(), res.getPayload());
    assertNotNull(result);
    assertEquals(testJson, result.getFiles().get("file"));
    assertEquals(testStrategy, result.getForm().get("strategy"));
  }

  @ParameterizedTest
  @ValueSource(strings = {"POST"})
  public void testHttpResponseLocationQuery(String input) throws Exception {
    final String redirectUrl = "https://demo.accelbyte.io/admin?code=1234567890&state=";
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/redirect-to";
          }

          @Override
          public Map<String, List<String>> getQueryParams() {
            return Collections.singletonMap("url", Arrays.asList(redirectUrl));
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    final String location = Helper.convertInputStreamToString(res.getPayload());
    assertEquals(redirectUrl, location);
  }

  @ParameterizedTest
  @ValueSource(strings = {"GET"})
  public void testHttpResponseBodyEmpty(String input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return input;
          }

          @Override
          public String getPath() {
            return "/status/200";
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    assertNotNull(res);
    assertEquals(200, res.getCode());
  }

  @Test
  public void testHttpResponseBodyJson() throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/json";
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    assertNotNull(res);
    assertEquals(200, res.getCode()); // Httpbin JSON can only return 200
    assertNotNull(res.getPayload());
    final String text = Helper.convertInputStreamToString(res.getPayload());
    assertTrue(text.contains("WonderWidgets"));
  }

  @Test
  public void testHttpResponseBodyBinary() throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/image/jpeg";
          }
        };
    HttpResponse res = sdk.runRequest(op);
    assertNotNull(res);
    assertEquals(200, res.getCode()); // Httpbin JSON can only return 200
    assertNotNull(res.getPayload());
    final String text = Helper.convertInputStreamToString(res.getPayload());
    assertTrue(text.contains("JFIF"));
  }

  @Test
  public void testHttpResponseBodyHtml() throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/html";
          }
        };
    final HttpResponse res = sdk.runRequest(op);
    assertNotNull(res);
    assertEquals(200, res.getCode()); // Httpbin JSON can only return 200
    assertNotNull(res.getPayload());
    final String text = Helper.convertInputStreamToString(res.getPayload());
    assertTrue(text.contains("Melville"));
  }

  @ParameterizedTest
  @ValueSource(ints = {403, 404, 503})
  public void testHttpResponseStatusError(int input) throws Exception {
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
    final HttpbinOperation op =
        new HttpbinOperation() {
          @Override
          public String getMethod() {
            return "GET";
          }

          @Override
          public String getPath() {
            return "/status/" + input;
          }
        };
    HttpResponse res = sdk.runRequest(op);
    assertNotNull(res);
    assertEquals(input, res.getCode());
  }

  @Test
  public void testHttpRetryStatus() throws Exception {
    final MockServerResetResponseOperation mockResetOp = new MockServerResetResponseOperation();
    final MockServerConfigureResponseOperation mockConfigureOp =
        new MockServerConfigureResponseOperation();
    final MockServerResponseConfiguration mockConf = new MockServerResponseConfiguration();
    final int mockErrorStatusCode = 503;
    final int mockSuccessStatusCode = 200;

    mockConfigureOp.setBody(mockConf);
    mockConf.setEnabled(true);
    mockConf.setOverwrite(true);

    final DefaultHttpRetryPolicy retryPolicy =
        new DefaultHttpRetryPolicy() {
          @Override
          public boolean doRetry(
              int attempt, Operation operation, HttpResponse response, Exception exception) {
            final int remaining = getMaxRetry() - attempt;
            if (remaining > 1) {
              assertNotNull(response);
              assertEquals(mockErrorStatusCode, response.getCode());
            } else {
              try {
                mockConf.setStatus(mockSuccessStatusCode); // Make the last attempt to be successful
                httpClient.sendRequest(
                    mockConfigureOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
              } catch (Exception e) {
                fail("Failed to configure mock server");
              }
            }

            return super.doRetry(attempt, operation, response, exception);
          }
        };

    retryPolicy.setCallTimeout(3000);
    retryPolicy.setMaxRetry(3);
    retryPolicy.setRetryInterval(2000);

    final AccelByteSDK sdk =
        new AccelByteSDK(reliableHttpClient, tokenRepository, mockServerConfigRepository);

    reliableHttpClient.setHttpRetryPolicy(retryPolicy);

    final GetCountryLocationV3 op = GetCountryLocationV3.builder().build();

    HttpResponse res = null;

    retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);
    mockConf.setStatus(mockErrorStatusCode);
    httpClient.sendRequest(mockResetOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    httpClient.sendRequest(
        mockConfigureOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    long beforeLinear = System.currentTimeMillis();
    res = sdk.runRequest(op);
    long afterLinear = System.currentTimeMillis();

    assertNotNull(res);
    assertEquals(mockSuccessStatusCode, res.getCode());
    assertNotNull(res.getPayload());

    retryPolicy.setRetryIntervalType(RetryIntervalType.EXPONENTIAL);
    mockConf.setStatus(mockErrorStatusCode);
    httpClient.sendRequest(mockResetOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    httpClient.sendRequest(
        mockConfigureOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    long beforeExponential = System.currentTimeMillis();
    res = sdk.runRequest(op);
    long afterExponential = System.currentTimeMillis();

    assertNotNull(res);
    assertEquals(mockSuccessStatusCode, res.getCode());
    assertNotNull(res.getPayload());

    assertTrue(afterLinear - beforeLinear < afterExponential - beforeExponential);
  }

  @Test
  public void testHttpRetryTimeout() throws Exception {
    final MockServerResetResponseOperation mockResetOp = new MockServerResetResponseOperation();
    final MockServerConfigureResponseOperation mockConfigureOp =
        new MockServerConfigureResponseOperation();
    final MockServerResponseConfiguration mockConf = new MockServerResponseConfiguration();

    mockConfigureOp.setBody(mockConf);
    mockConf.setEnabled(true);
    mockConf.setOverwrite(true);
    mockConf.setStatus(200);

    final DefaultHttpRetryPolicy retryPolicy =
        new DefaultHttpRetryPolicy() {
          @Override
          public boolean doRetry(
              int attempt, Operation operation, HttpResponse response, Exception exception) {
            final int remaining = getMaxRetry() - attempt;
            if (remaining > 1) {
              assertNull(response);
              assertNotNull(exception);
            } else {
              try {
                mockConf.setDelay(0);
                httpClient.sendRequest(
                    mockConfigureOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
              } catch (Exception e) {
                fail("Failed to configure mock server");
              }
            }

            return super.doRetry(attempt, operation, response, exception);
          }
        };

    retryPolicy.setCallTimeout(3000);
    retryPolicy.setMaxRetry(3);
    retryPolicy.setRetryInterval(2000);

    final AccelByteSDK sdk =
        new AccelByteSDK(reliableHttpClient, tokenRepository, mockServerConfigRepository);

    reliableHttpClient.setHttpRetryPolicy(retryPolicy);

    final GetCountryLocationV3 op = GetCountryLocationV3.builder().build();

    HttpResponse res = null;

    retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);
    mockConf.setDelay(retryPolicy.getCallTimeout() / 1000 + 1);
    httpClient.sendRequest(mockResetOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    httpClient.sendRequest(
        mockConfigureOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    long beforeLinear = System.currentTimeMillis();
    res = sdk.runRequest(op);
    long afterLinear = System.currentTimeMillis();

    assertNotNull(res);
    assertEquals(200, res.getCode());
    assertNotNull(res.getPayload());

    retryPolicy.setRetryIntervalType(RetryIntervalType.EXPONENTIAL);
    mockConf.setDelay(retryPolicy.getCallTimeout() / 1000 + 1);
    httpClient.sendRequest(mockResetOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    httpClient.sendRequest(
        mockConfigureOp, mockServerConfigRepository.getBaseURL(), new HttpHeaders());
    long beforeExponential = System.currentTimeMillis();
    res = sdk.runRequest(op);
    long afterExponential = System.currentTimeMillis();

    assertNotNull(res);
    assertEquals(200, res.getCode());
    assertNotNull(res.getPayload());

    assertTrue(afterLinear - beforeLinear < afterExponential - beforeExponential);
  }

  @Test
  public void testTokenRefreshUser() throws Exception {
    final DefaultTokenRefreshRepository tokenRefreshRepository =
        new DefaultTokenRefreshRepository();
    final AccelByteSDK sdk =
        new AccelByteSDK(httpClient, tokenRefreshRepository, mockServerConfigRepository);
    final OAuth20Extension wrapper = new OAuth20Extension(sdk);

    sdk.loginUser("fakeuser", "fakepassword");

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken() != null
            && !"".equals(tokenRefreshRepository.getRefreshToken()));

    // Simulate token expiry within threshold and refresh token still valid for 24
    // hours
    tokenRefreshRepository.setTokenExpiresAt(Date.from(Instant.now().plusSeconds(60)));

    wrapper.getCountryLocationV3(GetCountryLocationV3.builder().build());

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken() != null
            && !"".equals(tokenRefreshRepository.getRefreshToken()));
  }

  @Test
  public void testTokenRefreshClient() throws Exception {
    final DefaultTokenRefreshRepository tokenRefreshRepository =
        new DefaultTokenRefreshRepository();
    final AccelByteSDK sdk =
        new AccelByteSDK(httpClient, tokenRefreshRepository, mockServerConfigRepository);
    final OAuth20Extension wrapper = new OAuth20Extension(sdk);

    sdk.loginClient();

    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
    assertTrue(
        tokenRefreshRepository.getRefreshToken()
            == null); // Login client does not return refresh token

    // Simulate token expiry within threshold
    tokenRefreshRepository.setTokenExpiresAt(Date.from(Instant.now().plusSeconds(60)));

    wrapper.getCountryLocationV3(GetCountryLocationV3.builder().build());

    // Check if access token is set correctly after refresh token
    assertTrue(
        tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
  }

    public static class TestLobbyListener extends WebSocketListener {

        @Getter
        private String lobbySessionId;

        @Getter
        private String token;

        @Getter
        private int numPartyCreateRequestsReceived;

        @Getter
        private CountDownLatch lobbySesionIdLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch tokenLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch partyRequestLatch = new CountDownLatch(1);

        @Getter
        private CountDownLatch onOpenedLatch = new CountDownLatch(1);

        public void resetLobbySessionIdLatch() {
            lobbySesionIdLatch = new CountDownLatch(1);
        }

        public void resetTokenLatch() {
            tokenLatch = new CountDownLatch(1);
        }

        public void resetOnOpenedLatch() {
            onOpenedLatch = new CountDownLatch(1);
        }

        public void resetPartyRequestLatch() {
            partyRequestLatch = new CountDownLatch(1);
        }

        public void resetNumPartyCreateRequestsReceived() {
            numPartyCreateRequestsReceived = 0;
        }
        @Override
        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
            log.info("Client onMessage: --> " + text);
            if (text.contains(ConnectNotif.getType())) {
                final ConnectNotif notif = ConnectNotif.createFromWSM(text);
                lobbySessionId = notif.getLobbySessionID();
                log.info("lobbySessionID: " + lobbySessionId);
                lobbySesionIdLatch.countDown();
            } else if (text.contains(RefreshTokenRequest.getType())) {
                final RefreshTokenRequest notif = RefreshTokenRequest.createFromWSM(text);
                token = notif.getToken();
                log.info("Refreshed token: " + token);
                tokenLatch.countDown();
            } else if (text.contains(PartyCreateRequest.getType())) {
                final PartyCreateRequest notif = PartyCreateRequest.createFromWSM(text);
                log.info("Party create request id: " + notif.getId());
                numPartyCreateRequestsReceived++;
                partyRequestLatch.countDown();
            }
        }

        @Override
        public void onOpen(WebSocket webSocket, okhttp3.Response response) {
            log.info("Client onOpen");
        }

        @Override
        public void onClosing(WebSocket webSocket, int code, String reason) {
            log.info("Client onClosing");
        }

        @Override
        public void onClosed(WebSocket webSocket, int code, String reason) {
            log.info("Client onClosed");
        }

        @Override
        public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
            log.info("Client onFailure");
        }
    }

    public void forceCloseMockServer(String baseUrl, int statusCode) throws Exception {
        // Build the POST request without a body
        Request request = new Request.Builder()
                .url(baseUrl + "/ws/lobby/force-close?errorCode=" + statusCode)
                .post(RequestBody.create(null, new byte[0])) // Use an empty body
                .build();

        // Execute the request and get the response
        try (Response response = client.newCall(request).execute()) {
            // Assert the status code of the response
            assertEquals(204, response.code());     // 204 No Content
        }
    }

    // Verifies a ws closure of 2000 status code will yield auto-reconnect, and the previous lobby session id will be reused
    // In conjunction validates the lobby token refresh for the ws event still works after reconnect
    @Test
    public void testLobbyReconnectWithTokenRefresh() throws Exception {
        final int FORCE_WS_CLOSE_STATUS_CODE = 2000;
        final int RECONNECT_DELAY_MS = 2000;
        final int PING_INTERVAL_MS = 1000;
        final int MAX_NUM_RECONNECT_ATTEMPTS = 10;

        final MockServerConfigRepository configRepo = new MockServerConfigRepository();

        final TestLobbyListener lobbyListener = new TestLobbyListener();

        final LobbyWebSocketClient ws =
            LobbyWebSocketClient.create(
                configRepo,
                DefaultTokenRepository.getInstance(),
                lobbyListener,
                RECONNECT_DELAY_MS,
                MAX_NUM_RECONNECT_ATTEMPTS,
                PING_INTERVAL_MS);

        // Connect to the Mock Server’s Lobby Service.
        ws.connect();

        // Assert we're connected
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Await for the connectNotif message, or timeout
        lobbyListener.getLobbySesionIdLatch().await(5, TimeUnit.SECONDS);

        // Assert that the value from the WebSocket Client using GetData("LobbySessionId") is equal to originalLobbySessionId.
        String originalLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(lobbyListener.getLobbySessionId(), originalLobbySessionId);

        // Force close the Mock Server WS connection
        log.info("force closing mock server - status " + FORCE_WS_CLOSE_STATUS_CODE);
        forceCloseMockServer(configRepo.getBaseURL(), FORCE_WS_CLOSE_STATUS_CODE);

        // Assert that the websocket connection has disconnected.
        assertFalse(ws.isConnected());

        // Assert that the websocket connection has reconnected.
        lobbyListener.getOnOpenedLatch().await(RECONNECT_DELAY_MS + 5000, TimeUnit.MILLISECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        String newLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(lobbyListener.getLobbySessionId(), newLobbySessionId);

        // Assert that the originalLobbySessionId is equal to newLobbySessionId
        assertEquals(originalLobbySessionId, newLobbySessionId);

        // Manually trigger a token refresh to test the token callback still works to trigger a ws message -> echo back
        DefaultTokenRepository.getInstance().storeToken("mockToken1");
        // only the 2nd token will trigger a token refresh (by design)
        DefaultTokenRepository.getInstance().storeToken("mockToken2");
        lobbyListener.getTokenLatch().await(6, TimeUnit.SECONDS);
        assertEquals("mockToken2", lobbyListener.getToken());

        ws.close(1000, "Normal close");
    }

    @Test
    public void testLobbyReconnectWithMultipleMessages() throws Exception {
        final int FORCE_WS_CLOSE_STATUS_CODE = 2000;
        final int RECONNECT_DELAY_MS = 2000;
        final int PING_INTERVAL_MS = 1000;
        final int MAX_NUM_RECONNECT_ATTEMPTS = 10;

        final MockServerConfigRepository configRepo = new MockServerConfigRepository();

        final TestLobbyListener lobbyListener = new TestLobbyListener();

        final LobbyWebSocketClient ws =
                LobbyWebSocketClient.create(
                        configRepo,
                        DefaultTokenRepository.getInstance(),
                        lobbyListener,
                        RECONNECT_DELAY_MS,
                        MAX_NUM_RECONNECT_ATTEMPTS,
                        PING_INTERVAL_MS);

        // Connect to the Mock Server’s Lobby Service.
        ws.connect();

        // Assert we're connected
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // sends a party request message (partyCreateRequestId_1)
        ws.sendMessage(PartyCreateRequest.builder().id("partyCreateRequestId_1").build().toWSM());

        // awaits for the party request message to be echo-ed back
        lobbyListener.getPartyRequestLatch().await(3, TimeUnit.SECONDS);
        lobbyListener.resetPartyRequestLatch();

        // Force close the Mock Server WS connection
        log.info("force closing mock server - status " + FORCE_WS_CLOSE_STATUS_CODE);
        forceCloseMockServer(configRepo.getBaseURL(), FORCE_WS_CLOSE_STATUS_CODE);

        // Assert that the websocket connection has disconnected.
        assertFalse(ws.isConnected());

        // Assert that the websocket connection has reconnected.
        lobbyListener.getOnOpenedLatch().await(RECONNECT_DELAY_MS + 5000, TimeUnit.MILLISECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Multiple ws events check (1 before reconnect, 2 after reconnect)
        // Sends a party request message (partyCreateRequestId_2 & partyCreateRequestId_3)
        int NUM_MSG_TO_SEND = 3;
        for (int i=2; i <= NUM_MSG_TO_SEND; i++) {
            ws.sendMessage(PartyCreateRequest.builder().id("partyCreateRequestId_" + i).build().toWSM());
            // awaits for the party request message to be echo-ed back
            lobbyListener.getPartyRequestLatch().await(3, TimeUnit.SECONDS);
            lobbyListener.resetPartyRequestLatch();
        }

        // Lastly, check if have gotten NUM_MSG_TO_SEND party create requests (1 before disconnect + NUM_MSG_TO_SEND-1 after reconnection)
        assertEquals(NUM_MSG_TO_SEND, lobbyListener.getNumPartyCreateRequestsReceived());

        ws.close(1000, "Normal close");
    }

    // Verifies that a closure code of 4000 (DisconnectServerShutdown) code will not reconnect
    // For a subsequent new websocket the lobby session id will use a different one
    @Test
    public void testLobbyDisconnectServerShutdown() throws Exception {
        final int FORCE_WS_CLOSE_STATUS_CODE = 4000;
        final int RECONNECT_DELAY_MS = 2000;
        final int PING_INTERVAL_MS = 1000;
        final int MAX_NUM_RECONNECT_ATTEMPTS = 10;

        final MockServerConfigRepository configRepo = new MockServerConfigRepository();

        final TestLobbyListener lobbyListener = new TestLobbyListener();

        LobbyWebSocketClient ws =
                LobbyWebSocketClient.create(
                        configRepo,
                        DefaultTokenRepository.getInstance(),
                        lobbyListener,
                        RECONNECT_DELAY_MS,
                        MAX_NUM_RECONNECT_ATTEMPTS,
                        PING_INTERVAL_MS);

        // Connect to the Mock Server’s Lobby Service.
        ws.connect();

        // Await for the connectNotif message, or timeout
        lobbyListener.getLobbySesionIdLatch().await(10, TimeUnit.SECONDS);

        // Assert we're connected
        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Assert that the value from the WebSocket Client using GetData("LobbySessionId") is equal to originalLobbySessionId.
        final String originalLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(lobbyListener.getLobbySessionId(), originalLobbySessionId);

        // Force close the Mock Server WS connection
        log.info("force closing mock server - status " + FORCE_WS_CLOSE_STATUS_CODE);
        forceCloseMockServer(configRepo.getBaseURL(), FORCE_WS_CLOSE_STATUS_CODE);

        // Wait for X second for Reconnect to happen (shouldn't be).
        Thread.sleep(RECONNECT_DELAY_MS + 3000);

        // Assert that the websocket connection is still disconnected and didn't reconnect
        assertFalse(ws.isConnected());

        // Assert that the value from the WebSocket Client using GetData("LobbySessionId") is null
        String newLobbySessionId = (String) ws.getData(LobbyWebSocketClient.LOBBY_SESSION_ID_DATAMAP_KEY);
        assertEquals(null, newLobbySessionId);

        // Start a new connection to the Mock Server’s Lobby Service.
        ws = LobbyWebSocketClient.create(
                configRepo,
                DefaultTokenRepository.getInstance(),
                lobbyListener,
                MAX_NUM_RECONNECT_ATTEMPTS,
                RECONNECT_DELAY_MS,
                PING_INTERVAL_MS);

        ws.connect();

        lobbyListener.getLobbySesionIdLatch().await(10, TimeUnit.SECONDS);

        lobbyListener.getOnOpenedLatch().await(5, TimeUnit.SECONDS);
        assertTrue(ws.isConnected());
        lobbyListener.resetOnOpenedLatch();

        // Wait for the connectNotif message, store lobbySessionId from the connectNotif message into the temporary variable: newLobbySessionId.
        String newLobbysessionId = lobbyListener.getLobbySessionId();

        // Assert that the originalLobbySessionId is not equal to newLobbySessionId.
        assertNotEquals(newLobbysessionId, originalLobbySessionId);

        ws.close(1000, "Normal close");
    }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.util.Helper;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import com.fasterxml.jackson.databind.ObjectMapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

@Tag("test-core")
class TestCore {
    private final OkhttpClient httpClient = new OkhttpClient();
    private final TokenRepository tokenRepository = DefaultTokenRepository.getInstance();
    private final ConfigRepository httpbinConfigRepository = new HttpbinConfigRepository();

    @ParameterizedTest
    @ValueSource(strings = { "GET", "POST", "PUT", "PATCH", "DELETE" })
    void testHttpRequestMethod(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
            @Override
            public String getMethod() {
                return input;
            }

            @Override
            public String getPath() {
                return "/anything";
            }
        };
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertEquals(input, result.getMethod());
    }

    @Test
    void testHttpRequestPathParams() throws HttpResponseException, IOException {
        final String testParams = "abc/def:123?x=1&y=2";
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertEquals("POST", result.getMethod());
        assertFalse(result.getArgs().size() > 0);
    }

    @Test
    void testHttpRequestQueryParams() throws HttpResponseException, IOException {
        final Map<String, List<String>> testParams = Collections.singletonMap("?key=1&",
                Arrays.asList("?value=1&"));
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
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
    void testHttpRequestQueryParamsArray(String format) throws HttpResponseException, IOException {
        final Map<String, List<String>> testParams = Collections.singletonMap("?key=1&",
                Arrays.asList("?value\"1a&", "?value\"1b&"));
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertEquals("GET", result.getMethod());
        assertTrue(result.getArgs().size() == testParams.size());
        String delimiter = ","; // Collection format CSV by default
        if (format == "ssv") {
            delimiter = " ";
        } else if (format == "tsv") {
            delimiter = "\t";
        } else if (format == "pipes") {
            delimiter = "|";
        }
        if (format == "multi") {
            assertEquals("[?value\"1a&, ?value\"1b&]",
                    result.getArgs().get("?key=1&").toString());
        } else {
            assertEquals("\"?value\"\"1a&\"" + delimiter + "\"?value\"\"1b&\"",
                    result.getArgs().get("?key=1&"));
        }
    }

    @ParameterizedTest
    @ValueSource(strings = { "GET" })
    void testHttpRequestUserAgent(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
            @Override
            public String getMethod() {
                return input;
            }

            @Override
            public String getPath() {
                return "/anything";
            }
        };
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertNotNull(result.getHeaders().get(HttpHeaders.USER_AGENT));
        String pattern = "(.*)/(.*) \\((.*)/(.*)\\)";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(result.getHeaders().get(HttpHeaders.USER_AGENT));
        assertTrue(m.find());
        assertEquals(SDKInfo.getInstance().getSdkName(), m.group(1));
        assertEquals(SDKInfo.getInstance().getSdkVersion(), m.group(2));
        AppInfo appInfo = httpbinConfigRepository
                .getAppInfo();
        assertEquals(appInfo.getAppName(), m.group(3));
        assertEquals(appInfo.getAppVersion(), m.group(4));
    }

    @ParameterizedTest
    @ValueSource(strings = { "GET" })
    void testHttpRequestAmazonTraceId(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
            @Override
            public String getMethod() {
                return input;
            }

            @Override
            public String getPath() {
                return "/anything";
            }
        };
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertNotNull(result.getHeaders().get(HttpHeaders.X_AMZN_TRACE_ID));
        String pattern = "Root=.+";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(result.getHeaders().get(HttpHeaders.X_AMZN_TRACE_ID));
        assertTrue(m.find());
    }

    @Test
    void testHttpRequestCookie() throws IOException, HttpResponseException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        String cookies = result.headers.get(HttpHeaders.COOKIE);
        assertNotNull(cookies); // Make sure cookie header is present
        for (Map.Entry<String, String> c : op.getCookieParams().entrySet()) {
            // Make sure each cookie key and value is escaped
            assertTrue(cookies.contains(URLEncoder.encode(c.getKey(), "UTF-8") +
                    "=" + URLEncoder.encode(c.getValue(), "UTF-8")));
        }
        assertTrue(cookies.contains("; ")); // Make sure there is space after semicolon
    }

    @Test
    void testHttpRequestCookieAccessToken() throws IOException, HttpResponseException {
        final String token = "token12345";
        AccelByteSDK sdk = new AccelByteSDK(httpClient,
                tokenRepository,
                httpbinConfigRepository);
        tokenRepository.storeToken(token);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        String cookies = result.headers.get(HttpHeaders.COOKIE);
        assertNotNull(cookies); // Make sure cookie header is present
        assertTrue(cookies.contains("access_token=" + token));
    }

    @ParameterizedTest
    @ValueSource(strings = { "POST" })
    void testHttpRequestForm(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertEquals("value=1&", result.getForm().get("?key=1&"));
        assertEquals("value=2&", result.getForm().get("?key=2&"));
    }

    @ParameterizedTest
    @ValueSource(strings = { "POST" })
    void testHttpRequestJson(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        DummyGameRecord ret = new ObjectMapper().readValue(result.getData(), DummyGameRecord.class);
        assertEquals("1", ret.getFoo());
        assertEquals("2", ret.getFooBar());
        assertEquals(3, ret.getFooValue());
    }

    @ParameterizedTest
    @ValueSource(strings = { "POST" })
    void testHttpRequestMultipart(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
                try {
                    Map<String, Object> params = new HashMap<>();
                    params.put("file", new ByteArrayInputStream("test".getBytes("UTF-8")));
                    params.put("strategy", "replace");
                    return params;
                } catch (UnsupportedEncodingException e) {
                    return null;
                }
            }
        };
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertEquals("test", result.getFiles().get("file"));
        assertEquals("replace", result.getForm().get("strategy"));
    }

    @ParameterizedTest
    @ValueSource(strings = { "POST" })
    void testHttpResponseLocationQuery(String input) throws HttpResponseException, IOException {
        final String redirectUrl = "https://demo.accelbyte.io/admin?code=1234567890&state=";
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
                return Collections.singletonMap("url",
                        Arrays.asList(redirectUrl));
            }
        };
        HttpResponse res = sdk.runRequest(op);
        String location = Helper.convertInputStreamToString(res.getPayload());
        assertEquals(redirectUrl, location);
    }

    @ParameterizedTest
    @ValueSource(strings = { "GET" })
    void testHttpResponseBodyEmpty(String input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
            @Override
            public String getMethod() {
                return input;
            }

            @Override
            public String getPath() {
                return "/status/200";
            }
        };
        HttpResponse res = sdk.runRequest(op);
        assertNotNull(res);
        assertEquals(200, res.getCode());
        assertNull(res.getPayload());
    }

    @Test
    void testHttpResponseBodyJson() throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
            @Override
            public String getMethod() {
                return "GET";
            }

            @Override
            public String getPath() {
                return "/json";
            }
        };
        HttpResponse res = sdk.runRequest(op);
        assertNotNull(res);
        assertEquals(200, res.getCode()); // Httpbin JSON can only return 200
        assertNotNull(res.getPayload());
        final String text = Helper.convertInputStreamToString(res.getPayload());
        assertTrue(text.contains("WonderWidgets"));
    }

    @Test
    void testHttpResponseBodyBinary() throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
    void testHttpResponseBodyHtml() throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
            @Override
            public String getMethod() {
                return "GET";
            }

            @Override
            public String getPath() {
                return "/html";
            }
        };
        HttpResponse res = sdk.runRequest(op);
        assertNotNull(res);
        assertEquals(200, res.getCode()); // Httpbin JSON can only return 200
        assertNotNull(res.getPayload());
        final String text = Helper.convertInputStreamToString(res.getPayload());
        assertTrue(text.contains("Melville"));
    }

    @ParameterizedTest
    @ValueSource(ints = { 403, 404, 503 })
    void testHttpResponseStatusError(int input) throws HttpResponseException, IOException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation() {
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
        assertNull(res.getPayload());
    }
}

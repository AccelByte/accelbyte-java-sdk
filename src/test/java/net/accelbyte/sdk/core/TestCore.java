/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
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
        final String testPathParam = "abc/def:123?x=1&y=2";
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
                return Collections.singletonMap("test_path_param", testPathParam);
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
        final Map<String, List<String>> testPathParam = Collections.singletonMap("?key=1&",
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
                return testPathParam;
            }
        };
        HttpResponse res = sdk.runRequest(op);
        HttpbinAnythingResponse result = op.parseResponse(
                res.getCode(),
                res.getContentType(),
                res.getPayload());
        assertNotNull(result);
        assertEquals("GET", result.getMethod());
        assertTrue(result.getArgs().size() > 0);
        assertEquals("?value=1&", result.getArgs().get("?key=1&"));
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
    void testRequestCookie() throws IOException, HttpResponseException {
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
    void testRequestCookieAccessToken() throws IOException, HttpResponseException {
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

    private final String namespace = "accelbyte";
    private final String userId = "511132939439";
    private final String baseUrl = "https://accelbyte.io";

    @Test
    void testCreateFullUrlNoneListQueryParams() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        // not an array query string value
        queryParams.put("city", Collections.singletonList("Seattle"));
        queryParams.put("color", Collections.singletonList("red"));
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?color=red&city=Seattle";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlDefaultCollectionFormat() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("emails", Arrays.asList("test@test.net", "check@check.io"));
        queryParams.put("appIds", Arrays.asList("1", "2"));
        collectionFormatMap.put("emails", "notDefinedType");
        collectionFormatMap.put("appIds", null);
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?emails=test%40test.net,check%40check.io&appIds=1,2";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlCSVCollectionFormat() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("emails", Arrays.asList("test@test.net", "check@check.io"));
        queryParams.put("appIds", Arrays.asList("1", "2"));
        collectionFormatMap.put("emails", "csv");
        collectionFormatMap.put("appIds", "csv");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?emails=test%40test.net,check%40check.io&appIds=1,2";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlMultiCollectionFormat() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("appIds", Arrays.asList("1", "2"));
        queryParams.put("skus", Arrays.asList("3", "4"));
        collectionFormatMap.put("appIds", "multi");
        collectionFormatMap.put("skus", "multi");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?appIds=1&appIds=2&skus=3&skus=4";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlPipesCollectionFormat() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("emails", Arrays.asList("test@test.net", "check@check.io"));
        queryParams.put("appIds", Arrays.asList("1", "2"));
        collectionFormatMap.put("emails", "pipes");
        collectionFormatMap.put("appIds", "pipes");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?emails=test%40test.net|check%40check.io&appIds=1|2";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlTsvCollectionFormat() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("emails", Arrays.asList("test@test.net", "check@check.io"));
        queryParams.put("appIds", Arrays.asList("1", "2"));
        collectionFormatMap.put("emails", "tsv");
        collectionFormatMap.put("appIds", "tsv");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?emails=test%40test.net\tcheck%40check.io&appIds=1\t2";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlSsvCollectionFormat() throws Exception {
        Map<String, String> pathParams = new HashMap<>();
        Map<String, List<String>> queryParams = new HashMap<>();
        Map<String, String> collectionFormatMap = new HashMap<>();
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("emails", Arrays.asList("test@test.net", "check@check.io"));
        queryParams.put("appIds", Arrays.asList("1", "2"));
        collectionFormatMap.put("emails", "ssv");
        collectionFormatMap.put("appIds", "ssv");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?emails=test%40test.net check%40check.io&appIds=1 2";
        String fullUrl = Helper.createFullUrl(baseUrl, url, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.util.Helper;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

@Tag("unit-test")
class CoreUnitTest {
    private final HttpClient<?> httpClient = new OkhttpClient();
    private final TokenRepository tokenRepository = DefaultTokenRepository.getInstance();
    private final ConfigRepository httpbinConfigRepository = new HttpbinConfigRepository();

    @Test
    void testCookie() throws IOException, ResponseException {
        AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepository, httpbinConfigRepository);
        HttpbinOperation op = new HttpbinOperation("GET") {
            @Override
            public Map<String, String> getCookieParams() {
                Map<String,String> cookies = new HashMap<>();
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
    void testCookieAccessToken() throws IOException, ResponseException {
        final String token = "token12345";
        AccelByteSDK sdk = new AccelByteSDK(httpClient,
                tokenRepository,
                httpbinConfigRepository);
        tokenRepository.storeToken(token);
        HttpbinOperation op = new HttpbinOperation("GET");
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }
}

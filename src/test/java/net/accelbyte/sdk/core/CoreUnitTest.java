/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import net.accelbyte.sdk.core.util.Helper;

import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;

@Tag("unit-test")
class CoreUnitTest {

    String namespace = "accelbyte";
    String userId = "511132939439";
    String baseUrl = "https://accelbyte.io";
    Map<String, String> pathParams = new HashMap<>();
    Map<String, List<String>> queryParams = new HashMap<>();
    Map<String, String> collectionFormatMap = new HashMap<>();

    @Test
    void testCreateFullUrlNoneListQueryParams() throws Exception {
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

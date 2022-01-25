package net.accelbyte.sdk.core;

import org.junit.jupiter.api.Test;

import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;

class OperationTest {

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
        queryParams.put("city", Collections.singletonList("Seattle"));
        queryParams.put("color", Collections.singletonList("red"));
        collectionFormatMap.put("city", null);
        collectionFormatMap.put("color", "None");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?color=red&city=Seattle";
        String fullUrl = Operation.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
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
        String fullUrl = Operation.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }

    @Test
    void testCreateFullUrlCSVCollectionFormat() throws Exception {
        String url = "/platform/namespace/{namespace}/userId/{userId}";
        pathParams.put("namespace", namespace);
        pathParams.put("userId", userId);
        queryParams.put("emails", Arrays.asList("test@test.net", "check@check.io"));
        collectionFormatMap.put("emails", "csv");
        String expected = "https://accelbyte.io/platform/namespace/accelbyte/userId/511132939439?emails=test%40test.net,check%40check.io";
        String fullUrl = Operation.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
        assertEquals(expected, fullUrl);
    }
}

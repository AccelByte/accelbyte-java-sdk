/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.util.Helper;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class Operation {
    protected String url = "";
    protected String method = "";
    protected List<String> consumes = new ArrayList<>();
    protected List<String> produces = new ArrayList<>();
    @Deprecated
    protected String security = "";
    protected String preferredSecurityMethod = "";
    protected List<String> securities = new ArrayList<>();
    protected String locationQuery = "";

    public Map<String, String> getPathParams() {
        return new HashMap<>();
    }

    public Map<String, List<String>> getQueryParams() {
        return new HashMap<>();
    }

    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return null;
    }

    public Map<String, String> getCookieParams() {
        return new HashMap<>();
    }

    public Object getBodyParams() {
        return null;
    }

    public Map<String, Object> getFormParams() {
        return null;
    }

    public boolean isValid() {
        return false;
    }

    public Object parseResponse(int code, String contentTpe, InputStream payload)
            throws ResponseException, IOException {
        return null;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
            throws ResponseException, IOException {

    }

    protected Map<String, String> getCollectionFormatMap() {
        return new HashMap<>();
    }

    protected String createFullUrl(String url, String baseUrl, Map<String, String> pathParams,
            Map<String, List<String>> queryParams, Map<String, String> collectionFormatMap)
            throws UnsupportedEncodingException {
        return Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
    }

    protected String convertInputStreamToString(InputStream is) throws IOException {
        return Helper.convertInputStreamToString(is);
    }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @JsonIgnore
    protected String url = "";

    @JsonIgnore
    protected String method = "";

    @JsonIgnore
    protected List<String> consumes = new ArrayList<>();

    @JsonIgnore
    protected List<String> produces = new ArrayList<>();

    @JsonIgnore
    protected String security = "";

    @JsonIgnore
    protected String locationQuery = "";

    @JsonIgnore
    protected String authorizationOverride = "";

    @JsonIgnore
    protected static String createFullUrl(String url, String baseUrl, Map<String, String> pathParams,
            Map<String, List<String>> queryParams, Map<String, String> collectionFormatMap)
            throws UnsupportedEncodingException {
        return Helper.createFullUrl(url, baseUrl, pathParams, queryParams, collectionFormatMap);
    }

    @JsonIgnore
    public Map<String, String> getPathParams() {
        return new HashMap<>();
    }

    @JsonIgnore
    public Map<String, List<String>> getQueryParams() {
        return new HashMap<>();
    }

    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return null;
    }

    @JsonIgnore
    public Object getBodyParams() {
        return null;
    }

    @JsonIgnore
    public Map<String, Object> getFormDataParams() {
        return null;
    }

    @JsonIgnore
    public boolean isValid() {
        return false;
    }

    @JsonIgnore
    public Object parseResponse(int code, String contentTpe, InputStream payload)
            throws ResponseException, IOException {
        return null;
    }

    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
            throws ResponseException, IOException {

    }

    @JsonIgnore
    protected Map<String, String> getCollectionFormatMap() {
        return new HashMap<>();
    }

    @JsonIgnore
    protected String convertInputStreamToString(InputStream is) throws IOException {
        return Helper.convertInputStreamToString(is);
    }
}

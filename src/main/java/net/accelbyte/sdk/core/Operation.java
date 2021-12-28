package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.util.Helper;

import java.io.IOException;
import java.io.InputStream;
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

    public Map<String, String> getPathParams() {
        return new HashMap<>();
    }

    public Map<String, String> getQueryParams() {
        return new HashMap<>();
    }

    public Map<String, Map<String, String>> getAllParams() {
        return new HashMap<>();
    }

    public String getFullUrl(String baseUrl) {
        return null;
    }

    public static String createFullUrl(String url, String baseUrl, Map<String, String> pathParams, Map<String, String> queryParams) {
        StringBuilder result = new StringBuilder();

        // base url
        if (baseUrl != null && baseUrl.endsWith("/")) {
            baseUrl = baseUrl.split("/")[0] + "//" + baseUrl.split("/")[2];
        }
        result.append(baseUrl);

        // path params
        if (pathParams != null) {
            for (Map.Entry<String, String> pathParam : pathParams.entrySet()) {
                url = url.replace("{" + pathParam.getKey() + "}", pathParam.getValue());
            }
            result.append(url);
        }

        // query params
        StringBuilder queryParamBuilder = new StringBuilder();
        for (Map.Entry<String, String> queryParam : queryParams.entrySet()) {
            queryParamBuilder.append("&");
            queryParamBuilder.append(queryParam.getKey());
            queryParamBuilder.append("=");
            queryParamBuilder.append(queryParam.getValue());
        }
        result.append("?");
        result.append(queryParamBuilder);
        return result.toString();
    }

    @JsonIgnore
    public Map<String, String> getHeaderParams() {
        return null;
    }

    @JsonIgnore
    public Object getBodyParams() {
        return null;
    }

    @JsonIgnore
    public Map<String, String> getFormDataParams() {
        return null;
    }

    @JsonIgnore
    public boolean isValid() {
        return false;
    }

    @JsonIgnore
    public Object parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        return null;
    }

    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {

    }

    public String convertInputStreamToString(InputStream is) throws IOException {
        return Helper.convertInputStreamToString(is);
    }
}

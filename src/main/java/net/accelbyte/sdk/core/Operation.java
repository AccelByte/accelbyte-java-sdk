package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.util.Helper;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

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
    public static String createFullUrl(String url, String baseUrl, Map<String, String> pathParams, Map<String, List<String>> queryParams, Map<String, String> collectionFormatMap) throws UnsupportedEncodingException {
        final String ENC = "UTF-8";
        StringBuilder result = new StringBuilder();

        // base url
        if (baseUrl != null && baseUrl.endsWith("/")) {
            baseUrl = baseUrl.split("/")[0] + "//" + baseUrl.split("/")[2];
        }
        result.append(baseUrl);

        // path params
        if (pathParams.size() > 0) {
            for (Map.Entry<String, String> pathParam : pathParams.entrySet()) {
                try {
                    url = url.replace("{" + pathParam.getKey() + "}", URLEncoder.encode(pathParam.getValue(), ENC));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }
        result.append(url);

        // query params
        if (queryParams.size() > 0) {
            result.append("?");
            StringBuilder queryParamBuilder = new StringBuilder();
            Iterator<Map.Entry<String, List<String>>> queryParamItr = queryParams.entrySet().iterator();
            while (queryParamItr.hasNext()) {
                Map.Entry<String, List<String>> qParams = queryParamItr.next();
                if (qParams.getValue() != null) {
                    if (qParams.getValue().size() > 1) {
                        String collectionFormat = collectionFormatMap.get(qParams.getKey());
                        StringBuilder collectionBuilder = new StringBuilder();
                        if (collectionFormat != null && collectionFormat.equals("multi")) {
                            Iterator<String> valItr = qParams.getValue().iterator();
                            while (valItr.hasNext()) {
                                String val = valItr.next();
                                if (val != null) {
                                    collectionBuilder
                                            .append(qParams.getKey())
                                            .append("=")
                                            .append(URLEncoder.encode(val, ENC));
                                    if (valItr.hasNext()) {
                                        collectionBuilder.append("&");
                                    }
                                }
                            }
                        } else {
                            collectionBuilder
                                    .append(qParams.getKey())
                                    .append("=");
                            Iterator<String> val = qParams.getValue().iterator();
                            while (val.hasNext()) {
                                collectionBuilder.append(URLEncoder.encode(val.next(), ENC));
                                if (val.hasNext()) {
                                    collectionBuilder.append(",");
                                }
                            }

                        }
                        queryParamBuilder.append(collectionBuilder);
                    } else {
                        queryParamBuilder.append(qParams.getKey());
                        queryParamBuilder.append("=");
                        queryParamBuilder.append(URLEncoder.encode(qParams.getValue().get(0), ENC));
                    }
                    if (queryParamItr.hasNext()) {
                        queryParamBuilder.append("&");
                    }
                }
            }
            result.append(queryParamBuilder);
        }
        return result.toString();
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
    public Map<String, Map<String, String>> getAllParams() {
        return new HashMap<>();
    }

    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return null;
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

    @JsonIgnore
    public String convertInputStreamToString(InputStream is) throws IOException {
        return Helper.convertInputStreamToString(is);
    }

    @JsonIgnore
    public Map<String, String> getCollectionFormatMap() {
        return null;
    }
}

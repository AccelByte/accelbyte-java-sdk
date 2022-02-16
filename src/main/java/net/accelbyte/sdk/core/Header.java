package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
public class Header {
    public static final String AUTHORIZATION_KEY = "Authorization";
    public static final String X_AMZN_TRACE_ID = "X-Amzn-Trace-Id";
    private Map<String, String> headerData = new HashMap<>();

    public void setBearerAuthorization(String bearer) {
        this.headerData.put(AUTHORIZATION_KEY, bearer);
    }

    public void setBasicAuthorization(String basic) {
        this.headerData.put(AUTHORIZATION_KEY, basic);
    }

    public void setAmazonTraceId(String id) {
        this.headerData.put(X_AMZN_TRACE_ID, id);
    }

    public void addHeaderData(String key, String value) {
        this.headerData.put(key, value);
    }
}

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
public class Header {
    public static final String AUTHORIZATION_KEY = "Authorization";
    public static final String BEARER_KEY = "Bearer";
    public static final String BASIC_KEY = "Basic";
    public static final String X_AMZN_TRACE_ID = "X-Amzn-TraceId";
    private Map<String, String> headerData = new HashMap<>();

    public void setBearerAuthorization(String bearerValue) {
        this.headerData.put(AUTHORIZATION_KEY, BEARER_KEY+" "+ bearerValue);
    }

    public void setBasicAuthorization(String basicValue) {
        this.headerData.put(AUTHORIZATION_KEY, BASIC_KEY+" "+ basicValue);
    }
}

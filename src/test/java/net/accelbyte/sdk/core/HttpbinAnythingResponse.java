package net.accelbyte.sdk.core;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
class HttpbinAnythingResponse extends Model {
    @JsonProperty("method")
    public String method;

    @JsonProperty("url")
    public String url;

    @JsonProperty("headers")
    public Map<String, String> headers;

    @JsonProperty("form")
    public Map<String, String> form;

    @JsonProperty("data")
    public String data;
}

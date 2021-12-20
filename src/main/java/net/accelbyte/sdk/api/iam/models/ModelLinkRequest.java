package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ModelLinkRequest extends Model {

    @JsonProperty("client_id")
    String clientId;
    @JsonProperty("error")
    RestErrorResponse error;
    @JsonProperty("expiration")
    Integer expiration;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("operation_name")
    String operationName;
    @JsonProperty("payload")
    Map<String, ?> payload;
    @JsonProperty("redirect_uri")
    String redirectUri;
    @JsonProperty("request_id")
    String requestId;
    @JsonProperty("status")
    String status;

    public ModelLinkRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("client_id", "clientId");
        result.put("error", "error");
        result.put("expiration", "expiration");
        result.put("namespace", "namespace");
        result.put("operation_name", "operationName");
        result.put("payload", "payload");
        result.put("redirect_uri", "redirectUri");
        result.put("request_id", "requestId");
        result.put("status", "status");
        return result;
    }
}
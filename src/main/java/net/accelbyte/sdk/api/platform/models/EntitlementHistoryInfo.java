package net.accelbyte.sdk.api.platform.models;

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
public class EntitlementHistoryInfo extends Model {

    @JsonProperty("action")
    String action;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("entitlementId")
    String entitlementId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("operator")
    String operator;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("useCount")
    Integer useCount;
    @JsonProperty("userId")
    String userId;

    public EntitlementHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "action");
        result.put("createdAt", "createdAt");
        result.put("entitlementId", "entitlementId");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("quantity", "quantity");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        result.put("userId", "userId");
        return result;
    }
}
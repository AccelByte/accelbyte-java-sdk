package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class OrderHistoryInfo extends Model {

    @JsonProperty("action")
    private String action;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("operator")
    private String operator;

    @JsonProperty("orderNo")
    private String orderNo;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    public OrderHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<OrderHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OrderHistoryInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "action");
        result.put("createdAt", "createdAt");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("orderNo", "orderNo");
        result.put("reason", "reason");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
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
public class SubscriptionSummary extends Model {

    @JsonProperty("currentPeriodEnd")
    String currentPeriodEnd;
    @JsonProperty("currentPeriodStart")
    String currentPeriodStart;
    @JsonProperty("id")
    String id;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("status")
    String status;
    @JsonProperty("subscribedBy")
    String subscribedBy;
    @JsonProperty("userId")
    String userId;

    public SubscriptionSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currentPeriodEnd", "currentPeriodEnd");
        result.put("currentPeriodStart", "currentPeriodStart");
        result.put("id", "id");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("subscribedBy", "subscribedBy");
        result.put("userId", "userId");
        return result;
    }
}
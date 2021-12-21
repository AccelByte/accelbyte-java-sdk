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
public class SubscriptionActivityInfo extends Model {

    @JsonProperty("action")
    String action;
    @JsonProperty("chargedCycles")
    Integer chargedCycles;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("currentCycle")
    Integer currentCycle;
    @JsonProperty("grantDays")
    Integer grantDays;
    @JsonProperty("inFixedCycleTrial")
    Boolean inFixedCycleTrial;
    @JsonProperty("inFixedFreeDays")
    Boolean inFixedFreeDays;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("operator")
    String operator;
    @JsonProperty("reason")
    String reason;
    @JsonProperty("subscribedBy")
    String subscribedBy;
    @JsonProperty("subscriptionId")
    String subscriptionId;
    @JsonProperty("trialedCycles")
    Integer trialedCycles;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public SubscriptionActivityInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "action");
        result.put("chargedCycles", "chargedCycles");
        result.put("createdAt", "createdAt");
        result.put("currentCycle", "currentCycle");
        result.put("grantDays", "grantDays");
        result.put("inFixedCycleTrial", "inFixedCycleTrial");
        result.put("inFixedFreeDays", "inFixedFreeDays");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("reason", "reason");
        result.put("subscribedBy", "subscribedBy");
        result.put("subscriptionId", "subscriptionId");
        result.put("trialedCycles", "trialedCycles");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
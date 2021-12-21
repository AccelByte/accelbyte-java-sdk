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
public class FulfillmentHistoryInfo extends Model {

    @JsonProperty("code")
    String code;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("creditSummaries")
    List<CreditSummary> creditSummaries;
    @JsonProperty("entitlementSummaries")
    List<EntitlementSummary> entitlementSummaries;
    @JsonProperty("fulfillItems")
    List<FulfillmentItem> fulfillItems;
    @JsonProperty("fulfillmentError")
    FulfillmentError fulfillmentError;
    @JsonProperty("grantedItemIds")
    List<String> grantedItemIds;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("orderNo")
    String orderNo;
    @JsonProperty("status")
    String status;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public FulfillmentHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("createdAt", "createdAt");
        result.put("creditSummaries", "creditSummaries");
        result.put("entitlementSummaries", "entitlementSummaries");
        result.put("fulfillItems", "fulfillItems");
        result.put("fulfillmentError", "fulfillmentError");
        result.put("grantedItemIds", "grantedItemIds");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("orderNo", "orderNo");
        result.put("status", "status");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
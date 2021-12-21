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
public class FulfillmentResult extends Model {

    @JsonProperty("creditSummaries")
    List<CreditSummary> creditSummaries;
    @JsonProperty("entitlementSummaries")
    List<EntitlementSummary> entitlementSummaries;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("subscriptionSummaries")
    List<SubscriptionSummary> subscriptionSummaries;
    @JsonProperty("userId")
    String userId;

    public FulfillmentResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("creditSummaries", "creditSummaries");
        result.put("entitlementSummaries", "entitlementSummaries");
        result.put("namespace", "namespace");
        result.put("subscriptionSummaries", "subscriptionSummaries");
        result.put("userId", "userId");
        return result;
    }
}
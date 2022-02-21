/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FulfillmentResult extends Model {

    @JsonProperty("creditSummaries")
    private List<CreditSummary> creditSummaries;

    @JsonProperty("entitlementSummaries")
    private List<EntitlementSummary> entitlementSummaries;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("subscriptionSummaries")
    private List<SubscriptionSummary> subscriptionSummaries;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public FulfillmentResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FulfillmentResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentResult>>() {});
    }

    @JsonIgnore
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
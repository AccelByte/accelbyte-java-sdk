/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
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
public class FulfillmentHistoryInfo extends Model {

    @JsonProperty("code")
    private String code;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("creditSummaries")
    private List<CreditSummary> creditSummaries;

    @JsonProperty("entitlementSummaries")
    private List<EntitlementSummary> entitlementSummaries;

    @JsonProperty("fulfillItems")
    private List<FulfillmentItem> fulfillItems;

    @JsonProperty("fulfillmentError")
    private FulfillmentError fulfillmentError;

    @JsonProperty("grantedItemIds")
    private List<String> grantedItemIds;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("orderNo")
    private String orderNo;

    @JsonProperty("status")
    private String status;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public FulfillmentHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FulfillmentHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentHistoryInfo>>() {});
    }

    @JsonIgnore
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
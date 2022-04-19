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
public class SubscriptionInfo extends Model {

    @JsonProperty("billingAccount")
    private BillingAccount billingAccount;

    @JsonProperty("chargeStatus")
    private String chargeStatus;

    @JsonProperty("chargedCycles")
    private Integer chargedCycles;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("currentCycle")
    private Integer currentCycle;

    @JsonProperty("currentPeriodEnd")
    private String currentPeriodEnd;

    @JsonProperty("currentPeriodStart")
    private String currentPeriodStart;

    @JsonProperty("description")
    private String description;

    @JsonProperty("end")
    private String end;

    @JsonProperty("entitlements")
    private List<EntitlementSummary> entitlements;

    @JsonProperty("firstSubscribe")
    private Boolean firstSubscribe;

    @JsonProperty("id")
    private String id;

    @JsonProperty("inFixedCycleTrial")
    private Boolean inFixedCycleTrial;

    @JsonProperty("inFixedFreeDays")
    private Boolean inFixedFreeDays;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("nextBillingDate")
    private String nextBillingDate;

    @JsonProperty("paid")
    private Boolean paid;

    @JsonProperty("paymentFlowRequired")
    private Boolean paymentFlowRequired;

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("paymentStationUrl")
    private String paymentStationUrl;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("recurring")
    private Recurring recurring;

    @JsonProperty("region")
    private String region;

    @JsonProperty("retryAttempted")
    private Integer retryAttempted;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("source")
    private String source;

    @JsonProperty("start")
    private String start;

    @JsonProperty("status")
    private String status;

    @JsonProperty("subscribedAt")
    private String subscribedAt;

    @JsonProperty("subscribedBy")
    private String subscribedBy;

    @JsonProperty("title")
    private String title;

    @JsonProperty("trialPrice")
    private Integer trialPrice;

    @JsonProperty("trialedCycles")
    private Integer trialedCycles;

    @JsonProperty("unsubscribeReason")
    private String unsubscribeReason;

    @JsonProperty("unsubscribedAt")
    private String unsubscribedAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public SubscriptionInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SubscriptionInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SubscriptionInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("billingAccount", "billingAccount");
        result.put("chargeStatus", "chargeStatus");
        result.put("chargedCycles", "chargedCycles");
        result.put("createdAt", "createdAt");
        result.put("currency", "currency");
        result.put("currentCycle", "currentCycle");
        result.put("currentPeriodEnd", "currentPeriodEnd");
        result.put("currentPeriodStart", "currentPeriodStart");
        result.put("description", "description");
        result.put("end", "end");
        result.put("entitlements", "entitlements");
        result.put("firstSubscribe", "firstSubscribe");
        result.put("id", "id");
        result.put("inFixedCycleTrial", "inFixedCycleTrial");
        result.put("inFixedFreeDays", "inFixedFreeDays");
        result.put("itemId", "itemId");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("nextBillingDate", "nextBillingDate");
        result.put("paid", "paid");
        result.put("paymentFlowRequired", "paymentFlowRequired");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentStationUrl", "paymentStationUrl");
        result.put("price", "price");
        result.put("recurring", "recurring");
        result.put("region", "region");
        result.put("retryAttempted", "retryAttempted");
        result.put("returnUrl", "returnUrl");
        result.put("sandbox", "sandbox");
        result.put("sku", "sku");
        result.put("source", "source");
        result.put("start", "start");
        result.put("status", "status");
        result.put("subscribedAt", "subscribedAt");
        result.put("subscribedBy", "subscribedBy");
        result.put("title", "title");
        result.put("trialPrice", "trialPrice");
        result.put("trialedCycles", "trialedCycles");
        result.put("unsubscribeReason", "unsubscribeReason");
        result.put("unsubscribedAt", "unsubscribedAt");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
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
public class SubscriptionInfo extends Model {

    @JsonProperty("billingAccount")
    BillingAccount billingAccount;
    @JsonProperty("chargeStatus")
    String chargeStatus;
    @JsonProperty("chargedCycles")
    Integer chargedCycles;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("currency")
    CurrencySummary currency;
    @JsonProperty("currentCycle")
    Integer currentCycle;
    @JsonProperty("currentPeriodEnd")
    String currentPeriodEnd;
    @JsonProperty("currentPeriodStart")
    String currentPeriodStart;
    @JsonProperty("description")
    String description;
    @JsonProperty("end")
    String end;
    @JsonProperty("entitlements")
    List<EntitlementSummary> entitlements;
    @JsonProperty("firstSubscribe")
    Boolean firstSubscribe;
    @JsonProperty("id")
    String id;
    @JsonProperty("inFixedCycleTrial")
    Boolean inFixedCycleTrial;
    @JsonProperty("inFixedFreeDays")
    Boolean inFixedFreeDays;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemSnapshot")
    ItemSnapshot itemSnapshot;
    @JsonProperty("language")
    String language;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("nextBillingDate")
    String nextBillingDate;
    @JsonProperty("paid")
    Boolean paid;
    @JsonProperty("paymentFlowRequired")
    Boolean paymentFlowRequired;
    @JsonProperty("paymentOrderNo")
    String paymentOrderNo;
    @JsonProperty("paymentStationUrl")
    String paymentStationUrl;
    @JsonProperty("price")
    Integer price;
    @JsonProperty("recurring")
    Recurring recurring;
    @JsonProperty("region")
    String region;
    @JsonProperty("retryAttempted")
    Integer retryAttempted;
    @JsonProperty("returnUrl")
    String returnUrl;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("source")
    String source;
    @JsonProperty("start")
    String start;
    @JsonProperty("status")
    String status;
    @JsonProperty("subscribedAt")
    String subscribedAt;
    @JsonProperty("subscribedBy")
    String subscribedBy;
    @JsonProperty("title")
    String title;
    @JsonProperty("trialPrice")
    Integer trialPrice;
    @JsonProperty("trialedCycles")
    Integer trialedCycles;
    @JsonProperty("unsubscribeReason")
    String unsubscribeReason;
    @JsonProperty("unsubscribedAt")
    String unsubscribedAt;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public SubscriptionInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
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
public class BillingHistoryInfo extends Model {

    @JsonProperty("amount")
    Integer amount;
    @JsonProperty("billingAccount")
    BillingAccount billingAccount;
    @JsonProperty("changeBillingAccount")
    Boolean changeBillingAccount;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("currency")
    CurrencySummary currency;
    @JsonProperty("description")
    String description;
    @JsonProperty("extTxId")
    String extTxId;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("paymentOrderNo")
    String paymentOrderNo;
    @JsonProperty("recurringOrderNo")
    String recurringOrderNo;
    @JsonProperty("retryAttempted")
    Integer retryAttempted;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("status")
    String status;
    @JsonProperty("statusReason")
    String statusReason;
    @JsonProperty("subscriptionId")
    String subscriptionId;
    @JsonProperty("subtotalPrice")
    Integer subtotalPrice;
    @JsonProperty("title")
    String title;
    @JsonProperty("totalPrice")
    Integer totalPrice;
    @JsonProperty("totalTax")
    Integer totalTax;
    @JsonProperty("txEndTime")
    String txEndTime;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public BillingHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("amount", "amount");
        result.put("billingAccount", "billingAccount");
        result.put("changeBillingAccount", "changeBillingAccount");
        result.put("createdAt", "createdAt");
        result.put("currency", "currency");
        result.put("description", "description");
        result.put("extTxId", "extTxId");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("recurringOrderNo", "recurringOrderNo");
        result.put("retryAttempted", "retryAttempted");
        result.put("sandbox", "sandbox");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("subscriptionId", "subscriptionId");
        result.put("subtotalPrice", "subtotalPrice");
        result.put("title", "title");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("txEndTime", "txEndTime");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
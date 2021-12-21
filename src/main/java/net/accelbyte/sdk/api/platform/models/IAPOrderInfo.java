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
public class IAPOrderInfo extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("credits")
    List<CreditSummary> credits;
    @JsonProperty("entitlements")
    List<EntitlementSummary> entitlements;
    @JsonProperty("fulfilledTime")
    String fulfilledTime;
    @JsonProperty("iapOrderNo")
    String iapOrderNo;
    @JsonProperty("language")
    String language;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("productId")
    String productId;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("receiptData")
    String receiptData;
    @JsonProperty("region")
    String region;
    @JsonProperty("retryCount")
    Integer retryCount;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("status")
    String status;
    @JsonProperty("statusReason")
    String statusReason;
    @JsonProperty("transactionId")
    String transactionId;
    @JsonProperty("type")
    String type;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public IAPOrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("credits", "credits");
        result.put("entitlements", "entitlements");
        result.put("fulfilledTime", "fulfilledTime");
        result.put("iapOrderNo", "iapOrderNo");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("productId", "productId");
        result.put("quantity", "quantity");
        result.put("receiptData", "receiptData");
        result.put("region", "region");
        result.put("retryCount", "retryCount");
        result.put("sandbox", "sandbox");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("transactionId", "transactionId");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
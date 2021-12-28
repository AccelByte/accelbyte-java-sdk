package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
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
    private String createdAt;

    @JsonProperty("credits")
    private List<CreditSummary> credits;

    @JsonProperty("entitlements")
    private List<EntitlementSummary> entitlements;

    @JsonProperty("fulfilledTime")
    private String fulfilledTime;

    @JsonProperty("iapOrderNo")
    private String iapOrderNo;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("receiptData")
    private String receiptData;

    @JsonProperty("region")
    private String region;

    @JsonProperty("retryCount")
    private Integer retryCount;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("transactionId")
    private String transactionId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    public IAPOrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<IAPOrderInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<IAPOrderInfo>>() {});
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
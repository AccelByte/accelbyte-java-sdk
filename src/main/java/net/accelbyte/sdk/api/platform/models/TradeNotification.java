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
public class TradeNotification extends Model {

    @JsonProperty("additionalData")
    AdditionalData additionalData;
    @JsonProperty("authorisedTime")
    String authorisedTime;
    @JsonProperty("chargebackReversedTime")
    String chargebackReversedTime;
    @JsonProperty("chargebackTime")
    String chargebackTime;
    @JsonProperty("chargedTime")
    String chargedTime;
    @JsonProperty("createdTime")
    String createdTime;
    @JsonProperty("currency")
    CurrencySummary currency;
    @JsonProperty("customParameters")
    Map<String, ?> customParameters;
    @JsonProperty("extOrderNo")
    String extOrderNo;
    @JsonProperty("extTxId")
    String extTxId;
    @JsonProperty("extUserId")
    String extUserId;
    @JsonProperty("issuedAt")
    String issuedAt;
    @JsonProperty("metadata")
    Map<String, String> metadata;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("nonceStr")
    String nonceStr;
    @JsonProperty("paymentMethod")
    String paymentMethod;
    @JsonProperty("paymentMethodFee")
    Integer paymentMethodFee;
    @JsonProperty("paymentOrderNo")
    String paymentOrderNo;
    @JsonProperty("paymentProvider")
    String paymentProvider;
    @JsonProperty("paymentProviderFee")
    Integer paymentProviderFee;
    @JsonProperty("paymentStationUrl")
    String paymentStationUrl;
    @JsonProperty("price")
    Integer price;
    @JsonProperty("refundedTime")
    String refundedTime;
    @JsonProperty("salesTax")
    Integer salesTax;
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
    @JsonProperty("targetNamespace")
    String targetNamespace;
    @JsonProperty("targetUserId")
    String targetUserId;
    @JsonProperty("tax")
    Integer tax;
    @JsonProperty("totalPrice")
    Integer totalPrice;
    @JsonProperty("totalTax")
    Integer totalTax;
    @JsonProperty("txEndTime")
    String txEndTime;
    @JsonProperty("type")
    String type;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("vat")
    Integer vat;

    public TradeNotification createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("authorisedTime", "authorisedTime");
        result.put("chargebackReversedTime", "chargebackReversedTime");
        result.put("chargebackTime", "chargebackTime");
        result.put("chargedTime", "chargedTime");
        result.put("createdTime", "createdTime");
        result.put("currency", "currency");
        result.put("customParameters", "customParameters");
        result.put("extOrderNo", "extOrderNo");
        result.put("extTxId", "extTxId");
        result.put("extUserId", "extUserId");
        result.put("issuedAt", "issuedAt");
        result.put("metadata", "metadata");
        result.put("namespace", "namespace");
        result.put("nonceStr", "nonceStr");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentMethodFee", "paymentMethodFee");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentProvider", "paymentProvider");
        result.put("paymentProviderFee", "paymentProviderFee");
        result.put("paymentStationUrl", "paymentStationUrl");
        result.put("price", "price");
        result.put("refundedTime", "refundedTime");
        result.put("salesTax", "salesTax");
        result.put("sandbox", "sandbox");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("subscriptionId", "subscriptionId");
        result.put("subtotalPrice", "subtotalPrice");
        result.put("targetNamespace", "targetNamespace");
        result.put("targetUserId", "targetUserId");
        result.put("tax", "tax");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("txEndTime", "txEndTime");
        result.put("type", "type");
        result.put("userId", "userId");
        result.put("vat", "vat");
        return result;
    }
}
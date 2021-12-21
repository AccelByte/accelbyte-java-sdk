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
public class PaymentOrder extends Model {

    @JsonProperty("authorisedTime")
    String authorisedTime;
    @JsonProperty("channel")
    String channel;
    @JsonProperty("chargebackReversedTime")
    String chargebackReversedTime;
    @JsonProperty("chargebackTime")
    String chargebackTime;
    @JsonProperty("chargedTime")
    String chargedTime;
    @JsonProperty("charging")
    Boolean charging;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("createdTime")
    String createdTime;
    @JsonProperty("currency")
    CurrencySummary currency;
    @JsonProperty("customParameters")
    Map<String, ?> customParameters;
    @JsonProperty("description")
    String description;
    @JsonProperty("extOrderNo")
    String extOrderNo;
    @JsonProperty("extUserId")
    String extUserId;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("language")
    String language;
    @JsonProperty("metadata")
    Map<String, String> metadata;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("notifyUrl")
    String notifyUrl;
    @JsonProperty("omitNotification")
    Boolean omitNotification;
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
    @JsonProperty("recurringPaymentOrderNo")
    String recurringPaymentOrderNo;
    @JsonProperty("refundedTime")
    String refundedTime;
    @JsonProperty("region")
    String region;
    @JsonProperty("returnUrl")
    String returnUrl;
    @JsonProperty("rvn")
    Integer rvn;
    @JsonProperty("salesTax")
    Integer salesTax;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("state")
    String state;
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
    @JsonProperty("title")
    String title;
    @JsonProperty("totalPrice")
    Integer totalPrice;
    @JsonProperty("totalTax")
    Integer totalTax;
    @JsonProperty("transactions")
    List<Transaction> transactions;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("vat")
    Integer vat;
    @JsonProperty("zipCode")
    String zipCode;

    public PaymentOrder createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("authorisedTime", "authorisedTime");
        result.put("channel", "channel");
        result.put("chargebackReversedTime", "chargebackReversedTime");
        result.put("chargebackTime", "chargebackTime");
        result.put("chargedTime", "chargedTime");
        result.put("charging", "charging");
        result.put("createdAt", "createdAt");
        result.put("createdTime", "createdTime");
        result.put("currency", "currency");
        result.put("customParameters", "customParameters");
        result.put("description", "description");
        result.put("extOrderNo", "extOrderNo");
        result.put("extUserId", "extUserId");
        result.put("itemType", "itemType");
        result.put("language", "language");
        result.put("metadata", "metadata");
        result.put("namespace", "namespace");
        result.put("notifyUrl", "notifyUrl");
        result.put("omitNotification", "omitNotification");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentMethodFee", "paymentMethodFee");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentProvider", "paymentProvider");
        result.put("paymentProviderFee", "paymentProviderFee");
        result.put("paymentStationUrl", "paymentStationUrl");
        result.put("price", "price");
        result.put("recurringPaymentOrderNo", "recurringPaymentOrderNo");
        result.put("refundedTime", "refundedTime");
        result.put("region", "region");
        result.put("returnUrl", "returnUrl");
        result.put("rvn", "rvn");
        result.put("salesTax", "salesTax");
        result.put("sandbox", "sandbox");
        result.put("sku", "sku");
        result.put("state", "state");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("subscriptionId", "subscriptionId");
        result.put("subtotalPrice", "subtotalPrice");
        result.put("targetNamespace", "targetNamespace");
        result.put("targetUserId", "targetUserId");
        result.put("tax", "tax");
        result.put("title", "title");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("transactions", "transactions");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("vat", "vat");
        result.put("zipCode", "zipCode");
        return result;
    }
}
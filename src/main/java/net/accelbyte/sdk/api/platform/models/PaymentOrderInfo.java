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
public class PaymentOrderInfo extends Model {

    @JsonProperty("authorisedTime")
    private String authorisedTime;

    @JsonProperty("channel")
    private String channel;

    @JsonProperty("chargebackReversedTime")
    private String chargebackReversedTime;

    @JsonProperty("chargebackTime")
    private String chargebackTime;

    @JsonProperty("chargedTime")
    private String chargedTime;

    @JsonProperty("charging")
    private Boolean charging;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("createdTime")
    private String createdTime;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("customParameters")
    private Map<String, ?> customParameters;

    @JsonProperty("description")
    private String description;

    @JsonProperty("extOrderNo")
    private String extOrderNo;

    @JsonProperty("extUserId")
    private String extUserId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("language")
    private String language;

    @JsonProperty("metadata")
    private Map<String, String> metadata;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("notifyUrl")
    private String notifyUrl;

    @JsonProperty("omitNotification")
    private Boolean omitNotification;

    @JsonProperty("paymentMethod")
    private String paymentMethod;

    @JsonProperty("paymentMethodFee")
    private Integer paymentMethodFee;

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("paymentProviderFee")
    private Integer paymentProviderFee;

    @JsonProperty("paymentStationUrl")
    private String paymentStationUrl;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("recurringPaymentOrderNo")
    private String recurringPaymentOrderNo;

    @JsonProperty("refundedTime")
    private String refundedTime;

    @JsonProperty("region")
    private String region;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("subscriptionId")
    private String subscriptionId;

    @JsonProperty("subtotalPrice")
    private Integer subtotalPrice;

    @JsonProperty("targetNamespace")
    private String targetNamespace;

    @JsonProperty("targetUserId")
    private String targetUserId;

    @JsonProperty("tax")
    private Integer tax;

    @JsonProperty("title")
    private String title;

    @JsonProperty("totalPrice")
    private Integer totalPrice;

    @JsonProperty("totalTax")
    private Integer totalTax;

    @JsonProperty("transactions")
    private List<Transaction> transactions;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("vat")
    private Integer vat;

    public PaymentOrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentOrderInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderInfo>>() {});
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
        result.put("title", "title");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("transactions", "transactions");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("vat", "vat");
        return result;
    }
}
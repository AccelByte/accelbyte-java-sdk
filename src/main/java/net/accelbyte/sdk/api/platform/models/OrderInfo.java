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
public class OrderInfo extends Model {

    @JsonProperty("chargebackReversedTime")
    String chargebackReversedTime;
    @JsonProperty("chargebackTime")
    String chargebackTime;
    @JsonProperty("chargedTime")
    String chargedTime;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("createdTime")
    String createdTime;
    @JsonProperty("currency")
    CurrencySummary currency;
    @JsonProperty("discountedPrice")
    Integer discountedPrice;
    @JsonProperty("expireTime")
    String expireTime;
    @JsonProperty("ext")
    Map<String, ?> ext;
    @JsonProperty("fulfilledTime")
    String fulfilledTime;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemSnapshot")
    ItemSnapshot itemSnapshot;
    @JsonProperty("language")
    String language;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("orderNo")
    String orderNo;
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
    @JsonProperty("paymentRemainSeconds")
    Integer paymentRemainSeconds;
    @JsonProperty("paymentStationUrl")
    String paymentStationUrl;
    @JsonProperty("price")
    Integer price;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("refundedTime")
    String refundedTime;
    @JsonProperty("region")
    String region;
    @JsonProperty("salesTax")
    Integer salesTax;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("status")
    String status;
    @JsonProperty("statusReason")
    String statusReason;
    @JsonProperty("subtotalPrice")
    Integer subtotalPrice;
    @JsonProperty("tax")
    Integer tax;
    @JsonProperty("totalPrice")
    Integer totalPrice;
    @JsonProperty("totalTax")
    Integer totalTax;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("vat")
    Integer vat;

    public OrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("chargebackReversedTime", "chargebackReversedTime");
        result.put("chargebackTime", "chargebackTime");
        result.put("chargedTime", "chargedTime");
        result.put("createdAt", "createdAt");
        result.put("createdTime", "createdTime");
        result.put("currency", "currency");
        result.put("discountedPrice", "discountedPrice");
        result.put("expireTime", "expireTime");
        result.put("ext", "ext");
        result.put("fulfilledTime", "fulfilledTime");
        result.put("itemId", "itemId");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("orderNo", "orderNo");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentMethodFee", "paymentMethodFee");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentProvider", "paymentProvider");
        result.put("paymentProviderFee", "paymentProviderFee");
        result.put("paymentRemainSeconds", "paymentRemainSeconds");
        result.put("paymentStationUrl", "paymentStationUrl");
        result.put("price", "price");
        result.put("quantity", "quantity");
        result.put("refundedTime", "refundedTime");
        result.put("region", "region");
        result.put("salesTax", "salesTax");
        result.put("sandbox", "sandbox");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("subtotalPrice", "subtotalPrice");
        result.put("tax", "tax");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("vat", "vat");
        return result;
    }
}
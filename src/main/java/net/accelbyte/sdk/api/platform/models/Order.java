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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order extends Model {

    @JsonProperty("chargebackReversedTime")
    private String chargebackReversedTime;

    @JsonProperty("chargebackTime")
    private String chargebackTime;

    @JsonProperty("charged")
    private Boolean charged;

    @JsonProperty("chargedTime")
    private String chargedTime;

    @JsonProperty("countItemId")
    private String countItemId;

    @JsonProperty("countNamespace")
    private String countNamespace;

    @JsonProperty("countUserId")
    private String countUserId;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("createdTime")
    private String createdTime;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("discountedPrice")
    private Integer discountedPrice;

    @JsonProperty("expireTime")
    private String expireTime;

    @JsonProperty("ext")
    private Map<String, ?> ext;

    @JsonProperty("free")
    private Boolean free;

    @JsonProperty("fulfilledTime")
    private String fulfilledTime;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("orderNo")
    private String orderNo;

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

    @JsonProperty("paymentRemainSeconds")
    private Integer paymentRemainSeconds;

    @JsonProperty("paymentStationUrl")
    private String paymentStationUrl;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("refundedTime")
    private String refundedTime;

    @JsonProperty("region")
    private String region;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("rvn")
    private Integer rvn;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("subtotalPrice")
    private Integer subtotalPrice;

    @JsonProperty("tax")
    private Integer tax;

    @JsonProperty("totalPrice")
    private Integer totalPrice;

    @JsonProperty("totalTax")
    private Integer totalTax;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("vat")
    private Integer vat;


    
    public String getPaymentProvider() {
        return this.paymentProvider;
    }
    
    public PaymentProvider getPaymentProviderAsEnum() {
        return PaymentProvider.valueOf(this.paymentProvider);
    }
    
    public void setPaymentProvider(final String paymentProvider) {
        this.paymentProvider = paymentProvider;
    }
    
    public void setPaymentProviderFromEnum(final PaymentProvider paymentProvider) {
        this.paymentProvider = paymentProvider.toString();
    }
    
    public String getStatus() {
        return this.status;
    }
    
    public Status getStatusAsEnum() {
        return Status.valueOf(this.status);
    }
    
    public void setStatus(final String status) {
        this.status = status;
    }
    
    public void setStatusFromEnum(final Status status) {
        this.status = status.toString();
    }

    @JsonIgnore
    public Order createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<Order> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Order>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("chargebackReversedTime", "chargebackReversedTime");
        result.put("chargebackTime", "chargebackTime");
        result.put("charged", "charged");
        result.put("chargedTime", "chargedTime");
        result.put("countItemId", "countItemId");
        result.put("countNamespace", "countNamespace");
        result.put("countUserId", "countUserId");
        result.put("createdAt", "createdAt");
        result.put("createdTime", "createdTime");
        result.put("currency", "currency");
        result.put("discountedPrice", "discountedPrice");
        result.put("expireTime", "expireTime");
        result.put("ext", "ext");
        result.put("free", "free");
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
        result.put("returnUrl", "returnUrl");
        result.put("rvn", "rvn");
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
    
    public enum PaymentProvider {
        WALLET("WALLET"),
        XSOLLA("XSOLLA"),
        ADYEN("ADYEN"),
        STRIPE("STRIPE"),
        CHECKOUT("CHECKOUT"),
        ALIPAY("ALIPAY"),
        WXPAY("WXPAY"),
        PAYPAL("PAYPAL");

        private String value;

        PaymentProvider(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Status {
        INIT("INIT"),
        CHARGED("CHARGED"),
        CHARGEBACK("CHARGEBACK"),
        CHARGEBACKREVERSED("CHARGEBACKREVERSED"),
        FULFILLED("FULFILLED"),
        FULFILLFAILED("FULFILLFAILED"),
        REFUNDING("REFUNDING"),
        REFUNDED("REFUNDED"),
        REFUNDFAILED("REFUNDFAILED"),
        CLOSED("CLOSED"),
        DELETED("DELETED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class OrderBuilder {
        private String paymentProvider;
        private String status;
        
        
        public OrderBuilder paymentProvider(final String paymentProvider) {
            this.paymentProvider = paymentProvider;
            return this;
        }
        
        public OrderBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
            this.paymentProvider = paymentProvider.toString();
            return this;
        }
        
        public OrderBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public OrderBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
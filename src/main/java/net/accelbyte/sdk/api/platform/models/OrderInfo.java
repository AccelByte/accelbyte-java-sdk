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
public class OrderInfo extends Model {

    @JsonProperty("chargebackReversedTime")
    private String chargebackReversedTime;

    @JsonProperty("chargebackTime")
    private String chargebackTime;

    @JsonProperty("chargedTime")
    private String chargedTime;

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


    
    @JsonIgnore
    public String getPaymentProvider() {
        return this.paymentProvider;
    }
    
    @JsonIgnore
    public PaymentProvider getPaymentProviderAsEnum() {
        return PaymentProvider.valueOf(this.paymentProvider);
    }
    
    @JsonIgnore
    public void setPaymentProvider(final String paymentProvider) {
        this.paymentProvider = paymentProvider;
    }
    
    @JsonIgnore
    public void setPaymentProviderFromEnum(final PaymentProvider paymentProvider) {
        this.paymentProvider = paymentProvider.toString();
    }
    
    @JsonIgnore
    public String getStatus() {
        return this.status;
    }
    
    @JsonIgnore
    public Status getStatusAsEnum() {
        return Status.valueOf(this.status);
    }
    
    @JsonIgnore
    public void setStatus(final String status) {
        this.status = status;
    }
    
    @JsonIgnore
    public void setStatusFromEnum(final Status status) {
        this.status = status.toString();
    }

    @JsonIgnore
    public OrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OrderInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OrderInfo>>() {});
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
    
    public static class OrderInfoBuilder {
        private String paymentProvider;
        private String status;
        
        
        public OrderInfoBuilder paymentProvider(final String paymentProvider) {
            this.paymentProvider = paymentProvider;
            return this;
        }
        
        public OrderInfoBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
            this.paymentProvider = paymentProvider.toString();
            return this;
        }
        
        public OrderInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public OrderInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
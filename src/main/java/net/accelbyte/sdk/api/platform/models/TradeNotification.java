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
public class TradeNotification extends Model {

    @JsonProperty("additionalData")
    private AdditionalData additionalData;

    @JsonProperty("authorisedTime")
    private String authorisedTime;

    @JsonProperty("chargebackReversedTime")
    private String chargebackReversedTime;

    @JsonProperty("chargebackTime")
    private String chargebackTime;

    @JsonProperty("chargedTime")
    private String chargedTime;

    @JsonProperty("createdTime")
    private String createdTime;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("customParameters")
    private Map<String, ?> customParameters;

    @JsonProperty("extOrderNo")
    private String extOrderNo;

    @JsonProperty("extTxId")
    private String extTxId;

    @JsonProperty("extUserId")
    private String extUserId;

    @JsonProperty("issuedAt")
    private String issuedAt;

    @JsonProperty("metadata")
    private Map<String, String> metadata;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("nonceStr")
    private String nonceStr;

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

    @JsonProperty("refundedTime")
    private String refundedTime;

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

    @JsonProperty("totalPrice")
    private Integer totalPrice;

    @JsonProperty("totalTax")
    private Integer totalTax;

    @JsonProperty("txEndTime")
    private String txEndTime;

    @JsonProperty("type")
    private String type;

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
    public TradeNotification createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<TradeNotification> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<TradeNotification>>() {});
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
        AUTHORISED("AUTHORISED"),
        AUTHORISEFAILED("AUTHORISEFAILED"),
        CHARGED("CHARGED"),
        CHARGEFAILED("CHARGEFAILED"),
        NOTIFICATIONOFCHARGEBACK("NOTIFICATIONOFCHARGEBACK"),
        REQUESTFORINFORMATION("REQUESTFORINFORMATION"),
        CHARGEBACK("CHARGEBACK"),
        CHARGEBACKREVERSED("CHARGEBACKREVERSED"),
        REFUNDING("REFUNDING"),
        REFUNDED("REFUNDED"),
        REFUNDFAILED("REFUNDFAILED"),
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
    
    public static class TradeNotificationBuilder {
        private String paymentProvider;
        private String status;
        
        
        public TradeNotificationBuilder paymentProvider(final String paymentProvider) {
            this.paymentProvider = paymentProvider;
            return this;
        }
        
        public TradeNotificationBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
            this.paymentProvider = paymentProvider.toString();
            return this;
        }
        
        public TradeNotificationBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public TradeNotificationBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
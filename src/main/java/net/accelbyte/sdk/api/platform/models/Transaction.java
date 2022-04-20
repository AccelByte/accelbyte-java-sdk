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
public class Transaction extends Model {

    @JsonProperty("additionalData")
    private AdditionalData additionalData;

    @JsonProperty("amount")
    private Integer amount;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("extMessage")
    private String extMessage;

    @JsonProperty("extStatusCode")
    private String extStatusCode;

    @JsonProperty("extTxId")
    private String extTxId;

    @JsonProperty("merchantId")
    private String merchantId;

    @JsonProperty("notified")
    private Boolean notified;

    @JsonProperty("paymentMethod")
    private String paymentMethod;

    @JsonProperty("paymentMethodFee")
    private Integer paymentMethodFee;

    @JsonProperty("paymentProviderFee")
    private Integer paymentProviderFee;

    @JsonProperty("provider")
    private String provider;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tax")
    private Integer tax;

    @JsonProperty("txEndTime")
    private String txEndTime;

    @JsonProperty("txId")
    private String txId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("vat")
    private Integer vat;


    
    public String getProvider() {
        return this.provider;
    }
    
    public Provider getProviderAsEnum() {
        return Provider.valueOf(this.provider);
    }
    
    public void setProvider(final String provider) {
        this.provider = provider;
    }
    
    public void setProviderFromEnum(final Provider provider) {
        this.provider = provider.toString();
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
    
    public String getType() {
        return this.type;
    }
    
    public Type getTypeAsEnum() {
        return Type.valueOf(this.type);
    }
    
    public void setType(final String type) {
        this.type = type;
    }
    
    public void setTypeFromEnum(final Type type) {
        this.type = type.toString();
    }

    @JsonIgnore
    public Transaction createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<Transaction> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Transaction>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("amount", "amount");
        result.put("currency", "currency");
        result.put("extMessage", "extMessage");
        result.put("extStatusCode", "extStatusCode");
        result.put("extTxId", "extTxId");
        result.put("merchantId", "merchantId");
        result.put("notified", "notified");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentMethodFee", "paymentMethodFee");
        result.put("paymentProviderFee", "paymentProviderFee");
        result.put("provider", "provider");
        result.put("salesTax", "salesTax");
        result.put("status", "status");
        result.put("tax", "tax");
        result.put("txEndTime", "txEndTime");
        result.put("txId", "txId");
        result.put("type", "type");
        result.put("vat", "vat");
        return result;
    }
    
    public enum Provider {
        WALLET("WALLET"),
        XSOLLA("XSOLLA"),
        ADYEN("ADYEN"),
        STRIPE("STRIPE"),
        CHECKOUT("CHECKOUT"),
        ALIPAY("ALIPAY"),
        WXPAY("WXPAY"),
        PAYPAL("PAYPAL");

        private String value;

        Provider(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Status {
        FINISHED("FINISHED"),
        FAILED("FAILED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Type {
        AUTHORISATION("AUTHORISATION"),
        CHARGE("CHARGE"),
        CHARGEFAILED("CHARGEFAILED"),
        NOTIFICATIONOFCHARGEBACK("NOTIFICATIONOFCHARGEBACK"),
        REQUESTFORINFORMATION("REQUESTFORINFORMATION"),
        CHARGEBACK("CHARGEBACK"),
        CHARGEBACKREVERSED("CHARGEBACKREVERSED"),
        REFUND("REFUND"),
        REFUNDFAILED("REFUNDFAILED");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class TransactionBuilder {
        private String provider;
        private String status;
        private String type;
        
        
        public TransactionBuilder provider(final String provider) {
            this.provider = provider;
            return this;
        }
        
        public TransactionBuilder providerFromEnum(final Provider provider) {
            this.provider = provider.toString();
            return this;
        }
        
        public TransactionBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public TransactionBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
        
        public TransactionBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public TransactionBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
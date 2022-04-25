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
public class PaymentUrl extends Model {

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("paymentType")
    private String paymentType;

    @JsonProperty("paymentUrl")
    private String paymentUrl;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("sessionData")
    private String sessionData;

    @JsonProperty("sessionId")
    private String sessionId;


    
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
    public String getPaymentType() {
        return this.paymentType;
    }
    
    @JsonIgnore
    public PaymentType getPaymentTypeAsEnum() {
        return PaymentType.valueOf(this.paymentType);
    }
    
    @JsonIgnore
    public void setPaymentType(final String paymentType) {
        this.paymentType = paymentType;
    }
    
    @JsonIgnore
    public void setPaymentTypeFromEnum(final PaymentType paymentType) {
        this.paymentType = paymentType.toString();
    }

    @JsonIgnore
    public PaymentUrl createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentUrl> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentUrl>>() {});
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
    
    public enum PaymentType {
        QRCODE("QRCODE"),
        LINK("LINK");

        private String value;

        PaymentType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class PaymentUrlBuilder {
        private String paymentProvider;
        private String paymentType;
        
        
        public PaymentUrlBuilder paymentProvider(final String paymentProvider) {
            this.paymentProvider = paymentProvider;
            return this;
        }
        
        public PaymentUrlBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
            this.paymentProvider = paymentProvider.toString();
            return this;
        }
        
        public PaymentUrlBuilder paymentType(final String paymentType) {
            this.paymentType = paymentType;
            return this;
        }
        
        public PaymentUrlBuilder paymentTypeFromEnum(final PaymentType paymentType) {
            this.paymentType = paymentType.toString();
            return this;
        }
    }
}
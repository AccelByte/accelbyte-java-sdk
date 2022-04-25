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
public class PaymentOrderNotifySimulation extends Model {

    @JsonProperty("amount")
    private Integer amount;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("notifyType")
    private String notifyType;

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("vat")
    private Integer vat;


    
    @JsonIgnore
    public String getNotifyType() {
        return this.notifyType;
    }
    
    @JsonIgnore
    public NotifyType getNotifyTypeAsEnum() {
        return NotifyType.valueOf(this.notifyType);
    }
    
    @JsonIgnore
    public void setNotifyType(final String notifyType) {
        this.notifyType = notifyType;
    }
    
    @JsonIgnore
    public void setNotifyTypeFromEnum(final NotifyType notifyType) {
        this.notifyType = notifyType.toString();
    }
    
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
    public PaymentOrderNotifySimulation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentOrderNotifySimulation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderNotifySimulation>>() {});
    }

    
    public enum NotifyType {
        CHARGE("CHARGE"),
        REFUND("REFUND");

        private String value;

        NotifyType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
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
    
    public static class PaymentOrderNotifySimulationBuilder {
        private String notifyType;
        private String paymentProvider;
        
        
        public PaymentOrderNotifySimulationBuilder notifyType(final String notifyType) {
            this.notifyType = notifyType;
            return this;
        }
        
        public PaymentOrderNotifySimulationBuilder notifyTypeFromEnum(final NotifyType notifyType) {
            this.notifyType = notifyType.toString();
            return this;
        }
        
        public PaymentOrderNotifySimulationBuilder paymentProvider(final String paymentProvider) {
            this.paymentProvider = paymentProvider;
            return this;
        }
        
        public PaymentOrderNotifySimulationBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
            this.paymentProvider = paymentProvider.toString();
            return this;
        }
    }
}
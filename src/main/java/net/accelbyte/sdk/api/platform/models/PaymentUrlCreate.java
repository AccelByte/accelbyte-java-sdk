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
public class PaymentUrlCreate extends Model {

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("ui")
    private String ui;

    @JsonProperty("zipCode")
    private String zipCode;


    
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
    public PaymentUrlCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentUrlCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentUrlCreate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentProvider", "paymentProvider");
        result.put("returnUrl", "returnUrl");
        result.put("ui", "ui");
        result.put("zipCode", "zipCode");
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
    
    public static class PaymentUrlCreateBuilder {
        private String paymentProvider;
        
        
        public PaymentUrlCreateBuilder paymentProvider(final String paymentProvider) {
            this.paymentProvider = paymentProvider;
            return this;
        }
        
        public PaymentUrlCreateBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
            this.paymentProvider = paymentProvider.toString();
            return this;
        }
    }
}
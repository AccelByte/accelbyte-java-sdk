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
public class PaymentProviderConfigInfo extends Model {

    @JsonProperty("aggregate")
    private String aggregate;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("paymentMerchantConfigId")
    private String paymentMerchantConfigId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("sandboxTaxJarApiToken")
    private String sandboxTaxJarApiToken;

    @JsonProperty("specials")
    private List<String> specials;

    @JsonProperty("taxJarApiToken")
    private String taxJarApiToken;

    @JsonProperty("taxJarEnabled")
    private Boolean taxJarEnabled;

    @JsonProperty("useGlobalTaxJarApiToken")
    private Boolean useGlobalTaxJarApiToken;


    
    @JsonIgnore
    public String getAggregate() {
        return this.aggregate;
    }
    
    @JsonIgnore
    public Aggregate getAggregateAsEnum() {
        return Aggregate.valueOf(this.aggregate);
    }
    
    @JsonIgnore
    public void setAggregate(final String aggregate) {
        this.aggregate = aggregate;
    }
    
    @JsonIgnore
    public void setAggregateFromEnum(final Aggregate aggregate) {
        this.aggregate = aggregate.toString();
    }
    
    @JsonIgnore
    public List<String> getSpecials() {
        return this.specials;
    }
    
    @JsonIgnore
    public List<Specials> getSpecialsAsEnum() {
        ArrayList<Specials> en = new ArrayList<Specials>();
        for(String e : this.specials) en.add(Specials.valueOf(e));
        return en;
    }
    
    @JsonIgnore
    public void setSpecials(final List<String> specials) {
        this.specials = specials;
    }
    
    @JsonIgnore
    public void setSpecialsFromEnum(final List<Specials> specials) {
        ArrayList<String> en = new ArrayList<String>();
        for(Specials e : specials) en.add(e.toString());
        this.specials = en;
    }

    @JsonIgnore
    public PaymentProviderConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentProviderConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentProviderConfigInfo>>() {});
    }

    
    public enum Aggregate {
        ADYEN("ADYEN"),
        XSOLLA("XSOLLA");

        private String value;

        Aggregate(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Specials {
        ADYEN("ADYEN"),
        ALIPAY("ALIPAY"),
        CHECKOUT("CHECKOUT"),
        PAYPAL("PAYPAL"),
        STRIPE("STRIPE"),
        WALLET("WALLET"),
        WXPAY("WXPAY"),
        XSOLLA("XSOLLA");

        private String value;

        Specials(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class PaymentProviderConfigInfoBuilder {
        private String aggregate;
        private List<String> specials;
        
        
        public PaymentProviderConfigInfoBuilder aggregate(final String aggregate) {
            this.aggregate = aggregate;
            return this;
        }
        
        public PaymentProviderConfigInfoBuilder aggregateFromEnum(final Aggregate aggregate) {
            this.aggregate = aggregate.toString();
            return this;
        }
        
        public PaymentProviderConfigInfoBuilder specials(final List<String> specials) {
            this.specials = specials;
            return this;
        }
        
        public PaymentProviderConfigInfoBuilder specialsFromEnum(final List<Specials> specials) {
            ArrayList<String> en = new ArrayList<String>();
            for(Specials e : specials) en.add(e.toString());
            this.specials = en;
            return this;
        }
    }
}
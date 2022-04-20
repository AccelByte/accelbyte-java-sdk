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
public class RegionDataItem extends Model {

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencyNamespace")
    private String currencyNamespace;

    @JsonProperty("currencyType")
    private String currencyType;

    @JsonProperty("discountAmount")
    private Integer discountAmount;

    @JsonProperty("discountExpireAt")
    private String discountExpireAt;

    @JsonProperty("discountPercentage")
    private Integer discountPercentage;

    @JsonProperty("discountPurchaseAt")
    private String discountPurchaseAt;

    @JsonProperty("discountedPrice")
    private Integer discountedPrice;

    @JsonProperty("expireAt")
    private String expireAt;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("purchaseAt")
    private String purchaseAt;

    @JsonProperty("trialPrice")
    private Integer trialPrice;


    
    public String getCurrencyType() {
        return this.currencyType;
    }
    
    public CurrencyType getCurrencyTypeAsEnum() {
        return CurrencyType.valueOf(this.currencyType);
    }
    
    public void setCurrencyType(final String currencyType) {
        this.currencyType = currencyType;
    }
    
    public void setCurrencyTypeFromEnum(final CurrencyType currencyType) {
        this.currencyType = currencyType.toString();
    }

    @JsonIgnore
    public RegionDataItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RegionDataItem> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RegionDataItem>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currencyCode", "currencyCode");
        result.put("currencyNamespace", "currencyNamespace");
        result.put("currencyType", "currencyType");
        result.put("discountAmount", "discountAmount");
        result.put("discountExpireAt", "discountExpireAt");
        result.put("discountPercentage", "discountPercentage");
        result.put("discountPurchaseAt", "discountPurchaseAt");
        result.put("discountedPrice", "discountedPrice");
        result.put("expireAt", "expireAt");
        result.put("price", "price");
        result.put("purchaseAt", "purchaseAt");
        result.put("trialPrice", "trialPrice");
        return result;
    }
    
    public enum CurrencyType {
        REAL("REAL"),
        VIRTUAL("VIRTUAL");

        private String value;

        CurrencyType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class RegionDataItemBuilder {
        private String currencyType;
        
        
        public RegionDataItemBuilder currencyType(final String currencyType) {
            this.currencyType = currencyType;
            return this;
        }
        
        public RegionDataItemBuilder currencyTypeFromEnum(final CurrencyType currencyType) {
            this.currencyType = currencyType.toString();
            return this;
        }
    }
}
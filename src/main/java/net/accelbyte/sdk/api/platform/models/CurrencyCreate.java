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
public class CurrencyCreate extends Model {

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencySymbol")
    private String currencySymbol;

    @JsonProperty("currencyType")
    private String currencyType;

    @JsonProperty("decimals")
    private Integer decimals;

    @JsonProperty("localizationDescriptions")
    private Map<String, String> localizationDescriptions;


    
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
    public CurrencyCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CurrencyCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CurrencyCreate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("currencyType", "currencyType");
        result.put("decimals", "decimals");
        result.put("localizationDescriptions", "localizationDescriptions");
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
    
    public static class CurrencyCreateBuilder {
        private String currencyType;
        
        
        public CurrencyCreateBuilder currencyType(final String currencyType) {
            this.currencyType = currencyType;
            return this;
        }
        
        public CurrencyCreateBuilder currencyTypeFromEnum(final CurrencyType currencyType) {
            this.currencyType = currencyType.toString();
            return this;
        }
    }
}
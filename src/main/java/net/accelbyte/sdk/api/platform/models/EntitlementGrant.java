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
public class EntitlementGrant extends Model {

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("grantedCode")
    private String grantedCode;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemNamespace")
    private String itemNamespace;

    @JsonProperty("language")
    private String language;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("region")
    private String region;

    @JsonProperty("source")
    private String source;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("storeId")
    private String storeId;


    
    @JsonIgnore
    public String getSource() {
        return this.source;
    }
    
    @JsonIgnore
    public Source getSourceAsEnum() {
        return Source.valueOf(this.source);
    }
    
    @JsonIgnore
    public void setSource(final String source) {
        this.source = source;
    }
    
    @JsonIgnore
    public void setSourceFromEnum(final Source source) {
        this.source = source.toString();
    }

    @JsonIgnore
    public EntitlementGrant createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementGrant> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementGrant>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("endDate", "endDate");
        result.put("grantedCode", "grantedCode");
        result.put("itemId", "itemId");
        result.put("itemNamespace", "itemNamespace");
        result.put("language", "language");
        result.put("quantity", "quantity");
        result.put("region", "region");
        result.put("source", "source");
        result.put("startDate", "startDate");
        result.put("storeId", "storeId");
        return result;
    }
    
    public enum Source {
        PURCHASE("PURCHASE"),
        IAP("IAP"),
        PROMOTION("PROMOTION"),
        ACHIEVEMENT("ACHIEVEMENT"),
        REFERRALBONUS("REFERRALBONUS"),
        REDEEMCODE("REDEEMCODE"),
        REWARD("REWARD"),
        GIFT("GIFT"),
        OTHER("OTHER");

        private String value;

        Source(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class EntitlementGrantBuilder {
        private String source;
        
        
        public EntitlementGrantBuilder source(final String source) {
            this.source = source;
            return this;
        }
        
        public EntitlementGrantBuilder sourceFromEnum(final Source source) {
            this.source = source.toString();
            return this;
        }
    }
}
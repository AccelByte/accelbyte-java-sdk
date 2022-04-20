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
public class IAPItemEntry extends Model {

    @JsonProperty("itemIdentity")
    private String itemIdentity;

    @JsonProperty("itemIdentityType")
    private String itemIdentityType;

    @JsonProperty("platformProductIdMap")
    private Map<String, String> platformProductIdMap;


    
    public String getItemIdentityType() {
        return this.itemIdentityType;
    }
    
    public ItemIdentityType getItemIdentityTypeAsEnum() {
        return ItemIdentityType.valueOf(this.itemIdentityType);
    }
    
    public void setItemIdentityType(final String itemIdentityType) {
        this.itemIdentityType = itemIdentityType;
    }
    
    public void setItemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
        this.itemIdentityType = itemIdentityType.toString();
    }

    @JsonIgnore
    public IAPItemEntry createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<IAPItemEntry> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<IAPItemEntry>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("itemIdentity", "itemIdentity");
        result.put("itemIdentityType", "itemIdentityType");
        result.put("platformProductIdMap", "platformProductIdMap");
        return result;
    }
    
    public enum ItemIdentityType {
        ITEMID("ITEMID"),
        ITEMSKU("ITEMSKU");

        private String value;

        ItemIdentityType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class IAPItemEntryBuilder {
        private String itemIdentityType;
        
        
        public IAPItemEntryBuilder itemIdentityType(final String itemIdentityType) {
            this.itemIdentityType = itemIdentityType;
            return this;
        }
        
        public IAPItemEntryBuilder itemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
            this.itemIdentityType = itemIdentityType.toString();
            return this;
        }
    }
}
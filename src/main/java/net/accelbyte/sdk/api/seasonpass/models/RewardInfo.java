/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class RewardInfo extends Model {

    @JsonProperty("code")
    private String code;

    @JsonProperty("currency")
    private RewardCurrency currency;

    @JsonProperty("image")
    private Image image;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemName")
    private String itemName;

    @JsonProperty("itemSku")
    private String itemSku;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("type")
    private String type;


    
    @JsonIgnore
    public String getItemType() {
        return this.itemType;
    }
    
    @JsonIgnore
    public ItemType getItemTypeAsEnum() {
        return ItemType.valueOf(this.itemType);
    }
    
    @JsonIgnore
    public void setItemType(final String itemType) {
        this.itemType = itemType;
    }
    
    @JsonIgnore
    public void setItemTypeFromEnum(final ItemType itemType) {
        this.itemType = itemType.toString();
    }
    
    @JsonIgnore
    public String getType() {
        return this.type;
    }
    
    @JsonIgnore
    public Type getTypeAsEnum() {
        return Type.valueOf(this.type);
    }
    
    @JsonIgnore
    public void setType(final String type) {
        this.type = type;
    }
    
    @JsonIgnore
    public void setTypeFromEnum(final Type type) {
        this.type = type.toString();
    }

    @JsonIgnore
    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RewardInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("currency", "currency");
        result.put("image", "image");
        result.put("itemId", "itemId");
        result.put("itemName", "itemName");
        result.put("itemSku", "itemSku");
        result.put("itemType", "itemType");
        result.put("namespace", "namespace");
        result.put("quantity", "quantity");
        result.put("seasonId", "seasonId");
        result.put("type", "type");
        return result;
    }
    
    public enum ItemType {
        APP("APP"),
        COINS("COINS"),
        INGAMEITEM("INGAMEITEM"),
        BUNDLE("BUNDLE"),
        CODE("CODE"),
        SUBSCRIPTION("SUBSCRIPTION"),
        SEASON("SEASON");

        private String value;

        ItemType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Type {
        ITEM("ITEM"),
        CURRENCY("CURRENCY");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class RewardInfoBuilder {
        private String itemType;
        private String type;
        
        
        public RewardInfoBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }
        
        public RewardInfoBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
        
        public RewardInfoBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public RewardInfoBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
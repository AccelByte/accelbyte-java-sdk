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
public class BasicItem extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("baseAppId")
    private String baseAppId;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("features")
    private List<String> features;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("seasonType")
    private String seasonType;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    private Integer useCount;


    
    public String getAppType() {
        return this.appType;
    }
    
    public AppType getAppTypeAsEnum() {
        return AppType.valueOf(this.appType);
    }
    
    public void setAppType(final String appType) {
        this.appType = appType;
    }
    
    public void setAppTypeFromEnum(final AppType appType) {
        this.appType = appType.toString();
    }
    
    public String getEntitlementType() {
        return this.entitlementType;
    }
    
    public EntitlementType getEntitlementTypeAsEnum() {
        return EntitlementType.valueOf(this.entitlementType);
    }
    
    public void setEntitlementType(final String entitlementType) {
        this.entitlementType = entitlementType;
    }
    
    public void setEntitlementTypeFromEnum(final EntitlementType entitlementType) {
        this.entitlementType = entitlementType.toString();
    }
    
    public String getItemType() {
        return this.itemType;
    }
    
    public ItemType getItemTypeAsEnum() {
        return ItemType.valueOf(this.itemType);
    }
    
    public void setItemType(final String itemType) {
        this.itemType = itemType;
    }
    
    public void setItemTypeFromEnum(final ItemType itemType) {
        this.itemType = itemType.toString();
    }
    
    public String getSeasonType() {
        return this.seasonType;
    }
    
    public SeasonType getSeasonTypeAsEnum() {
        return SeasonType.valueOf(this.seasonType);
    }
    
    public void setSeasonType(final String seasonType) {
        this.seasonType = seasonType;
    }
    
    public void setSeasonTypeFromEnum(final SeasonType seasonType) {
        this.seasonType = seasonType.toString();
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

    @JsonIgnore
    public BasicItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<BasicItem> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BasicItem>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("baseAppId", "baseAppId");
        result.put("createdAt", "createdAt");
        result.put("entitlementType", "entitlementType");
        result.put("features", "features");
        result.put("itemId", "itemId");
        result.put("itemType", "itemType");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("seasonType", "seasonType");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        return result;
    }
    
    public enum AppType {
        GAME("GAME"),
        SOFTWARE("SOFTWARE"),
        DLC("DLC"),
        DEMO("DEMO");

        private String value;

        AppType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum EntitlementType {
        DURABLE("DURABLE"),
        CONSUMABLE("CONSUMABLE");

        private String value;

        EntitlementType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum ItemType {
        APP("APP"),
        COINS("COINS"),
        INGAMEITEM("INGAMEITEM"),
        BUNDLE("BUNDLE"),
        CODE("CODE"),
        SUBSCRIPTION("SUBSCRIPTION"),
        SEASON("SEASON"),
        MEDIA("MEDIA");

        private String value;

        ItemType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum SeasonType {
        PASS("PASS"),
        TIER("TIER");

        private String value;

        SeasonType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Status {
        ACTIVE("ACTIVE"),
        INACTIVE("INACTIVE");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class BasicItemBuilder {
        private String appType;
        private String entitlementType;
        private String itemType;
        private String seasonType;
        private String status;
        
        
        public BasicItemBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }
        
        public BasicItemBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }
        
        public BasicItemBuilder entitlementType(final String entitlementType) {
            this.entitlementType = entitlementType;
            return this;
        }
        
        public BasicItemBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
            this.entitlementType = entitlementType.toString();
            return this;
        }
        
        public BasicItemBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }
        
        public BasicItemBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
        
        public BasicItemBuilder seasonType(final String seasonType) {
            this.seasonType = seasonType;
            return this;
        }
        
        public BasicItemBuilder seasonTypeFromEnum(final SeasonType seasonType) {
            this.seasonType = seasonType.toString();
            return this;
        }
        
        public BasicItemBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public BasicItemBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
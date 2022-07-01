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
public class BundledItemInfo extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("baseAppId")
    private String baseAppId;

    @JsonProperty("boothName")
    private String boothName;

    @JsonProperty("boundItemIds")
    private List<String> boundItemIds;

    @JsonProperty("bundledQty")
    private Integer bundledQty;

    @JsonProperty("categoryPath")
    private String categoryPath;

    @JsonProperty("clazz")
    private String clazz;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("displayOrder")
    private Integer displayOrder;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("ext")
    private Map<String, ?> ext;

    @JsonProperty("features")
    private List<String> features;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemIds")
    private List<String> itemIds;

    @JsonProperty("itemQty")
    private Map<String, Integer> itemQty;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("language")
    private String language;

    @JsonProperty("listable")
    private Boolean listable;

    @JsonProperty("localExt")
    private Map<String, ?> localExt;

    @JsonProperty("longDescription")
    private String longDescription;

    @JsonProperty("maxCount")
    private Integer maxCount;

    @JsonProperty("maxCountPerUser")
    private Integer maxCountPerUser;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("purchasable")
    private Boolean purchasable;

    @JsonProperty("recurring")
    private Recurring recurring;

    @JsonProperty("region")
    private String region;

    @JsonProperty("regionData")
    private List<RegionDataItem> regionData;

    @JsonProperty("seasonType")
    private String seasonType;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("targetCurrencyCode")
    private String targetCurrencyCode;

    @JsonProperty("targetItemId")
    private String targetItemId;

    @JsonProperty("targetNamespace")
    private String targetNamespace;

    @JsonProperty("thumbnailUrl")
    private String thumbnailUrl;

    @JsonProperty("title")
    private String title;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    private Integer useCount;


    
    @JsonIgnore
    public String getAppType() {
        return this.appType;
    }
    
    @JsonIgnore
    public AppType getAppTypeAsEnum() {
        return AppType.valueOf(this.appType);
    }
    
    @JsonIgnore
    public void setAppType(final String appType) {
        this.appType = appType;
    }
    
    @JsonIgnore
    public void setAppTypeFromEnum(final AppType appType) {
        this.appType = appType.toString();
    }
    
    @JsonIgnore
    public String getEntitlementType() {
        return this.entitlementType;
    }
    
    @JsonIgnore
    public EntitlementType getEntitlementTypeAsEnum() {
        return EntitlementType.valueOf(this.entitlementType);
    }
    
    @JsonIgnore
    public void setEntitlementType(final String entitlementType) {
        this.entitlementType = entitlementType;
    }
    
    @JsonIgnore
    public void setEntitlementTypeFromEnum(final EntitlementType entitlementType) {
        this.entitlementType = entitlementType.toString();
    }
    
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
    public String getSeasonType() {
        return this.seasonType;
    }
    
    @JsonIgnore
    public SeasonType getSeasonTypeAsEnum() {
        return SeasonType.valueOf(this.seasonType);
    }
    
    @JsonIgnore
    public void setSeasonType(final String seasonType) {
        this.seasonType = seasonType;
    }
    
    @JsonIgnore
    public void setSeasonTypeFromEnum(final SeasonType seasonType) {
        this.seasonType = seasonType.toString();
    }
    
    @JsonIgnore
    public String getStatus() {
        return this.status;
    }
    
    @JsonIgnore
    public Status getStatusAsEnum() {
        return Status.valueOf(this.status);
    }
    
    @JsonIgnore
    public void setStatus(final String status) {
        this.status = status;
    }
    
    @JsonIgnore
    public void setStatusFromEnum(final Status status) {
        this.status = status.toString();
    }

    @JsonIgnore
    public BundledItemInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<BundledItemInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BundledItemInfo>>() {});
    }

    
    public enum AppType {
        DEMO("DEMO"),
        DLC("DLC"),
        GAME("GAME"),
        SOFTWARE("SOFTWARE");

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
        CONSUMABLE("CONSUMABLE"),
        DURABLE("DURABLE");

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
        BUNDLE("BUNDLE"),
        CODE("CODE"),
        COINS("COINS"),
        INGAMEITEM("INGAMEITEM"),
        MEDIA("MEDIA"),
        SEASON("SEASON"),
        SUBSCRIPTION("SUBSCRIPTION");

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
    
    public static class BundledItemInfoBuilder {
        private String appType;
        private String entitlementType;
        private String itemType;
        private String seasonType;
        private String status;
        
        
        public BundledItemInfoBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }
        
        public BundledItemInfoBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }
        
        public BundledItemInfoBuilder entitlementType(final String entitlementType) {
            this.entitlementType = entitlementType;
            return this;
        }
        
        public BundledItemInfoBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
            this.entitlementType = entitlementType.toString();
            return this;
        }
        
        public BundledItemInfoBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }
        
        public BundledItemInfoBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
        
        public BundledItemInfoBuilder seasonType(final String seasonType) {
            this.seasonType = seasonType;
            return this;
        }
        
        public BundledItemInfoBuilder seasonTypeFromEnum(final SeasonType seasonType) {
            this.seasonType = seasonType.toString();
            return this;
        }
        
        public BundledItemInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public BundledItemInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
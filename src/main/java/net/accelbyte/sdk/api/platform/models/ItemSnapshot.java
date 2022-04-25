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
public class ItemSnapshot extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("baseAppId")
    private String baseAppId;

    @JsonProperty("boothName")
    private String boothName;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("features")
    private List<String> features;

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

    @JsonProperty("regionDataItem")
    private RegionDataItem regionDataItem;

    @JsonProperty("seasonType")
    private String seasonType;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("stackable")
    private Boolean stackable;

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
    public ItemSnapshot createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemSnapshot> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemSnapshot>>() {});
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
    
    public static class ItemSnapshotBuilder {
        private String appType;
        private String entitlementType;
        private String itemType;
        private String seasonType;
        
        
        public ItemSnapshotBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }
        
        public ItemSnapshotBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }
        
        public ItemSnapshotBuilder entitlementType(final String entitlementType) {
            this.entitlementType = entitlementType;
            return this;
        }
        
        public ItemSnapshotBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
            this.entitlementType = entitlementType.toString();
            return this;
        }
        
        public ItemSnapshotBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }
        
        public ItemSnapshotBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
        
        public ItemSnapshotBuilder seasonType(final String seasonType) {
            this.seasonType = seasonType;
            return this;
        }
        
        public ItemSnapshotBuilder seasonTypeFromEnum(final SeasonType seasonType) {
            this.seasonType = seasonType.toString();
            return this;
        }
    }
}
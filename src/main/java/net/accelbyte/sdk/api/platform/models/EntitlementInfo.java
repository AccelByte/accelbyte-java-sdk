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
public class EntitlementInfo extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("clazz")
    private String clazz;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("features")
    private List<String> features;

    @JsonProperty("grantedAt")
    private String grantedAt;

    @JsonProperty("grantedCode")
    private String grantedCode;

    @JsonProperty("id")
    private String id;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemNamespace")
    private String itemNamespace;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("source")
    private String source;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("status")
    private String status;

    @JsonProperty("storeId")
    private String storeId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    private Integer useCount;

    @JsonProperty("userId")
    private String userId;


    
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
    
    public String getClazz() {
        return this.clazz;
    }
    
    public Clazz getClazzAsEnum() {
        return Clazz.valueOf(this.clazz);
    }
    
    public void setClazz(final String clazz) {
        this.clazz = clazz;
    }
    
    public void setClazzFromEnum(final Clazz clazz) {
        this.clazz = clazz.toString();
    }
    
    public String getSource() {
        return this.source;
    }
    
    public Source getSourceAsEnum() {
        return Source.valueOf(this.source);
    }
    
    public void setSource(final String source) {
        this.source = source;
    }
    
    public void setSourceFromEnum(final Source source) {
        this.source = source.toString();
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
    
    public String getType() {
        return this.type;
    }
    
    public Type getTypeAsEnum() {
        return Type.valueOf(this.type);
    }
    
    public void setType(final String type) {
        this.type = type;
    }
    
    public void setTypeFromEnum(final Type type) {
        this.type = type.toString();
    }

    @JsonIgnore
    public EntitlementInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("clazz", "clazz");
        result.put("createdAt", "createdAt");
        result.put("endDate", "endDate");
        result.put("features", "features");
        result.put("grantedAt", "grantedAt");
        result.put("grantedCode", "grantedCode");
        result.put("id", "id");
        result.put("itemId", "itemId");
        result.put("itemNamespace", "itemNamespace");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("sku", "sku");
        result.put("source", "source");
        result.put("stackable", "stackable");
        result.put("startDate", "startDate");
        result.put("status", "status");
        result.put("storeId", "storeId");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        result.put("userId", "userId");
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
    
    public enum Clazz {
        APP("APP"),
        ENTITLEMENT("ENTITLEMENT"),
        CODE("CODE"),
        SUBSCRIPTION("SUBSCRIPTION"),
        MEDIA("MEDIA");

        private String value;

        Clazz(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
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
    
    public enum Status {
        ACTIVE("ACTIVE"),
        INACTIVE("INACTIVE"),
        CONSUMED("CONSUMED"),
        REVOKED("REVOKED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Type {
        DURABLE("DURABLE"),
        CONSUMABLE("CONSUMABLE");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class EntitlementInfoBuilder {
        private String appType;
        private String clazz;
        private String source;
        private String status;
        private String type;
        
        
        public EntitlementInfoBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }
        
        public EntitlementInfoBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }
        
        public EntitlementInfoBuilder clazz(final String clazz) {
            this.clazz = clazz;
            return this;
        }
        
        public EntitlementInfoBuilder clazzFromEnum(final Clazz clazz) {
            this.clazz = clazz.toString();
            return this;
        }
        
        public EntitlementInfoBuilder source(final String source) {
            this.source = source;
            return this;
        }
        
        public EntitlementInfoBuilder sourceFromEnum(final Source source) {
            this.source = source.toString();
            return this;
        }
        
        public EntitlementInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public EntitlementInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
        
        public EntitlementInfoBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public EntitlementInfoBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
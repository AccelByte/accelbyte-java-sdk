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
public class AppEntitlementInfo extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("grantedAt")
    private String grantedAt;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("status")
    private String status;

    @JsonProperty("storeId")
    private String storeId;

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
    public AppEntitlementInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AppEntitlementInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AppEntitlementInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("endDate", "endDate");
        result.put("grantedAt", "grantedAt");
        result.put("itemId", "itemId");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("namespace", "namespace");
        result.put("sku", "sku");
        result.put("startDate", "startDate");
        result.put("status", "status");
        result.put("storeId", "storeId");
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
    
    public static class AppEntitlementInfoBuilder {
        private String appType;
        private String status;
        
        
        public AppEntitlementInfoBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }
        
        public AppEntitlementInfoBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }
        
        public AppEntitlementInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public AppEntitlementInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
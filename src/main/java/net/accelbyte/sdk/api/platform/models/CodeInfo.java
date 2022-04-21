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
public class CodeInfo extends Model {

    @JsonProperty("acquireOrderNo")
    private String acquireOrderNo;

    @JsonProperty("acquireUserId")
    private String acquireUserId;

    @JsonProperty("batchNo")
    private Integer batchNo;

    @JsonProperty("campaignId")
    private String campaignId;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("id")
    private String id;

    @JsonProperty("items")
    private List<RedeemableItem> items;

    @JsonProperty("maxRedeemCountPerCampaignPerUser")
    private Integer maxRedeemCountPerCampaignPerUser;

    @JsonProperty("maxRedeemCountPerCode")
    private Integer maxRedeemCountPerCode;

    @JsonProperty("maxRedeemCountPerCodePerUser")
    private Integer maxRedeemCountPerCodePerUser;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("redeemEnd")
    private String redeemEnd;

    @JsonProperty("redeemStart")
    private String redeemStart;

    @JsonProperty("redeemType")
    private String redeemType;

    @JsonProperty("redeemedCount")
    private Integer redeemedCount;

    @JsonProperty("remainder")
    private Integer remainder;

    @JsonProperty("status")
    private String status;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("value")
    private String value;


    
    @JsonIgnore
    public String getRedeemType() {
        return this.redeemType;
    }
    
    @JsonIgnore
    public RedeemType getRedeemTypeAsEnum() {
        return RedeemType.valueOf(this.redeemType);
    }
    
    @JsonIgnore
    public void setRedeemType(final String redeemType) {
        this.redeemType = redeemType;
    }
    
    @JsonIgnore
    public void setRedeemTypeFromEnum(final RedeemType redeemType) {
        this.redeemType = redeemType.toString();
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
    public CodeInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CodeInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CodeInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acquireOrderNo", "acquireOrderNo");
        result.put("acquireUserId", "acquireUserId");
        result.put("batchNo", "batchNo");
        result.put("campaignId", "campaignId");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("items", "items");
        result.put("maxRedeemCountPerCampaignPerUser", "maxRedeemCountPerCampaignPerUser");
        result.put("maxRedeemCountPerCode", "maxRedeemCountPerCode");
        result.put("maxRedeemCountPerCodePerUser", "maxRedeemCountPerCodePerUser");
        result.put("namespace", "namespace");
        result.put("redeemEnd", "redeemEnd");
        result.put("redeemStart", "redeemStart");
        result.put("redeemType", "redeemType");
        result.put("redeemedCount", "redeemedCount");
        result.put("remainder", "remainder");
        result.put("status", "status");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("value", "value");
        return result;
    }
    
    public enum RedeemType {
        ITEM("ITEM");

        private String value;

        RedeemType(String value){
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
    
    public enum Type {
        REDEMPTION("REDEMPTION");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class CodeInfoBuilder {
        private String redeemType;
        private String status;
        private String type;
        
        
        public CodeInfoBuilder redeemType(final String redeemType) {
            this.redeemType = redeemType;
            return this;
        }
        
        public CodeInfoBuilder redeemTypeFromEnum(final RedeemType redeemType) {
            this.redeemType = redeemType.toString();
            return this;
        }
        
        public CodeInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public CodeInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
        
        public CodeInfoBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public CodeInfoBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
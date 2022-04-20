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
public class IAPOrderInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("credits")
    private List<CreditSummary> credits;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("entitlements")
    private List<EntitlementSummary> entitlements;

    @JsonProperty("fulfilledTime")
    private String fulfilledTime;

    @JsonProperty("iapOrderNo")
    private String iapOrderNo;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("price")
    private Float price;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("receiptData")
    private String receiptData;

    @JsonProperty("region")
    private String region;

    @JsonProperty("retryCount")
    private Integer retryCount;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("transactionId")
    private String transactionId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;


    
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
    public IAPOrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<IAPOrderInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<IAPOrderInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("credits", "credits");
        result.put("currencyCode", "currencyCode");
        result.put("entitlements", "entitlements");
        result.put("fulfilledTime", "fulfilledTime");
        result.put("iapOrderNo", "iapOrderNo");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("price", "price");
        result.put("productId", "productId");
        result.put("quantity", "quantity");
        result.put("receiptData", "receiptData");
        result.put("region", "region");
        result.put("retryCount", "retryCount");
        result.put("sandbox", "sandbox");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("transactionId", "transactionId");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
    
    public enum Status {
        VERIFIED("VERIFIED"),
        FULFILLED("FULFILLED"),
        FAILED("FAILED");

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
        APPLE("APPLE"),
        GOOGLE("GOOGLE"),
        PLAYSTATION("PLAYSTATION"),
        STEAM("STEAM"),
        XBOX("XBOX"),
        STADIA("STADIA"),
        EPICGAMES("EPICGAMES"),
        TWITCH("TWITCH");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class IAPOrderInfoBuilder {
        private String status;
        private String type;
        
        
        public IAPOrderInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public IAPOrderInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
        
        public IAPOrderInfoBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public IAPOrderInfoBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
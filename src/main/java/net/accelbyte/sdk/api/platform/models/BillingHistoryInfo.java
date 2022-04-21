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
public class BillingHistoryInfo extends Model {

    @JsonProperty("amount")
    private Integer amount;

    @JsonProperty("billingAccount")
    private BillingAccount billingAccount;

    @JsonProperty("changeBillingAccount")
    private Boolean changeBillingAccount;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("description")
    private String description;

    @JsonProperty("extTxId")
    private String extTxId;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("recurringOrderNo")
    private String recurringOrderNo;

    @JsonProperty("retryAttempted")
    private Integer retryAttempted;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("subscriptionId")
    private String subscriptionId;

    @JsonProperty("subtotalPrice")
    private Integer subtotalPrice;

    @JsonProperty("title")
    private String title;

    @JsonProperty("totalPrice")
    private Integer totalPrice;

    @JsonProperty("totalTax")
    private Integer totalTax;

    @JsonProperty("txEndTime")
    private String txEndTime;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;


    
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
    public BillingHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<BillingHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BillingHistoryInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("amount", "amount");
        result.put("billingAccount", "billingAccount");
        result.put("changeBillingAccount", "changeBillingAccount");
        result.put("createdAt", "createdAt");
        result.put("currency", "currency");
        result.put("description", "description");
        result.put("extTxId", "extTxId");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("recurringOrderNo", "recurringOrderNo");
        result.put("retryAttempted", "retryAttempted");
        result.put("sandbox", "sandbox");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("subscriptionId", "subscriptionId");
        result.put("subtotalPrice", "subtotalPrice");
        result.put("title", "title");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("txEndTime", "txEndTime");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
    
    public enum Status {
        INIT("INIT"),
        CHARGED("CHARGED"),
        CHARGEFAILED("CHARGEFAILED"),
        REFUNDED("REFUNDED"),
        REFUNDFAILED("REFUNDFAILED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class BillingHistoryInfoBuilder {
        private String status;
        
        
        public BillingHistoryInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public BillingHistoryInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
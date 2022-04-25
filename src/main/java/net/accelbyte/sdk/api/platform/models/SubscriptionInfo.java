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
public class SubscriptionInfo extends Model {

    @JsonProperty("billingAccount")
    private BillingAccount billingAccount;

    @JsonProperty("chargeStatus")
    private String chargeStatus;

    @JsonProperty("chargedCycles")
    private Integer chargedCycles;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("currentCycle")
    private Integer currentCycle;

    @JsonProperty("currentPeriodEnd")
    private String currentPeriodEnd;

    @JsonProperty("currentPeriodStart")
    private String currentPeriodStart;

    @JsonProperty("description")
    private String description;

    @JsonProperty("end")
    private String end;

    @JsonProperty("entitlements")
    private List<EntitlementSummary> entitlements;

    @JsonProperty("firstSubscribe")
    private Boolean firstSubscribe;

    @JsonProperty("id")
    private String id;

    @JsonProperty("inFixedCycleTrial")
    private Boolean inFixedCycleTrial;

    @JsonProperty("inFixedFreeDays")
    private Boolean inFixedFreeDays;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("nextBillingDate")
    private String nextBillingDate;

    @JsonProperty("paid")
    private Boolean paid;

    @JsonProperty("paymentFlowRequired")
    private Boolean paymentFlowRequired;

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("paymentStationUrl")
    private String paymentStationUrl;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("recurring")
    private Recurring recurring;

    @JsonProperty("region")
    private String region;

    @JsonProperty("retryAttempted")
    private Integer retryAttempted;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("source")
    private String source;

    @JsonProperty("start")
    private String start;

    @JsonProperty("status")
    private String status;

    @JsonProperty("subscribedAt")
    private String subscribedAt;

    @JsonProperty("subscribedBy")
    private String subscribedBy;

    @JsonProperty("title")
    private String title;

    @JsonProperty("trialPrice")
    private Integer trialPrice;

    @JsonProperty("trialedCycles")
    private Integer trialedCycles;

    @JsonProperty("unsubscribeReason")
    private String unsubscribeReason;

    @JsonProperty("unsubscribedAt")
    private String unsubscribedAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;


    
    @JsonIgnore
    public String getChargeStatus() {
        return this.chargeStatus;
    }
    
    @JsonIgnore
    public ChargeStatus getChargeStatusAsEnum() {
        return ChargeStatus.valueOf(this.chargeStatus);
    }
    
    @JsonIgnore
    public void setChargeStatus(final String chargeStatus) {
        this.chargeStatus = chargeStatus;
    }
    
    @JsonIgnore
    public void setChargeStatusFromEnum(final ChargeStatus chargeStatus) {
        this.chargeStatus = chargeStatus.toString();
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
    public String getSubscribedBy() {
        return this.subscribedBy;
    }
    
    @JsonIgnore
    public SubscribedBy getSubscribedByAsEnum() {
        return SubscribedBy.valueOf(this.subscribedBy);
    }
    
    @JsonIgnore
    public void setSubscribedBy(final String subscribedBy) {
        this.subscribedBy = subscribedBy;
    }
    
    @JsonIgnore
    public void setSubscribedByFromEnum(final SubscribedBy subscribedBy) {
        this.subscribedBy = subscribedBy.toString();
    }

    @JsonIgnore
    public SubscriptionInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SubscriptionInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SubscriptionInfo>>() {});
    }

    
    public enum ChargeStatus {
        NEVER("NEVER"),
        SETUP("SETUP"),
        RECURRINGCHARGING("RECURRINGCHARGING"),
        CHARGED("CHARGED"),
        CHARGEFAILED("CHARGEFAILED");

        private String value;

        ChargeStatus(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Status {
        INIT("INIT"),
        ACTIVE("ACTIVE"),
        CANCELLED("CANCELLED"),
        EXPIRED("EXPIRED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum SubscribedBy {
        USER("USER"),
        PLATFORM("PLATFORM");

        private String value;

        SubscribedBy(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class SubscriptionInfoBuilder {
        private String chargeStatus;
        private String status;
        private String subscribedBy;
        
        
        public SubscriptionInfoBuilder chargeStatus(final String chargeStatus) {
            this.chargeStatus = chargeStatus;
            return this;
        }
        
        public SubscriptionInfoBuilder chargeStatusFromEnum(final ChargeStatus chargeStatus) {
            this.chargeStatus = chargeStatus.toString();
            return this;
        }
        
        public SubscriptionInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public SubscriptionInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
        
        public SubscriptionInfoBuilder subscribedBy(final String subscribedBy) {
            this.subscribedBy = subscribedBy;
            return this;
        }
        
        public SubscriptionInfoBuilder subscribedByFromEnum(final SubscribedBy subscribedBy) {
            this.subscribedBy = subscribedBy.toString();
            return this;
        }
    }
}
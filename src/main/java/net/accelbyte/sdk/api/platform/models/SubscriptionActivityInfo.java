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
public class SubscriptionActivityInfo extends Model {

    @JsonProperty("action")
    private String action;

    @JsonProperty("chargedCycles")
    private Integer chargedCycles;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currentCycle")
    private Integer currentCycle;

    @JsonProperty("grantDays")
    private Integer grantDays;

    @JsonProperty("inFixedCycleTrial")
    private Boolean inFixedCycleTrial;

    @JsonProperty("inFixedFreeDays")
    private Boolean inFixedFreeDays;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("operator")
    private String operator;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("subscribedBy")
    private String subscribedBy;

    @JsonProperty("subscriptionId")
    private String subscriptionId;

    @JsonProperty("trialedCycles")
    private Integer trialedCycles;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;


    
    @JsonIgnore
    public String getAction() {
        return this.action;
    }
    
    @JsonIgnore
    public Action getActionAsEnum() {
        return Action.valueOf(this.action);
    }
    
    @JsonIgnore
    public void setAction(final String action) {
        this.action = action;
    }
    
    @JsonIgnore
    public void setActionFromEnum(final Action action) {
        this.action = action.toString();
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
    public SubscriptionActivityInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SubscriptionActivityInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SubscriptionActivityInfo>>() {});
    }

    
    public enum Action {
        SUBSCRIBE("SUBSCRIBE"),
        CANCEL("CANCEL"),
        IMMEDIATECANCEL("IMMEDIATE_CANCEL"),
        RESUBSCRIBE("RESUBSCRIBE"),
        GRANTDAYS("GRANT_DAYS"),
        CHANGEBILLINGACCOUNT("CHANGE_BILLING_ACCOUNT");

        private String value;

        Action(String value){
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
    
    public static class SubscriptionActivityInfoBuilder {
        private String action;
        private String subscribedBy;
        
        
        public SubscriptionActivityInfoBuilder action(final String action) {
            this.action = action;
            return this;
        }
        
        public SubscriptionActivityInfoBuilder actionFromEnum(final Action action) {
            this.action = action.toString();
            return this;
        }
        
        public SubscriptionActivityInfoBuilder subscribedBy(final String subscribedBy) {
            this.subscribedBy = subscribedBy;
            return this;
        }
        
        public SubscriptionActivityInfoBuilder subscribedByFromEnum(final SubscribedBy subscribedBy) {
            this.subscribedBy = subscribedBy.toString();
            return this;
        }
    }
}
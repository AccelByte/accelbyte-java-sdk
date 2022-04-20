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


    
    public String getAction() {
        return this.action;
    }
    
    public Action getActionAsEnum() {
        return Action.valueOf(this.action);
    }
    
    public void setAction(final String action) {
        this.action = action;
    }
    
    public void setActionFromEnum(final Action action) {
        this.action = action.toString();
    }
    
    public String getSubscribedBy() {
        return this.subscribedBy;
    }
    
    public SubscribedBy getSubscribedByAsEnum() {
        return SubscribedBy.valueOf(this.subscribedBy);
    }
    
    public void setSubscribedBy(final String subscribedBy) {
        this.subscribedBy = subscribedBy;
    }
    
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

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "action");
        result.put("chargedCycles", "chargedCycles");
        result.put("createdAt", "createdAt");
        result.put("currentCycle", "currentCycle");
        result.put("grantDays", "grantDays");
        result.put("inFixedCycleTrial", "inFixedCycleTrial");
        result.put("inFixedFreeDays", "inFixedFreeDays");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("reason", "reason");
        result.put("subscribedBy", "subscribedBy");
        result.put("subscriptionId", "subscriptionId");
        result.put("trialedCycles", "trialedCycles");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
    
    public enum Action {
        SUBSCRIBE("SUBSCRIBE"),
        CANCEL("CANCEL"),
        IMMEDIATECANCEL("IMMEDIATECANCEL"),
        RESUBSCRIBE("RESUBSCRIBE"),
        GRANTDAYS("GRANTDAYS"),
        CHANGEBILLINGACCOUNT("CHANGEBILLINGACCOUNT");

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
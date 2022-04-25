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
public class OrderHistoryInfo extends Model {

    @JsonProperty("action")
    private String action;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("operator")
    private String operator;

    @JsonProperty("orderNo")
    private String orderNo;

    @JsonProperty("reason")
    private String reason;

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
    public OrderHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OrderHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OrderHistoryInfo>>() {});
    }

    
    public enum Action {
        INIT("INIT"),
        CHARGED("CHARGED"),
        CHARGEBACK("CHARGEBACK"),
        CHARGEBACKREVERSED("CHARGEBACKREVERSED"),
        FULFILLED("FULFILLED"),
        FULFILLFAILED("FULFILLFAILED"),
        REFUNDING("REFUNDING"),
        REFUNDED("REFUNDED"),
        REFUNDFAILED("REFUNDFAILED"),
        CLOSE("CLOSE"),
        DELETED("DELETED"),
        SETSTATUS("SETSTATUS");

        private String value;

        Action(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class OrderHistoryInfoBuilder {
        private String action;
        
        
        public OrderHistoryInfoBuilder action(final String action) {
            this.action = action;
            return this;
        }
        
        public OrderHistoryInfoBuilder actionFromEnum(final Action action) {
            this.action = action.toString();
            return this;
        }
    }
}
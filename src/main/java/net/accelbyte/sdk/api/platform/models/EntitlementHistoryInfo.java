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
public class EntitlementHistoryInfo extends Model {

    @JsonProperty("action")
    private String action;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("entitlementId")
    private String entitlementId;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("operator")
    private String operator;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    private Integer useCount;

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

    @JsonIgnore
    public EntitlementHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementHistoryInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "action");
        result.put("createdAt", "createdAt");
        result.put("entitlementId", "entitlementId");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        result.put("userId", "userId");
        return result;
    }
    
    public enum Action {
        GRANT("GRANT"),
        UPDATE("UPDATE"),
        DECREMENT("DECREMENT"),
        REVOKE("REVOKE"),
        DISABLE("DISABLE"),
        ENABLE("ENABLE");

        private String value;

        Action(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class EntitlementHistoryInfoBuilder {
        private String action;
        
        
        public EntitlementHistoryInfoBuilder action(final String action) {
            this.action = action;
            return this;
        }
        
        public EntitlementHistoryInfoBuilder actionFromEnum(final Action action) {
            this.action = action.toString();
            return this;
        }
    }
}
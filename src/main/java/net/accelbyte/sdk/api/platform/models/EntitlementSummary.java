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
public class EntitlementSummary extends Model {

    @JsonProperty("clazz")
    private String clazz;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("grantedCode")
    private String grantedCode;

    @JsonProperty("id")
    private String id;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("stackedUseCount")
    private Integer stackedUseCount;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("storeId")
    private String storeId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;


    
    @JsonIgnore
    public String getClazz() {
        return this.clazz;
    }
    
    @JsonIgnore
    public Clazz getClazzAsEnum() {
        return Clazz.valueOf(this.clazz);
    }
    
    @JsonIgnore
    public void setClazz(final String clazz) {
        this.clazz = clazz;
    }
    
    @JsonIgnore
    public void setClazzFromEnum(final Clazz clazz) {
        this.clazz = clazz.toString();
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
    public EntitlementSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementSummary> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementSummary>>() {});
    }

    
    public enum Clazz {
        APP("APP"),
        CODE("CODE"),
        ENTITLEMENT("ENTITLEMENT"),
        MEDIA("MEDIA"),
        SUBSCRIPTION("SUBSCRIPTION");

        private String value;

        Clazz(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Type {
        CONSUMABLE("CONSUMABLE"),
        DURABLE("DURABLE");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class EntitlementSummaryBuilder {
        private String clazz;
        private String type;
        
        
        public EntitlementSummaryBuilder clazz(final String clazz) {
            this.clazz = clazz;
            return this;
        }
        
        public EntitlementSummaryBuilder clazzFromEnum(final Clazz clazz) {
            this.clazz = clazz.toString();
            return this;
        }
        
        public EntitlementSummaryBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public EntitlementSummaryBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
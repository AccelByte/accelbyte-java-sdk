/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class StatInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("defaultValue")
    private Float defaultValue;

    @JsonProperty("description")
    private String description;

    @JsonProperty("incrementOnly")
    private Boolean incrementOnly;

    @JsonProperty("maximum")
    private Float maximum;

    @JsonProperty("minimum")
    private Float minimum;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("setAsGlobal")
    private Boolean setAsGlobal;

    @JsonProperty("setBy")
    private String setBy;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;


    
    @JsonIgnore
    public String getSetBy() {
        return this.setBy;
    }
    
    @JsonIgnore
    public SetBy getSetByAsEnum() {
        return SetBy.valueOf(this.setBy);
    }
    
    @JsonIgnore
    public void setSetBy(final String setBy) {
        this.setBy = setBy;
    }
    
    @JsonIgnore
    public void setSetByFromEnum(final SetBy setBy) {
        this.setBy = setBy.toString();
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
    public StatInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<StatInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StatInfo>>() {});
    }

    
    public enum SetBy {
        CLIENT("CLIENT"),
        SERVER("SERVER");

        private String value;

        SetBy(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Status {
        INIT("INIT"),
        TIED("TIED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class StatInfoBuilder {
        private String setBy;
        private String status;
        
        
        public StatInfoBuilder setBy(final String setBy) {
            this.setBy = setBy;
            return this;
        }
        
        public StatInfoBuilder setByFromEnum(final SetBy setBy) {
            this.setBy = setBy.toString();
            return this;
        }
        
        public StatInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public StatInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
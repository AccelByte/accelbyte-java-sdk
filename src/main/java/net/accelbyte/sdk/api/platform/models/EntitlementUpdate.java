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
public class EntitlementUpdate extends Model {

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("nullFieldList")
    private List<String> nullFieldList;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("status")
    private String status;

    @JsonProperty("useCount")
    private Integer useCount;


    
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
    public EntitlementUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementUpdate>>() {});
    }

    
    public enum Status {
        ACTIVE("ACTIVE"),
        INACTIVE("INACTIVE"),
        CONSUMED("CONSUMED"),
        REVOKED("REVOKED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class EntitlementUpdateBuilder {
        private String status;
        
        
        public EntitlementUpdateBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public EntitlementUpdateBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
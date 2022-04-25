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
public class FulfillmentHistoryInfo extends Model {

    @JsonProperty("code")
    private String code;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("creditSummaries")
    private List<CreditSummary> creditSummaries;

    @JsonProperty("entitlementSummaries")
    private List<EntitlementSummary> entitlementSummaries;

    @JsonProperty("fulfillItems")
    private List<FulfillmentItem> fulfillItems;

    @JsonProperty("fulfillmentError")
    private FulfillmentError fulfillmentError;

    @JsonProperty("grantedItemIds")
    private List<String> grantedItemIds;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("orderNo")
    private String orderNo;

    @JsonProperty("status")
    private String status;

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
    public FulfillmentHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FulfillmentHistoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentHistoryInfo>>() {});
    }

    
    public enum Status {
        SUCCESS("SUCCESS"),
        FAIL("FAIL");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class FulfillmentHistoryInfoBuilder {
        private String status;
        
        
        public FulfillmentHistoryInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public FulfillmentHistoryInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
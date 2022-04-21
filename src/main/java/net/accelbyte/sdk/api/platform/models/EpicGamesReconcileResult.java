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
public class EpicGamesReconcileResult extends Model {

    @JsonProperty("epicGamesItemId")
    private String epicGamesItemId;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("status")
    private String status;

    @JsonProperty("transactionId")
    private String transactionId;


    
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
    public EpicGamesReconcileResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EpicGamesReconcileResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EpicGamesReconcileResult>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("epicGamesItemId", "epicGamesItemId");
        result.put("itemId", "itemId");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("transactionId", "transactionId");
        return result;
    }
    
    public enum Status {
        VERIFIED("VERIFIED"),
        FULFILLED("FULFILLED"),
        FAILED("FAILED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class EpicGamesReconcileResultBuilder {
        private String status;
        
        
        public EpicGamesReconcileResultBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public EpicGamesReconcileResultBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
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
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SubscriptionSummary extends Model {

    @JsonProperty("currentPeriodEnd")
    private String currentPeriodEnd;

    @JsonProperty("currentPeriodStart")
    private String currentPeriodStart;

    @JsonProperty("id")
    private String id;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("status")
    private String status;

    @JsonProperty("subscribedBy")
    private String subscribedBy;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public SubscriptionSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SubscriptionSummary> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SubscriptionSummary>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currentPeriodEnd", "currentPeriodEnd");
        result.put("currentPeriodStart", "currentPeriodStart");
        result.put("id", "id");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("subscribedBy", "subscribedBy");
        result.put("userId", "userId");
        return result;
    }
}
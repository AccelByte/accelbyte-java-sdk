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
    public EntitlementSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementSummary> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementSummary>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clazz", "clazz");
        result.put("createdAt", "createdAt");
        result.put("endDate", "endDate");
        result.put("grantedCode", "grantedCode");
        result.put("id", "id");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("stackable", "stackable");
        result.put("stackedUseCount", "stackedUseCount");
        result.put("startDate", "startDate");
        result.put("storeId", "storeId");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
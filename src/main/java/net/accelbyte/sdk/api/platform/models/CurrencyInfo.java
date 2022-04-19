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
public class CurrencyInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencySymbol")
    private String currencySymbol;

    @JsonProperty("currencyType")
    private String currencyType;

    @JsonProperty("decimals")
    private Integer decimals;

    @JsonProperty("localizationDescriptions")
    private Map<String, String> localizationDescriptions;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public CurrencyInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CurrencyInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CurrencyInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("currencyType", "currencyType");
        result.put("decimals", "decimals");
        result.put("localizationDescriptions", "localizationDescriptions");
        result.put("namespace", "namespace");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
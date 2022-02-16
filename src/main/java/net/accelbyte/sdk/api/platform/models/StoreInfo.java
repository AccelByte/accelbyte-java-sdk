/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("defaultLanguage")
    private String defaultLanguage;

    @JsonProperty("defaultRegion")
    private String defaultRegion;

    @JsonProperty("description")
    private String description;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("published")
    private Boolean published;

    @JsonProperty("publishedTime")
    private String publishedTime;

    @JsonProperty("storeId")
    private String storeId;

    @JsonProperty("supportedLanguages")
    private List<String> supportedLanguages;

    @JsonProperty("supportedRegions")
    private List<String> supportedRegions;

    @JsonProperty("title")
    private String title;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public StoreInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<StoreInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StoreInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("defaultLanguage", "defaultLanguage");
        result.put("defaultRegion", "defaultRegion");
        result.put("description", "description");
        result.put("namespace", "namespace");
        result.put("published", "published");
        result.put("publishedTime", "publishedTime");
        result.put("storeId", "storeId");
        result.put("supportedLanguages", "supportedLanguages");
        result.put("supportedRegions", "supportedRegions");
        result.put("title", "title");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
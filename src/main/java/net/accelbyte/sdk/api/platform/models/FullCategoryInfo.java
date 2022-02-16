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
public class FullCategoryInfo extends Model {

    @JsonProperty("categoryPath")
    private String categoryPath;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("localizationDisplayNames")
    private Map<String, String> localizationDisplayNames;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("parentCategoryPath")
    private String parentCategoryPath;

    @JsonProperty("root")
    private Boolean root;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public FullCategoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FullCategoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FullCategoryInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("categoryPath", "categoryPath");
        result.put("createdAt", "createdAt");
        result.put("localizationDisplayNames", "localizationDisplayNames");
        result.put("namespace", "namespace");
        result.put("parentCategoryPath", "parentCategoryPath");
        result.put("root", "root");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
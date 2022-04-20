/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelTemplateLocalization extends Model {

    @JsonProperty("lastDraftAt")
    private String lastDraftAt;

    @JsonProperty("lastPublishedAt")
    private String lastPublishedAt;

    @JsonProperty("templateContent")
    private ModelTemplateContent templateContent;

    @JsonProperty("templateLanguage")
    private String templateLanguage;

    @JsonProperty("templateSlug")
    private String templateSlug;



    @JsonIgnore
    public ModelTemplateLocalization createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelTemplateLocalization> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelTemplateLocalization>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("lastDraftAt", "lastDraftAt");
        result.put("lastPublishedAt", "lastPublishedAt");
        result.put("templateContent", "templateContent");
        result.put("templateLanguage", "templateLanguage");
        result.put("templateSlug", "templateSlug");
        return result;
    }
    
    public static class ModelTemplateLocalizationBuilder {
        
    }
}
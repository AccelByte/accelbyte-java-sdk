/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelNotificationWithTemplateRequest extends Model {

    @JsonProperty("templateContext")
    private Map<String, String> templateContext;

    @JsonProperty("templateLanguage")
    private String templateLanguage;

    @JsonProperty("templateSlug")
    private String templateSlug;

    @JsonProperty("topic")
    private String topic;

    @JsonIgnore
    public ModelNotificationWithTemplateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelNotificationWithTemplateRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelNotificationWithTemplateRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("templateContext", "templateContext");
        result.put("templateLanguage", "templateLanguage");
        result.put("templateSlug", "templateSlug");
        result.put("topic", "topic");
        return result;
    }
}
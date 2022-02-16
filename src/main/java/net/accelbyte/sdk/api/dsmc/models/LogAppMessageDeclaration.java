/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
public class LogAppMessageDeclaration extends Model {

    @JsonProperty("Attributes")
    private List<String> attributes;

    @JsonProperty("Code")
    private String code;

    @JsonProperty("CodeName")
    private String codeName;

    @JsonProperty("Section")
    private String section;

    @JsonProperty("Service")
    private String service;

    @JsonProperty("Text")
    private String text;

    @JsonIgnore
    public LogAppMessageDeclaration createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<LogAppMessageDeclaration> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<LogAppMessageDeclaration>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Attributes", "attributes");
        result.put("Code", "code");
        result.put("CodeName", "codeName");
        result.put("Section", "section");
        result.put("Service", "service");
        result.put("Text", "text");
        return result;
    }
}
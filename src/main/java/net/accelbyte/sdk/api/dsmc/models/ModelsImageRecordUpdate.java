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
public class ModelsImageRecordUpdate extends Model {

    @JsonProperty("artifactPath")
    private String artifactPath;

    @JsonProperty("image")
    private String image;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("persistent")
    private Boolean persistent;

    @JsonProperty("version")
    private String version;

    @JsonIgnore
    public ModelsImageRecordUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsImageRecordUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsImageRecordUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("artifactPath", "artifactPath");
        result.put("image", "image");
        result.put("namespace", "namespace");
        result.put("persistent", "persistent");
        result.put("version", "version");
        return result;
    }
}
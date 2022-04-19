/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsPatchImageRecord extends Model {

    @JsonProperty("artifactPath")
    private String artifactPath;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("dockerPath")
    private String dockerPath;

    @JsonProperty("image")
    private String image;

    @JsonProperty("modifiedBy")
    private String modifiedBy;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("patchVersion")
    private String patchVersion;

    @JsonProperty("persistent")
    private Boolean persistent;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("version")
    private String version;

    @JsonIgnore
    public ModelsPatchImageRecord createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsPatchImageRecord> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPatchImageRecord>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("artifactPath", "artifactPath");
        result.put("createdAt", "createdAt");
        result.put("dockerPath", "dockerPath");
        result.put("image", "image");
        result.put("modifiedBy", "modifiedBy");
        result.put("namespace", "namespace");
        result.put("patchVersion", "patchVersion");
        result.put("persistent", "persistent");
        result.put("updatedAt", "updatedAt");
        result.put("version", "version");
        return result;
    }
}
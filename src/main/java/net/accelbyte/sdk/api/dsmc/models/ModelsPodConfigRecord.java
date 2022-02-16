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
public class ModelsPodConfigRecord extends Model {

    @JsonProperty("cpu_limit")
    private Integer cpuLimit;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("mem_limit")
    private Integer memLimit;

    @JsonProperty("modifiedBy")
    private String modifiedBy;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("params")
    private String params;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public ModelsPodConfigRecord createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsPodConfigRecord> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPodConfigRecord>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("cpu_limit", "cpuLimit");
        result.put("createdAt", "createdAt");
        result.put("mem_limit", "memLimit");
        result.put("modifiedBy", "modifiedBy");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("params", "params");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
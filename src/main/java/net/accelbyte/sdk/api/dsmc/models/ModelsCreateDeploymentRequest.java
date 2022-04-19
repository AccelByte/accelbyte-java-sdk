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
public class ModelsCreateDeploymentRequest extends Model {

    @JsonProperty("allow_version_override")
    private Boolean allowVersionOverride;

    @JsonProperty("buffer_count")
    private Integer bufferCount;

    @JsonProperty("buffer_percent")
    private Integer bufferPercent;

    @JsonProperty("configuration")
    private String configuration;

    @JsonProperty("enable_region_overrides")
    private Boolean enableRegionOverrides;

    @JsonProperty("game_version")
    private String gameVersion;

    @JsonProperty("max_count")
    private Integer maxCount;

    @JsonProperty("min_count")
    private Integer minCount;

    @JsonProperty("overrides")
    private Map<String, ModelsDeploymentConfigOverride> overrides;

    @JsonProperty("region_overrides")
    private Map<String, ModelsPodCountConfigOverride> regionOverrides;

    @JsonProperty("regions")
    private List<String> regions;

    @JsonProperty("use_buffer_percent")
    private Boolean useBufferPercent;

    @JsonIgnore
    public ModelsCreateDeploymentRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsCreateDeploymentRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateDeploymentRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allow_version_override", "allowVersionOverride");
        result.put("buffer_count", "bufferCount");
        result.put("buffer_percent", "bufferPercent");
        result.put("configuration", "configuration");
        result.put("enable_region_overrides", "enableRegionOverrides");
        result.put("game_version", "gameVersion");
        result.put("max_count", "maxCount");
        result.put("min_count", "minCount");
        result.put("overrides", "overrides");
        result.put("region_overrides", "regionOverrides");
        result.put("regions", "regions");
        result.put("use_buffer_percent", "useBufferPercent");
        return result;
    }
}
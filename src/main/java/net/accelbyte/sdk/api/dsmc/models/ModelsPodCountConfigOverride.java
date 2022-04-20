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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsPodCountConfigOverride extends Model {

    @JsonProperty("buffer_count")
    private Integer bufferCount;

    @JsonProperty("buffer_percent")
    private Integer bufferPercent;

    @JsonProperty("max_count")
    private Integer maxCount;

    @JsonProperty("min_count")
    private Integer minCount;

    @JsonProperty("name")
    private String name;

    @JsonProperty("use_buffer_percent")
    private Boolean useBufferPercent;



    @JsonIgnore
    public ModelsPodCountConfigOverride createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsPodCountConfigOverride> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPodCountConfigOverride>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("buffer_count", "bufferCount");
        result.put("buffer_percent", "bufferPercent");
        result.put("max_count", "maxCount");
        result.put("min_count", "minCount");
        result.put("name", "name");
        result.put("use_buffer_percent", "useBufferPercent");
        return result;
    }
    
    public static class ModelsPodCountConfigOverrideBuilder {
        
    }
}
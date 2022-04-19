/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class GameProfileRequest extends Model {

    @JsonProperty("achievements")
    private List<String> achievements;

    @JsonProperty("attributes")
    private Map<String, String> attributes;

    @JsonProperty("avatarUrl")
    private String avatarUrl;

    @JsonProperty("inventories")
    private List<String> inventories;

    @JsonProperty("label")
    private String label;

    @JsonProperty("profileName")
    private String profileName;

    @JsonProperty("statistics")
    private List<String> statistics;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonIgnore
    public GameProfileRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<GameProfileRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<GameProfileRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievements", "achievements");
        result.put("attributes", "attributes");
        result.put("avatarUrl", "avatarUrl");
        result.put("inventories", "inventories");
        result.put("label", "label");
        result.put("profileName", "profileName");
        result.put("statistics", "statistics");
        result.put("tags", "tags");
        return result;
    }
}
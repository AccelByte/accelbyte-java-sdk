/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.models;

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
public class ModelsPublicAchievementResponse extends Model {

    @JsonProperty("achievementCode")
    private String achievementCode;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("goalValue")
    private Float goalValue;

    @JsonProperty("hidden")
    private Boolean hidden;

    @JsonProperty("incremental")
    private Boolean incremental;

    @JsonProperty("listOrder")
    private Integer listOrder;

    @JsonProperty("lockedIcons")
    private List<ModelsIcon> lockedIcons;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("unlockedIcons")
    private List<ModelsIcon> unlockedIcons;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public ModelsPublicAchievementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsPublicAchievementResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPublicAchievementResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievementCode", "achievementCode");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("goalValue", "goalValue");
        result.put("hidden", "hidden");
        result.put("incremental", "incremental");
        result.put("listOrder", "listOrder");
        result.put("lockedIcons", "lockedIcons");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("statCode", "statCode");
        result.put("tags", "tags");
        result.put("unlockedIcons", "unlockedIcons");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
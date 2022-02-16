/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.achievement.models;

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
public class ModelsAchievementRequest extends Model {

    @JsonProperty("achievementCode")
    private String achievementCode;

    @JsonProperty("defaultLanguage")
    private String defaultLanguage;

    @JsonProperty("description")
    private Map<String, String> description;

    @JsonProperty("goalValue")
    private Float goalValue;

    @JsonProperty("hidden")
    private Boolean hidden;

    @JsonProperty("incremental")
    private Boolean incremental;

    @JsonProperty("lockedIcons")
    private List<ModelsIcon> lockedIcons;

    @JsonProperty("name")
    private Map<String, String> name;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("unlockedIcons")
    private List<ModelsIcon> unlockedIcons;

    @JsonIgnore
    public ModelsAchievementRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAchievementRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAchievementRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievementCode", "achievementCode");
        result.put("defaultLanguage", "defaultLanguage");
        result.put("description", "description");
        result.put("goalValue", "goalValue");
        result.put("hidden", "hidden");
        result.put("incremental", "incremental");
        result.put("lockedIcons", "lockedIcons");
        result.put("name", "name");
        result.put("statCode", "statCode");
        result.put("tags", "tags");
        result.put("unlockedIcons", "unlockedIcons");
        return result;
    }
}
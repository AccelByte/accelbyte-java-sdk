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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsAchievement extends Model {

    @JsonProperty("AchievementCode")
    private String achievementCode;

    @JsonProperty("CreatedAt")
    private String createdAt;

    @JsonProperty("DefaultLanguage")
    private String defaultLanguage;

    @JsonProperty("Description")
    private Map<String, String> description;

    @JsonProperty("GoalValue")
    private Float goalValue;

    @JsonProperty("Hidden")
    private Boolean hidden;

    @JsonProperty("ID")
    private String id;

    @JsonProperty("Incremental")
    private Boolean incremental;

    @JsonProperty("ListOrder")
    private Integer listOrder;

    @JsonProperty("LockedIcons")
    private List<ModelsIcon> lockedIcons;

    @JsonProperty("Name")
    private Map<String, String> name;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("StatCode")
    private String statCode;

    @JsonProperty("Tags")
    private List<String> tags;

    @JsonProperty("UnlockedIcons")
    private List<ModelsIcon> unlockedIcons;

    @JsonProperty("UpdatedAt")
    private String updatedAt;



    @JsonIgnore
    public ModelsAchievement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAchievement> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAchievement>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AchievementCode", "achievementCode");
        result.put("CreatedAt", "createdAt");
        result.put("DefaultLanguage", "defaultLanguage");
        result.put("Description", "description");
        result.put("GoalValue", "goalValue");
        result.put("Hidden", "hidden");
        result.put("ID", "id");
        result.put("Incremental", "incremental");
        result.put("ListOrder", "listOrder");
        result.put("LockedIcons", "lockedIcons");
        result.put("Name", "name");
        result.put("Namespace", "namespace");
        result.put("StatCode", "statCode");
        result.put("Tags", "tags");
        result.put("UnlockedIcons", "unlockedIcons");
        result.put("UpdatedAt", "updatedAt");
        return result;
    }
    
    public static class ModelsAchievementBuilder {
        
    }
}
package net.accelbyte.sdk.api.achievement.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ModelsAchievement extends Model {

    @JsonProperty("AchievementCode")
    String achievementCode;
    @JsonProperty("CreatedAt")
    String createdAt;
    @JsonProperty("DefaultLanguage")
    String defaultLanguage;
    @JsonProperty("Description")
    Map<String, String> description;
    @JsonProperty("GoalValue")
    Float goalValue;
    @JsonProperty("Hidden")
    Boolean hidden;
    @JsonProperty("ID")
    String id;
    @JsonProperty("Incremental")
    Boolean incremental;
    @JsonProperty("ListOrder")
    Integer listOrder;
    @JsonProperty("LockedIcons")
    List<ModelsIcon> lockedIcons;
    @JsonProperty("Name")
    Map<String, String> name;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("StatCode")
    String statCode;
    @JsonProperty("Tags")
    List<String> tags;
    @JsonProperty("UnlockedIcons")
    List<ModelsIcon> unlockedIcons;
    @JsonProperty("UpdatedAt")
    String updatedAt;

    public ModelsAchievement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
}
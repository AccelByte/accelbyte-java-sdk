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
public class ModelsAchievementResponse extends Model {

    @JsonProperty("achievementCode")
    String achievementCode;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("defaultLanguage")
    String defaultLanguage;
    @JsonProperty("description")
    Map<String, String> description;
    @JsonProperty("goalValue")
    Float goalValue;
    @JsonProperty("hidden")
    Boolean hidden;
    @JsonProperty("incremental")
    Boolean incremental;
    @JsonProperty("listOrder")
    Integer listOrder;
    @JsonProperty("lockedIcons")
    List<ModelsIcon> lockedIcons;
    @JsonProperty("name")
    Map<String, String> name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("unlockedIcons")
    List<ModelsIcon> unlockedIcons;
    @JsonProperty("updatedAt")
    String updatedAt;

    public ModelsAchievementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievementCode", "achievementCode");
        result.put("createdAt", "createdAt");
        result.put("defaultLanguage", "defaultLanguage");
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
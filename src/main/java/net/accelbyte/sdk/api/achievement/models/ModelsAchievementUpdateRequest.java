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
public class ModelsAchievementUpdateRequest extends Model {

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
    @JsonProperty("lockedIcons")
    List<ModelsIcon> lockedIcons;
    @JsonProperty("name")
    Map<String, String> name;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("unlockedIcons")
    List<ModelsIcon> unlockedIcons;

    public ModelsAchievementUpdateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
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
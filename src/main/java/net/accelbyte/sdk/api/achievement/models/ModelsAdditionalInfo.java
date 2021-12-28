package net.accelbyte.sdk.api.achievement.models;

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
public class ModelsAdditionalInfo extends Model {

    @JsonProperty("numberOfAchievements")
    private Integer numberOfAchievements;

    @JsonProperty("numberOfHiddenAchievements")
    private Integer numberOfHiddenAchievements;

    @JsonProperty("numberOfVisibleAchievements")
    private Integer numberOfVisibleAchievements;

    public ModelsAdditionalInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsAdditionalInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAdditionalInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("numberOfAchievements", "numberOfAchievements");
        result.put("numberOfHiddenAchievements", "numberOfHiddenAchievements");
        result.put("numberOfVisibleAchievements", "numberOfVisibleAchievements");
        return result;
    }
}
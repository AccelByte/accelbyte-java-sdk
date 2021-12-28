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
public class ModelsUserAchievementResponse extends Model {

    @JsonProperty("achievedAt")
    private String achievedAt;

    @JsonProperty("achievementCode")
    private String achievementCode;

    @JsonProperty("id")
    private String id;

    @JsonProperty("latestValue")
    private Float latestValue;

    @JsonProperty("name")
    private Map<String, String> name;

    @JsonProperty("status")
    private Integer status;

    public ModelsUserAchievementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUserAchievementResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserAchievementResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievedAt", "achievedAt");
        result.put("achievementCode", "achievementCode");
        result.put("id", "id");
        result.put("latestValue", "latestValue");
        result.put("name", "name");
        result.put("status", "status");
        return result;
    }
}
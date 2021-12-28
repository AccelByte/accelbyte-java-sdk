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
public class ModelsPaginatedUserAchievementResponse extends Model {

    @JsonProperty("countInfo")
    private ModelsAdditionalInfo countInfo;

    @JsonProperty("data")
    private List<ModelsUserAchievementResponse> data;

    @JsonProperty("paging")
    private ModelsPagination paging;

    public ModelsPaginatedUserAchievementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsPaginatedUserAchievementResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPaginatedUserAchievementResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countInfo", "countInfo");
        result.put("data", "data");
        result.put("paging", "paging");
        return result;
    }
}
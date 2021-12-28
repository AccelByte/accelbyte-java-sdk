package net.accelbyte.sdk.api.leaderboard.models;

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
public class ModelsUserRankingResponse extends Model {

    @JsonProperty("allTime")
    private ModelsUserRankingResponseDetail allTime;

    @JsonProperty("current")
    private ModelsUserRankingResponseDetail current;

    @JsonProperty("daily")
    private ModelsUserRankingResponseDetail daily;

    @JsonProperty("monthly")
    private ModelsUserRankingResponseDetail monthly;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("weekly")
    private ModelsUserRankingResponseDetail weekly;

    public ModelsUserRankingResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUserRankingResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserRankingResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allTime", "allTime");
        result.put("current", "current");
        result.put("daily", "daily");
        result.put("monthly", "monthly");
        result.put("userId", "userId");
        result.put("weekly", "weekly");
        return result;
    }
}
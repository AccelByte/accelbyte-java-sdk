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
public class ModelsUserLeaderboardRanking extends Model {

    @JsonProperty("allTime")
    private ModelsUserRankingResponseDetail allTime;

    @JsonProperty("current")
    private ModelsUserRankingResponseDetail current;

    @JsonProperty("daily")
    private ModelsUserRankingResponseDetail daily;

    @JsonProperty("leaderboardCode")
    private String leaderboardCode;

    @JsonProperty("leaderboardName")
    private String leaderboardName;

    @JsonProperty("monthly")
    private ModelsUserRankingResponseDetail monthly;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("weekly")
    private ModelsUserRankingResponseDetail weekly;

    public ModelsUserLeaderboardRanking createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUserLeaderboardRanking> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserLeaderboardRanking>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allTime", "allTime");
        result.put("current", "current");
        result.put("daily", "daily");
        result.put("leaderboardCode", "leaderboardCode");
        result.put("leaderboardName", "leaderboardName");
        result.put("monthly", "monthly");
        result.put("userId", "userId");
        result.put("weekly", "weekly");
        return result;
    }
}
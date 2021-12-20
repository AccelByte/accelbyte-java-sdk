package net.accelbyte.sdk.api.leaderboard.models;

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
public class ModelsUserLeaderboardRanking extends Model {

    @JsonProperty("allTime")
    ModelsUserRankingResponseDetail allTime;
    @JsonProperty("current")
    ModelsUserRankingResponseDetail current;
    @JsonProperty("daily")
    ModelsUserRankingResponseDetail daily;
    @JsonProperty("leaderboardCode")
    String leaderboardCode;
    @JsonProperty("leaderboardName")
    String leaderboardName;
    @JsonProperty("monthly")
    ModelsUserRankingResponseDetail monthly;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("weekly")
    ModelsUserRankingResponseDetail weekly;

    public ModelsUserLeaderboardRanking createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
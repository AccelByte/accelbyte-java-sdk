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
public class ModelsGetLeaderboardConfigResp extends Model {

    @JsonProperty("daily")
    ModelsDailyConfig daily;
    @JsonProperty("deletedAt")
    String deletedAt;
    @JsonProperty("descending")
    Boolean descending;
    @JsonProperty("iconURL")
    String iconURL;
    @JsonProperty("isArchived")
    Boolean isArchived;
    @JsonProperty("isDeleted")
    Boolean isDeleted;
    @JsonProperty("leaderboardCode")
    String leaderboardCode;
    @JsonProperty("monthly")
    ModelsMonthlyConfig monthly;
    @JsonProperty("name")
    String name;
    @JsonProperty("seasonPeriod")
    Integer seasonPeriod;
    @JsonProperty("startTime")
    String startTime;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("weekly")
    ModelsWeeklyConfig weekly;

    public ModelsGetLeaderboardConfigResp createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("daily", "daily");
        result.put("deletedAt", "deletedAt");
        result.put("descending", "descending");
        result.put("iconURL", "iconURL");
        result.put("isArchived", "isArchived");
        result.put("isDeleted", "isDeleted");
        result.put("leaderboardCode", "leaderboardCode");
        result.put("monthly", "monthly");
        result.put("name", "name");
        result.put("seasonPeriod", "seasonPeriod");
        result.put("startTime", "startTime");
        result.put("statCode", "statCode");
        result.put("weekly", "weekly");
        return result;
    }
}
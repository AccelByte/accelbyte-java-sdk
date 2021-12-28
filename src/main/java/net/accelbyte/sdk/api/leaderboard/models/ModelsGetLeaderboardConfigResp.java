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
public class ModelsGetLeaderboardConfigResp extends Model {

    @JsonProperty("daily")
    private ModelsDailyConfig daily;

    @JsonProperty("deletedAt")
    private String deletedAt;

    @JsonProperty("descending")
    private Boolean descending;

    @JsonProperty("iconURL")
    private String iconURL;

    @JsonProperty("isArchived")
    private Boolean isArchived;

    @JsonProperty("isDeleted")
    private Boolean isDeleted;

    @JsonProperty("leaderboardCode")
    private String leaderboardCode;

    @JsonProperty("monthly")
    private ModelsMonthlyConfig monthly;

    @JsonProperty("name")
    private String name;

    @JsonProperty("seasonPeriod")
    private Integer seasonPeriod;

    @JsonProperty("startTime")
    private String startTime;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("weekly")
    private ModelsWeeklyConfig weekly;

    public ModelsGetLeaderboardConfigResp createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsGetLeaderboardConfigResp> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGetLeaderboardConfigResp>>() {});
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
package net.accelbyte.sdk.api.seasonpass.models;

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
public class ListUserSeasonInfo extends Model {

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("enrolledAt")
    private String enrolledAt;

    @JsonProperty("currentTierIndex")
    private Integer currentTierIndex;

    @JsonProperty("lastTierIndex")
    private Integer lastTierIndex;

    @JsonProperty("cleared")
    private Boolean cleared;

    @JsonProperty("season")
    private SeasonSummary season;

    public ListUserSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ListUserSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ListUserSeasonInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        result.put("seasonId", "seasonId");
        result.put("enrolledAt", "enrolledAt");
        result.put("currentTierIndex", "currentTierIndex");
        result.put("lastTierIndex", "lastTierIndex");
        result.put("cleared", "cleared");
        result.put("season", "season");
        return result;
    }
}
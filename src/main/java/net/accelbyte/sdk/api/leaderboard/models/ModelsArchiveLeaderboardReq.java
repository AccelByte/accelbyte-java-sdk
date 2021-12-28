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
public class ModelsArchiveLeaderboardReq extends Model {

    @JsonProperty("leaderboardCodes")
    private List<String> leaderboardCodes;

    @JsonProperty("limit")
    private Integer limit;

    @JsonProperty("slug")
    private String slug;

    public ModelsArchiveLeaderboardReq createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsArchiveLeaderboardReq> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsArchiveLeaderboardReq>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("leaderboardCodes", "leaderboardCodes");
        result.put("limit", "limit");
        result.put("slug", "slug");
        return result;
    }
}
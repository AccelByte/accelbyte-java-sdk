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
public class ModelsUserRankingResponseDetail extends Model {

    @JsonProperty("additionalData")
    private Map<String, ?> additionalData;

    @JsonProperty("hidden")
    private Boolean hidden;

    @JsonProperty("point")
    private Float point;

    @JsonProperty("rank")
    private Integer rank;

    public ModelsUserRankingResponseDetail createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUserRankingResponseDetail> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserRankingResponseDetail>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("hidden", "hidden");
        result.put("point", "point");
        result.put("rank", "rank");
        return result;
    }
}
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
public class ModelsGetLeaderboardConfigPublicResp extends Model {

    @JsonProperty("iconURL")
    private String iconURL;

    @JsonProperty("leaderboardCode")
    private String leaderboardCode;

    @JsonProperty("name")
    private String name;

    @JsonProperty("statCode")
    private String statCode;

    public ModelsGetLeaderboardConfigPublicResp createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsGetLeaderboardConfigPublicResp> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGetLeaderboardConfigPublicResp>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("iconURL", "iconURL");
        result.put("leaderboardCode", "leaderboardCode");
        result.put("name", "name");
        result.put("statCode", "statCode");
        return result;
    }
}
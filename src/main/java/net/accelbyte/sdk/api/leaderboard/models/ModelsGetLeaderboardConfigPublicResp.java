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
public class ModelsGetLeaderboardConfigPublicResp extends Model {

    @JsonProperty("iconURL")
    String iconURL;
    @JsonProperty("leaderboardCode")
    String leaderboardCode;
    @JsonProperty("name")
    String name;
    @JsonProperty("statCode")
    String statCode;

    public ModelsGetLeaderboardConfigPublicResp createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
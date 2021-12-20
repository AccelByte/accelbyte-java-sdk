package net.accelbyte.sdk.api.dslogmanager.models;

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
public class ModelsMatchResult extends Model {

    @JsonProperty("game_mode")
    String gameMode;
    @JsonProperty("matching_allies")
    List<ModelsRequestMatchingAlly> matchingAllies;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("session_id")
    String sessionId;

    public ModelsMatchResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("game_mode", "gameMode");
        result.put("matching_allies", "matchingAllies");
        result.put("namespace", "namespace");
        result.put("session_id", "sessionId");
        return result;
    }
}
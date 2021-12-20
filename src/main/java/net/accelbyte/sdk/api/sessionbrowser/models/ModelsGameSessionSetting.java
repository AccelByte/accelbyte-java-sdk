package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsGameSessionSetting extends Model {

    @JsonProperty("allow_join_in_progress")
    Boolean allowJoinInProgress;
    @JsonProperty("current_internal_player")
    Integer currentInternalPlayer;
    @JsonProperty("current_player")
    Integer currentPlayer;
    @JsonProperty("map_name")
    String mapName;
    @JsonProperty("max_internal_player")
    Integer maxInternalPlayer;
    @JsonProperty("max_player")
    Integer maxPlayer;
    @JsonProperty("mode")
    String mode;
    @JsonProperty("num_bot")
    Integer numBot;
    @JsonProperty("password")
    String password;
    @JsonProperty("settings")
    Map<String, ?> settings;

    public ModelsGameSessionSetting createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allow_join_in_progress", "allowJoinInProgress");
        result.put("current_internal_player", "currentInternalPlayer");
        result.put("current_player", "currentPlayer");
        result.put("map_name", "mapName");
        result.put("max_internal_player", "maxInternalPlayer");
        result.put("max_player", "maxPlayer");
        result.put("mode", "mode");
        result.put("num_bot", "numBot");
        result.put("password", "password");
        result.put("settings", "settings");
        return result;
    }
}
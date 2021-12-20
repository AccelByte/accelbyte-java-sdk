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
public class ModelsCustomGameResponse extends Model {

    @JsonProperty("all_players")
    List<String> allPlayers;
    @JsonProperty("created_at")
    String createdAt;
    @JsonProperty("game_session_setting")
    ModelsGameSessionSetting gameSessionSetting;
    @JsonProperty("joinable")
    Boolean joinable;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("players")
    List<String> players;
    @JsonProperty("server")
    ModelsServer server;
    @JsonProperty("session_id")
    String sessionId;
    @JsonProperty("session_type")
    String sessionType;
    @JsonProperty("spectators")
    List<String> spectators;

    public ModelsCustomGameResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("all_players", "allPlayers");
        result.put("created_at", "createdAt");
        result.put("game_session_setting", "gameSessionSetting");
        result.put("joinable", "joinable");
        result.put("namespace", "namespace");
        result.put("players", "players");
        result.put("server", "server");
        result.put("session_id", "sessionId");
        result.put("session_type", "sessionType");
        result.put("spectators", "spectators");
        return result;
    }
}
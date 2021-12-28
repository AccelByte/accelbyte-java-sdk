package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsGameSession extends Model {

    @JsonProperty("all_players")
    private List<String> allPlayers;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("game_session_setting")
    private ModelsGameSessionSetting gameSessionSetting;

    @JsonProperty("game_version")
    private String gameVersion;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("match")
    private ModelsMatchMaking match;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("players")
    private List<String> players;

    @JsonProperty("server")
    private ModelsServer server;

    @JsonProperty("session_id")
    private String sessionId;

    @JsonProperty("session_type")
    private String sessionType;

    @JsonProperty("spectators")
    private List<String> spectators;

    @JsonProperty("user_id")
    private String userId;

    @JsonProperty("username")
    private String username;

    public ModelsGameSession createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsGameSession> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGameSession>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("all_players", "allPlayers");
        result.put("created_at", "createdAt");
        result.put("game_session_setting", "gameSessionSetting");
        result.put("game_version", "gameVersion");
        result.put("joinable", "joinable");
        result.put("match", "match");
        result.put("namespace", "namespace");
        result.put("players", "players");
        result.put("server", "server");
        result.put("session_id", "sessionId");
        result.put("session_type", "sessionType");
        result.put("spectators", "spectators");
        result.put("user_id", "userId");
        result.put("username", "username");
        return result;
    }
}
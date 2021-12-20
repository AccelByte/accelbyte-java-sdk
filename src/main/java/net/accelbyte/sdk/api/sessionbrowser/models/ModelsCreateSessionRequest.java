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
public class ModelsCreateSessionRequest extends Model {

    @JsonProperty("game_session_setting")
    ModelsGameSessionSetting gameSessionSetting;
    @JsonProperty("game_version")
    String gameVersion;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("session_type")
    String sessionType;
    @JsonProperty("username")
    String username;

    public ModelsCreateSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("game_session_setting", "gameSessionSetting");
        result.put("game_version", "gameVersion");
        result.put("namespace", "namespace");
        result.put("session_type", "sessionType");
        result.put("username", "username");
        return result;
    }
}
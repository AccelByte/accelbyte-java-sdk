package net.accelbyte.sdk.api.dsmc.models;

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

    @JsonProperty("client_version")
    String clientVersion;
    @JsonProperty("configuration")
    String configuration;
    @JsonProperty("deployment")
    String deployment;
    @JsonProperty("game_mode")
    String gameMode;
    @JsonProperty("matching_allies")
    List<ModelsRequestMatchingAlly> matchingAllies;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("pod_name")
    String podName;
    @JsonProperty("region")
    String region;
    @JsonProperty("session_id")
    String sessionId;

    public ModelsCreateSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("client_version", "clientVersion");
        result.put("configuration", "configuration");
        result.put("deployment", "deployment");
        result.put("game_mode", "gameMode");
        result.put("matching_allies", "matchingAllies");
        result.put("namespace", "namespace");
        result.put("pod_name", "podName");
        result.put("region", "region");
        result.put("session_id", "sessionId");
        return result;
    }
}
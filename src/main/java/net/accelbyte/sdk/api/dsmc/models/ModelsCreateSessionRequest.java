package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsCreateSessionRequest extends Model {

    @JsonProperty("client_version")
    private String clientVersion;

    @JsonProperty("configuration")
    private String configuration;

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("game_mode")
    private String gameMode;

    @JsonProperty("matching_allies")
    private List<ModelsRequestMatchingAlly> matchingAllies;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("pod_name")
    private String podName;

    @JsonProperty("region")
    private String region;

    @JsonProperty("session_id")
    private String sessionId;

    public ModelsCreateSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsCreateSessionRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateSessionRequest>>() {});
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
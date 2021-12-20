package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsCreateChannelResponse extends Model {

    @JsonProperty("deployment")
    String deployment;
    @JsonProperty("description")
    String description;
    @JsonProperty("find_match_timeout_seconds")
    Integer findMatchTimeoutSeconds;
    @JsonProperty("game_mode")
    String gameMode;
    @JsonProperty("joinable")
    Boolean joinable;
    @JsonProperty("max_delay_ms")
    Integer maxDelayMs;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("ruleset")
    ModelsRuleSet ruleset;
    @JsonProperty("session_queue_timeout_seconds")
    Integer sessionQueueTimeoutSeconds;
    @JsonProperty("slug")
    String slug;
    @JsonProperty("social_matchmaking")
    Boolean socialMatchmaking;
    @JsonProperty("updated_at")
    String updatedAt;
    @JsonProperty("use_sub_gamemode")
    Boolean useSubGamemode;

    public ModelsCreateChannelResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("deployment", "deployment");
        result.put("description", "description");
        result.put("find_match_timeout_seconds", "findMatchTimeoutSeconds");
        result.put("game_mode", "gameMode");
        result.put("joinable", "joinable");
        result.put("max_delay_ms", "maxDelayMs");
        result.put("namespace", "namespace");
        result.put("ruleset", "ruleset");
        result.put("session_queue_timeout_seconds", "sessionQueueTimeoutSeconds");
        result.put("slug", "slug");
        result.put("social_matchmaking", "socialMatchmaking");
        result.put("updated_at", "updatedAt");
        result.put("use_sub_gamemode", "useSubGamemode");
        return result;
    }
}
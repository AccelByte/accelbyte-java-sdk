package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsChannelRequest extends Model {

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("description")
    private String description;

    @JsonProperty("find_match_timeout_seconds")
    private Integer findMatchTimeoutSeconds;

    @JsonProperty("game_mode")
    private String gameMode;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("max_delay_ms")
    private Integer maxDelayMs;

    @JsonProperty("rule_set")
    private ModelsRuleSet ruleSet;

    @JsonProperty("session_queue_timeout_seconds")
    private Integer sessionQueueTimeoutSeconds;

    @JsonProperty("social_matchmaking")
    private Boolean socialMatchmaking;

    @JsonProperty("use_sub_gamemode")
    private Boolean useSubGamemode;

    public ModelsChannelRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsChannelRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChannelRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("deployment", "deployment");
        result.put("description", "description");
        result.put("find_match_timeout_seconds", "findMatchTimeoutSeconds");
        result.put("game_mode", "gameMode");
        result.put("joinable", "joinable");
        result.put("max_delay_ms", "maxDelayMs");
        result.put("rule_set", "ruleSet");
        result.put("session_queue_timeout_seconds", "sessionQueueTimeoutSeconds");
        result.put("social_matchmaking", "socialMatchmaking");
        result.put("use_sub_gamemode", "useSubGamemode");
        return result;
    }
}
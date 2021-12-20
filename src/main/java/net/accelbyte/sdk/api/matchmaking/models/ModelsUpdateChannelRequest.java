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
public class ModelsUpdateChannelRequest extends Model {

    @JsonProperty("deployment")
    String deployment;
    @JsonProperty("description")
    String description;
    @JsonProperty("findMatchTimeoutSeconds")
    Integer findMatchTimeoutSeconds;
    @JsonProperty("joinable")
    Boolean joinable;
    @JsonProperty("max_delay_ms")
    Integer maxDelayMs;
    @JsonProperty("ruleSet")
    ModelsUpdateRuleset ruleSet;
    @JsonProperty("sessionQueueTimeoutSeconds")
    Integer sessionQueueTimeoutSeconds;
    @JsonProperty("socialMatchmaking")
    Boolean socialMatchmaking;
    @JsonProperty("use_sub_gamemode")
    Boolean useSubGamemode;

    public ModelsUpdateChannelRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("deployment", "deployment");
        result.put("description", "description");
        result.put("findMatchTimeoutSeconds", "findMatchTimeoutSeconds");
        result.put("joinable", "joinable");
        result.put("max_delay_ms", "maxDelayMs");
        result.put("ruleSet", "ruleSet");
        result.put("sessionQueueTimeoutSeconds", "sessionQueueTimeoutSeconds");
        result.put("socialMatchmaking", "socialMatchmaking");
        result.put("use_sub_gamemode", "useSubGamemode");
        return result;
    }
}
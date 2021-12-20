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
public class ModelsChannelV1 extends Model {

    @JsonProperty("deployment")
    String deployment;
    @JsonProperty("description")
    String description;
    @JsonProperty("findMatchTimeoutSeconds")
    Integer findMatchTimeoutSeconds;
    @JsonProperty("gameMode")
    String gameMode;
    @JsonProperty("joinable")
    Boolean joinable;
    @JsonProperty("max_delay_ms")
    Integer maxDelayMs;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("ruleSet")
    ModelsRuleSetV1 ruleSet;
    @JsonProperty("sessionQueueTimeoutSeconds")
    Integer sessionQueueTimeoutSeconds;
    @JsonProperty("slug")
    String slug;
    @JsonProperty("socialMatchmaking")
    Boolean socialMatchmaking;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("use_sub_gamemode")
    Boolean useSubGamemode;

    public ModelsChannelV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("deployment", "deployment");
        result.put("description", "description");
        result.put("findMatchTimeoutSeconds", "findMatchTimeoutSeconds");
        result.put("gameMode", "gameMode");
        result.put("joinable", "joinable");
        result.put("max_delay_ms", "maxDelayMs");
        result.put("namespace", "namespace");
        result.put("ruleSet", "ruleSet");
        result.put("sessionQueueTimeoutSeconds", "sessionQueueTimeoutSeconds");
        result.put("slug", "slug");
        result.put("socialMatchmaking", "socialMatchmaking");
        result.put("updatedAt", "updatedAt");
        result.put("use_sub_gamemode", "useSubGamemode");
        return result;
    }
}
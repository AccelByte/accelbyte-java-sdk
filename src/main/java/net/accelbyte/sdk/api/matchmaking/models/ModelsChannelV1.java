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
public class ModelsChannelV1 extends Model {

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("description")
    private String description;

    @JsonProperty("findMatchTimeoutSeconds")
    private Integer findMatchTimeoutSeconds;

    @JsonProperty("gameMode")
    private String gameMode;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("max_delay_ms")
    private Integer maxDelayMs;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("ruleSet")
    private ModelsRuleSetV1 ruleSet;

    @JsonProperty("sessionQueueTimeoutSeconds")
    private Integer sessionQueueTimeoutSeconds;

    @JsonProperty("slug")
    private String slug;

    @JsonProperty("socialMatchmaking")
    private Boolean socialMatchmaking;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("use_sub_gamemode")
    private Boolean useSubGamemode;

    public ModelsChannelV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsChannelV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChannelV1>>() {});
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
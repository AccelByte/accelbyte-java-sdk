package net.accelbyte.sdk.api.sessionbrowser.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModelsMatchMaking extends Model {

    @JsonProperty("channel")
    private String channel;

    @JsonProperty("client_version")
    private String clientVersion;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("event")
    private String event;

    @JsonProperty("game_mode")
    private String gameMode;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("match_id")
    private String matchId;

    @JsonProperty("matching_allies")
    private List<ModelsMatchingAlly> matchingAllies;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("party_attributes")
    private Map<String, ?> partyAttributes;

    @JsonProperty("party_id")
    private String partyId;

    @JsonProperty("queued_at")
    private Integer queuedAt;

    @JsonProperty("region")
    private String region;

    @JsonProperty("server_name")
    private String serverName;

    @JsonProperty("status")
    private String status;

    @JsonIgnore
    public ModelsMatchMaking createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsMatchMaking> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatchMaking>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channel", "channel");
        result.put("client_version", "clientVersion");
        result.put("created_at", "createdAt");
        result.put("deployment", "deployment");
        result.put("event", "event");
        result.put("game_mode", "gameMode");
        result.put("joinable", "joinable");
        result.put("match_id", "matchId");
        result.put("matching_allies", "matchingAllies");
        result.put("namespace", "namespace");
        result.put("party_attributes", "partyAttributes");
        result.put("party_id", "partyId");
        result.put("queued_at", "queuedAt");
        result.put("region", "region");
        result.put("server_name", "serverName");
        result.put("status", "status");
        return result;
    }
}
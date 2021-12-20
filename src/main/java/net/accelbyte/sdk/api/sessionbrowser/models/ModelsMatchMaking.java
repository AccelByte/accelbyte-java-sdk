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
public class ModelsMatchMaking extends Model {

    @JsonProperty("channel")
    String channel;
    @JsonProperty("client_version")
    String clientVersion;
    @JsonProperty("created_at")
    String createdAt;
    @JsonProperty("deployment")
    String deployment;
    @JsonProperty("event")
    String event;
    @JsonProperty("game_mode")
    String gameMode;
    @JsonProperty("joinable")
    Boolean joinable;
    @JsonProperty("match_id")
    String matchId;
    @JsonProperty("matching_allies")
    List<ModelsMatchingAlly> matchingAllies;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("party_attributes")
    Map<String, ?> partyAttributes;
    @JsonProperty("party_id")
    String partyId;
    @JsonProperty("queued_at")
    Integer queuedAt;
    @JsonProperty("region")
    String region;
    @JsonProperty("server_name")
    String serverName;
    @JsonProperty("status")
    String status;

    public ModelsMatchMaking createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
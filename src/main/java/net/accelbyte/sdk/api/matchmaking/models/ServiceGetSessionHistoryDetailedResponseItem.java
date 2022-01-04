package net.accelbyte.sdk.api.matchmaking.models;

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
public class ServiceGetSessionHistoryDetailedResponseItem extends Model {

    @JsonProperty("_id")
    private String id;

    @JsonProperty("channel")
    private String channel;

    @JsonProperty("client_version")
    private String clientVersion;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("event_description")
    private String eventDescription;

    @JsonProperty("event_name")
    private String eventName;

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

    @JsonProperty("party_id")
    private String partyId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("server_name")
    private String serverName;

    @JsonProperty("status")
    private String status;

    @JsonIgnore
    public ServiceGetSessionHistoryDetailedResponseItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ServiceGetSessionHistoryDetailedResponseItem> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ServiceGetSessionHistoryDetailedResponseItem>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("_id", "id");
        result.put("channel", "channel");
        result.put("client_version", "clientVersion");
        result.put("created_at", "createdAt");
        result.put("event_description", "eventDescription");
        result.put("event_name", "eventName");
        result.put("game_mode", "gameMode");
        result.put("joinable", "joinable");
        result.put("match_id", "matchId");
        result.put("matching_allies", "matchingAllies");
        result.put("namespace", "namespace");
        result.put("party_id", "partyId");
        result.put("region", "region");
        result.put("server_name", "serverName");
        result.put("status", "status");
        return result;
    }
}
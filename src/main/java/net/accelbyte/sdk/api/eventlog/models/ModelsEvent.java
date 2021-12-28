package net.accelbyte.sdk.api.eventlog.models;

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
public class ModelsEvent extends Model {

    @JsonProperty("AgentType")
    private Integer agentType;

    @JsonProperty("ClientID")
    private String clientID;

    @JsonProperty("ComponentID")
    private Integer componentID;

    @JsonProperty("EventID")
    private Integer eventID;

    @JsonProperty("EventLevel")
    private Integer eventLevel;

    @JsonProperty("EventType")
    private Integer eventType;

    @JsonProperty("IPAddress")
    private String ipAddress;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("Realm")
    private String realm;

    @JsonProperty("TargetNamespace")
    private String targetNamespace;

    @JsonProperty("TargetUserID")
    private String targetUserID;

    @JsonProperty("Time")
    private String time;

    @JsonProperty("UX")
    private Integer ux;

    @JsonProperty("UserID")
    private String userID;

    public ModelsEvent createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsEvent> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsEvent>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AgentType", "agentType");
        result.put("ClientID", "clientID");
        result.put("ComponentID", "componentID");
        result.put("EventID", "eventID");
        result.put("EventLevel", "eventLevel");
        result.put("EventType", "eventType");
        result.put("IPAddress", "ipAddress");
        result.put("Namespace", "namespace");
        result.put("Realm", "realm");
        result.put("TargetNamespace", "targetNamespace");
        result.put("TargetUserID", "targetUserID");
        result.put("Time", "time");
        result.put("UX", "ux");
        result.put("UserID", "userID");
        return result;
    }
}
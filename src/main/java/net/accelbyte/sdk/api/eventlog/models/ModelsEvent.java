package net.accelbyte.sdk.api.eventlog.models;

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
public class ModelsEvent extends Model {

    @JsonProperty("AgentType")
    Integer agentType;
    @JsonProperty("ClientID")
    String clientID;
    @JsonProperty("ComponentID")
    Integer componentID;
    @JsonProperty("EventID")
    Integer eventID;
    @JsonProperty("EventLevel")
    Integer eventLevel;
    @JsonProperty("EventType")
    Integer eventType;
    @JsonProperty("IPAddress")
    String ipAddress;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("Realm")
    String realm;
    @JsonProperty("TargetNamespace")
    String targetNamespace;
    @JsonProperty("TargetUserID")
    String targetUserID;
    @JsonProperty("Time")
    String time;
    @JsonProperty("UX")
    Integer ux;
    @JsonProperty("UserID")
    String userID;

    public ModelsEvent createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
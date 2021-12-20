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
public class ModelsEventV2 extends Model {

    @JsonProperty("clientId")
    String clientId;
    @JsonProperty("id")
    String id;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("payload")
    Map<String, ?> payload;
    @JsonProperty("sessionId")
    String sessionId;
    @JsonProperty("timestamp")
    String timestamp;
    @JsonProperty("traceId")
    String traceId;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("version")
    Integer version;

    public ModelsEventV2 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clientId", "clientId");
        result.put("id", "id");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("payload", "payload");
        result.put("sessionId", "sessionId");
        result.put("timestamp", "timestamp");
        result.put("traceId", "traceId");
        result.put("userId", "userId");
        result.put("version", "version");
        return result;
    }
}
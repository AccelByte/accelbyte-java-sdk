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
public class ModelsEventV2 extends Model {

    @JsonProperty("clientId")
    private String clientId;

    @JsonProperty("id")
    private String id;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("payload")
    private Map<String, ?> payload;

    @JsonProperty("sessionId")
    private String sessionId;

    @JsonProperty("timestamp")
    private String timestamp;

    @JsonProperty("traceId")
    private String traceId;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("version")
    private Integer version;

    public ModelsEventV2 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsEventV2> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsEventV2>>() {});
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
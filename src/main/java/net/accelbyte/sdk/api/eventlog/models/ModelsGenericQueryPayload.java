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
public class ModelsGenericQueryPayload extends Model {

    @JsonProperty("clientId")
    String clientId;
    @JsonProperty("eventName")
    String eventName;
    @JsonProperty("payloadQuery")
    Map<String, ?> payloadQuery;
    @JsonProperty("sessionId")
    String sessionId;
    @JsonProperty("traceId")
    String traceId;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("version")
    Integer version;

    public ModelsGenericQueryPayload createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clientId", "clientId");
        result.put("eventName", "eventName");
        result.put("payloadQuery", "payloadQuery");
        result.put("sessionId", "sessionId");
        result.put("traceId", "traceId");
        result.put("userId", "userId");
        result.put("version", "version");
        return result;
    }
}
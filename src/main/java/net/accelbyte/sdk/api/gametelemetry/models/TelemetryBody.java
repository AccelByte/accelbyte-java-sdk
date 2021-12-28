package net.accelbyte.sdk.api.gametelemetry.models;

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
public class TelemetryBody extends Model {

    @JsonProperty("EventId")
    String eventId;
    @JsonProperty("EventName")
    String eventName;
    @JsonProperty("EventNamespace")
    String eventNamespace;
    @JsonProperty("EventTimestamp")
    String eventTimestamp;
    @JsonProperty("Payload")
    Map<String, ?> payload;

    public TelemetryBody createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("EventId", "eventId");
        result.put("EventName", "eventName");
        result.put("EventNamespace", "eventNamespace");
        result.put("EventTimestamp", "eventTimestamp");
        result.put("Payload", "payload");
        return result;
    }
}
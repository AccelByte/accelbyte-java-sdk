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
public class ModelsEventRegistry extends Model {

    @JsonProperty("EventID")
    Integer eventID;
    @JsonProperty("EventLevel")
    Integer eventLevel;
    @JsonProperty("EventType")
    Integer eventType;
    @JsonProperty("UX")
    Integer ux;

    public ModelsEventRegistry createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("EventID", "eventID");
        result.put("EventLevel", "eventLevel");
        result.put("EventType", "eventType");
        result.put("UX", "ux");
        return result;
    }
}
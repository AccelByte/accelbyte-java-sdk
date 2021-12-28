package net.accelbyte.sdk.api.platform.models;

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
public class NotificationProcessResult extends Model {

    @JsonProperty("code")
    String code;
    @JsonProperty("customParam")
    Map<String, ?> customParam;
    @JsonProperty("severity")
    Integer severity;
    @JsonProperty("status")
    String status;

    public NotificationProcessResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("customParam", "customParam");
        result.put("severity", "severity");
        result.put("status", "status");
        return result;
    }
}
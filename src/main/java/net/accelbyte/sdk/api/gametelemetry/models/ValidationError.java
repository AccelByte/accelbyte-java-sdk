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
public class ValidationError extends Model {

    @JsonProperty("loc")
    List<String> loc;
    @JsonProperty("msg")
    String msg;
    @JsonProperty("type")
    String type;

    public ValidationError createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("loc", "loc");
        result.put("msg", "msg");
        result.put("type", "type");
        return result;
    }
}
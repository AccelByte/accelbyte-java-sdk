package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class RestapiErrorResponseV2 extends Model {

    @JsonProperty("attributes")
    Map<String, String> attributes;
    @JsonProperty("errorCode")
    Integer errorCode;
    @JsonProperty("errorMessage")
    String errorMessage;
    @JsonProperty("message")
    String message;
    @JsonProperty("name")
    String name;

    public RestapiErrorResponseV2 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attributes", "attributes");
        result.put("errorCode", "errorCode");
        result.put("errorMessage", "errorMessage");
        result.put("message", "message");
        result.put("name", "name");
        return result;
    }
}
package net.accelbyte.sdk.api.seasonpass.models;

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
public class ErrorEntity extends Model {

    @JsonProperty("errorCode")
    Integer errorCode;
    @JsonProperty("errorMessage")
    String errorMessage;
    @JsonProperty("messageVariables")
    Map<String, String> messageVariables;
    @JsonProperty("devStackTrace")
    String devStackTrace;

    public ErrorEntity createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("errorCode", "errorCode");
        result.put("errorMessage", "errorMessage");
        result.put("messageVariables", "messageVariables");
        result.put("devStackTrace", "devStackTrace");
        return result;
    }
}
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
public class FieldValidationError extends Model {

    @JsonProperty("errorCode")
    String errorCode;
    @JsonProperty("errorField")
    String errorField;
    @JsonProperty("errorValue")
    String errorValue;
    @JsonProperty("errorMessage")
    String errorMessage;
    @JsonProperty("messageVariables")
    Map<String, String> messageVariables;

    public FieldValidationError createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("errorCode", "errorCode");
        result.put("errorField", "errorField");
        result.put("errorValue", "errorValue");
        result.put("errorMessage", "errorMessage");
        result.put("messageVariables", "messageVariables");
        return result;
    }
}
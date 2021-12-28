package net.accelbyte.sdk.api.legal.models;

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
public class FieldValidationError extends Model {

    @JsonProperty("errorCode")
    private String errorCode;

    @JsonProperty("errorField")
    private String errorField;

    @JsonProperty("errorMessage")
    private String errorMessage;

    @JsonProperty("errorValue")
    private String errorValue;

    @JsonProperty("messageVariables")
    private Map<String, String> messageVariables;

    public FieldValidationError createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<FieldValidationError> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FieldValidationError>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("errorCode", "errorCode");
        result.put("errorField", "errorField");
        result.put("errorMessage", "errorMessage");
        result.put("errorValue", "errorValue");
        result.put("messageVariables", "messageVariables");
        return result;
    }
}
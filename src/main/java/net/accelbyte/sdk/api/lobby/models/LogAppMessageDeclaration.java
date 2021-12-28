package net.accelbyte.sdk.api.lobby.models;

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
public class LogAppMessageDeclaration extends Model {

    @JsonProperty("Attributes")
    List<String> attributes;
    @JsonProperty("Code")
    String code;
    @JsonProperty("CodeName")
    String codeName;
    @JsonProperty("Section")
    String section;
    @JsonProperty("Service")
    String service;
    @JsonProperty("Text")
    String text;

    public LogAppMessageDeclaration createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Attributes", "attributes");
        result.put("Code", "code");
        result.put("CodeName", "codeName");
        result.put("Section", "section");
        result.put("Service", "service");
        result.put("Text", "text");
        return result;
    }
}
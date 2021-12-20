package net.accelbyte.sdk.api.social.models;

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
public class StatCreate extends Model {

    @JsonProperty("defaultValue")
    Float defaultValue;
    @JsonProperty("description")
    String description;
    @JsonProperty("incrementOnly")
    Boolean incrementOnly;
    @JsonProperty("maximum")
    Float maximum;
    @JsonProperty("minimum")
    Float minimum;
    @JsonProperty("name")
    String name;
    @JsonProperty("setAsGlobal")
    Boolean setAsGlobal;
    @JsonProperty("setBy")
    String setBy;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("tags")
    List<String> tags;

    public StatCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("defaultValue", "defaultValue");
        result.put("description", "description");
        result.put("incrementOnly", "incrementOnly");
        result.put("maximum", "maximum");
        result.put("minimum", "minimum");
        result.put("name", "name");
        result.put("setAsGlobal", "setAsGlobal");
        result.put("setBy", "setBy");
        result.put("statCode", "statCode");
        result.put("tags", "tags");
        return result;
    }
}
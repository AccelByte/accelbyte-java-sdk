package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsFlexingRule extends Model {

    @JsonProperty("attribute")
    String attribute;
    @JsonProperty("criteria")
    String criteria;
    @JsonProperty("duration")
    Integer duration;
    @JsonProperty("reference")
    Float reference;

    public ModelsFlexingRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attribute", "attribute");
        result.put("criteria", "criteria");
        result.put("duration", "duration");
        result.put("reference", "reference");
        return result;
    }
}
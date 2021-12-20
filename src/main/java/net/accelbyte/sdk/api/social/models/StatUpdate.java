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
public class StatUpdate extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("name")
    String name;
    @JsonProperty("tags")
    List<String> tags;

    public StatUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("name", "name");
        result.put("tags", "tags");
        return result;
    }
}
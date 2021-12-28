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
public class KeyGroupUpdate extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("name")
    String name;
    @JsonProperty("status")
    String status;
    @JsonProperty("tags")
    List<String> tags;

    public KeyGroupUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("name", "name");
        result.put("status", "status");
        result.put("tags", "tags");
        return result;
    }
}
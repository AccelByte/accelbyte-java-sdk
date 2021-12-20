package net.accelbyte.sdk.api.basic.models;

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
public class Action extends Model {

    @JsonProperty("color")
    String color;
    @JsonProperty("description")
    String description;
    @JsonProperty("duration")
    Integer duration;
    @JsonProperty("icon")
    String icon;
    @JsonProperty("id")
    Integer id;
    @JsonProperty("name")
    String name;
    @JsonProperty("priority")
    Integer priority;

    public Action createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("color", "color");
        result.put("description", "description");
        result.put("duration", "duration");
        result.put("icon", "icon");
        result.put("id", "id");
        result.put("name", "name");
        result.put("priority", "priority");
        return result;
    }
}
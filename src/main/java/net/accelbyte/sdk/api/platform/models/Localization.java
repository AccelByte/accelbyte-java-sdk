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
public class Localization extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("localExt")
    Map<String, ?> localExt;
    @JsonProperty("longDescription")
    String longDescription;
    @JsonProperty("title")
    String title;

    public Localization createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("localExt", "localExt");
        result.put("longDescription", "longDescription");
        result.put("title", "title");
        return result;
    }
}
package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsCreateContentRequest extends Model {

    @JsonProperty("name")
    private String name;

    @JsonProperty("payload")
    private String payload;

    @JsonProperty("preview")
    private String preview;

    @JsonProperty("subType")
    private String subType;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("type")
    private String type;

    public ModelsCreateContentRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsCreateContentRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateContentRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("name", "name");
        result.put("payload", "payload");
        result.put("preview", "preview");
        result.put("subType", "subType");
        result.put("tags", "tags");
        result.put("type", "type");
        return result;
    }
}
package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsCreateContentRequestS3 extends Model {

    @JsonProperty("contentType")
    String contentType;
    @JsonProperty("fileExtension")
    String fileExtension;
    @JsonProperty("name")
    String name;
    @JsonProperty("preview")
    String preview;
    @JsonProperty("subType")
    String subType;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("type")
    String type;

    public ModelsCreateContentRequestS3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("contentType", "contentType");
        result.put("fileExtension", "fileExtension");
        result.put("name", "name");
        result.put("preview", "preview");
        result.put("subType", "subType");
        result.put("tags", "tags");
        result.put("type", "type");
        return result;
    }
}
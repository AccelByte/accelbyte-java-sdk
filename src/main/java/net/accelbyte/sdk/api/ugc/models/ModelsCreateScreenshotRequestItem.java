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
public class ModelsCreateScreenshotRequestItem extends Model {

    @JsonProperty("contentType")
    String contentType;
    @JsonProperty("description")
    String description;
    @JsonProperty("fileExtension")
    String fileExtension;

    public ModelsCreateScreenshotRequestItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("contentType", "contentType");
        result.put("description", "description");
        result.put("fileExtension", "fileExtension");
        return result;
    }
}
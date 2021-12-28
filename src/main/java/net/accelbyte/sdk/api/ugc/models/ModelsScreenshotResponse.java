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
public class ModelsScreenshotResponse extends Model {

    @JsonProperty("contentType")
    private String contentType;

    @JsonProperty("description")
    private String description;

    @JsonProperty("fileExtension")
    private String fileExtension;

    @JsonProperty("screenshotId")
    private String screenshotId;

    @JsonProperty("source")
    private String source;

    @JsonProperty("url")
    private String url;

    public ModelsScreenshotResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsScreenshotResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsScreenshotResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("contentType", "contentType");
        result.put("description", "description");
        result.put("fileExtension", "fileExtension");
        result.put("screenshotId", "screenshotId");
        result.put("source", "source");
        result.put("url", "url");
        return result;
    }
}
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
public class Slide extends Model {

    @JsonProperty("alt")
    String alt;
    @JsonProperty("previewUrl")
    String previewUrl;
    @JsonProperty("thumbnailUrl")
    String thumbnailUrl;
    @JsonProperty("type")
    String type;
    @JsonProperty("url")
    String url;
    @JsonProperty("videoSource")
    String videoSource;

    public Slide createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("alt", "alt");
        result.put("previewUrl", "previewUrl");
        result.put("thumbnailUrl", "thumbnailUrl");
        result.put("type", "type");
        result.put("url", "url");
        result.put("videoSource", "videoSource");
        return result;
    }
}
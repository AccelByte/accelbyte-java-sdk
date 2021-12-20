package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsCreateImageRequest extends Model {

    @JsonProperty("artifactPath")
    String artifactPath;
    @JsonProperty("dockerPath")
    String dockerPath;
    @JsonProperty("image")
    String image;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("persistent")
    Boolean persistent;
    @JsonProperty("version")
    String version;

    public ModelsCreateImageRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("artifactPath", "artifactPath");
        result.put("dockerPath", "dockerPath");
        result.put("image", "image");
        result.put("namespace", "namespace");
        result.put("persistent", "persistent");
        result.put("version", "version");
        return result;
    }
}
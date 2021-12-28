package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsImageRecordUpdate extends Model {

    @JsonProperty("artifactPath")
    private String artifactPath;

    @JsonProperty("image")
    private String image;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("persistent")
    private Boolean persistent;

    @JsonProperty("version")
    private String version;

    public ModelsImageRecordUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsImageRecordUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsImageRecordUpdate>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("artifactPath", "artifactPath");
        result.put("image", "image");
        result.put("namespace", "namespace");
        result.put("persistent", "persistent");
        result.put("version", "version");
        return result;
    }
}
package net.accelbyte.sdk.api.lobby.models;

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
public class ModelCreateTemplateRequest extends Model {

    @JsonProperty("templateContent")
    private String templateContent;

    @JsonProperty("templateLanguage")
    private String templateLanguage;

    @JsonProperty("templateSlug")
    private String templateSlug;

    public ModelCreateTemplateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelCreateTemplateRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelCreateTemplateRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("templateContent", "templateContent");
        result.put("templateLanguage", "templateLanguage");
        result.put("templateSlug", "templateSlug");
        return result;
    }
}
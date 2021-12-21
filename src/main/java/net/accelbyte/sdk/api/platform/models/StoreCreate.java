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
public class StoreCreate extends Model {

    @JsonProperty("defaultLanguage")
    String defaultLanguage;
    @JsonProperty("defaultRegion")
    String defaultRegion;
    @JsonProperty("description")
    String description;
    @JsonProperty("supportedLanguages")
    List<String> supportedLanguages;
    @JsonProperty("supportedRegions")
    List<String> supportedRegions;
    @JsonProperty("title")
    String title;

    public StoreCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("defaultLanguage", "defaultLanguage");
        result.put("defaultRegion", "defaultRegion");
        result.put("description", "description");
        result.put("supportedLanguages", "supportedLanguages");
        result.put("supportedRegions", "supportedRegions");
        result.put("title", "title");
        return result;
    }
}
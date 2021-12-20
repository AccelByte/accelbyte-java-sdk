package net.accelbyte.sdk.api.lobby.models;

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
public class ModelLocalization extends Model {

    @JsonProperty("lastDraftAt")
    String lastDraftAt;
    @JsonProperty("lastPublishedAt")
    String lastPublishedAt;
    @JsonProperty("templateContent")
    ModelTemplateContent templateContent;
    @JsonProperty("templateLanguage")
    String templateLanguage;

    public ModelLocalization createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("lastDraftAt", "lastDraftAt");
        result.put("lastPublishedAt", "lastPublishedAt");
        result.put("templateContent", "templateContent");
        result.put("templateLanguage", "templateLanguage");
        return result;
    }
}
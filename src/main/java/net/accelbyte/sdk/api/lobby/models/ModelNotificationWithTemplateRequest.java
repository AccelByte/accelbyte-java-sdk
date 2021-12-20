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
public class ModelNotificationWithTemplateRequest extends Model {

    @JsonProperty("templateContext")
    Map<String, String> templateContext;
    @JsonProperty("templateLanguage")
    String templateLanguage;
    @JsonProperty("templateSlug")
    String templateSlug;
    @JsonProperty("topic")
    String topic;

    public ModelNotificationWithTemplateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("templateContext", "templateContext");
        result.put("templateLanguage", "templateLanguage");
        result.put("templateSlug", "templateSlug");
        result.put("topic", "topic");
        return result;
    }
}
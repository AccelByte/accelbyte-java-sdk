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
public class ModelNotificationTemplateResponse extends Model {

    @JsonProperty("templateLocalizations")
    List<ModelLocalization> templateLocalizations;
    @JsonProperty("templateSlug")
    String templateSlug;

    public ModelNotificationTemplateResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("templateLocalizations", "templateLocalizations");
        result.put("templateSlug", "templateSlug");
        return result;
    }
}
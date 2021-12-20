package net.accelbyte.sdk.api.social.models;

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
public class SlotMetadataUpdate extends Model {

    @JsonProperty("customAttribute")
    String customAttribute;
    @JsonProperty("label")
    String label;
    @JsonProperty("tags")
    List<String> tags;

    public SlotMetadataUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("customAttribute", "customAttribute");
        result.put("label", "label");
        result.put("tags", "tags");
        return result;
    }
}
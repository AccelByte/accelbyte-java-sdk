package net.accelbyte.sdk.api.seasonpass.models;

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
public class PassUpdate extends Model {

    @JsonProperty("displayOrder")
    private Integer displayOrder;

    @JsonProperty("autoEnroll")
    private Boolean autoEnroll;

    @JsonProperty("passItemId")
    private String passItemId;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("images")
    private List<Image> images;

    public PassUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PassUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PassUpdate>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("displayOrder", "displayOrder");
        result.put("autoEnroll", "autoEnroll");
        result.put("passItemId", "passItemId");
        result.put("localizations", "localizations");
        result.put("images", "images");
        return result;
    }
}
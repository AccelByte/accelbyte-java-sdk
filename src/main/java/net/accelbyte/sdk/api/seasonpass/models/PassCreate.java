package net.accelbyte.sdk.api.seasonpass.models;

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
public class PassCreate extends Model {

    @JsonProperty("code")
    String code;
    @JsonProperty("displayOrder")
    Integer displayOrder;
    @JsonProperty("autoEnroll")
    Boolean autoEnroll;
    @JsonProperty("passItemId")
    String passItemId;
    @JsonProperty("localizations")
    Map<String, Localization> localizations;
    @JsonProperty("images")
    List<Image> images;

    public PassCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("displayOrder", "displayOrder");
        result.put("autoEnroll", "autoEnroll");
        result.put("passItemId", "passItemId");
        result.put("localizations", "localizations");
        result.put("images", "images");
        return result;
    }
}
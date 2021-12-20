package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserUpdateRequest extends Model {

    @JsonProperty("Country")
    String country;
    @JsonProperty("DateOfBirth")
    String dateOfBirth;
    @JsonProperty("DisplayName")
    String displayName;
    @JsonProperty("LanguageTag")
    String languageTag;

    public ModelUserUpdateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Country", "country");
        result.put("DateOfBirth", "dateOfBirth");
        result.put("DisplayName", "displayName");
        result.put("LanguageTag", "languageTag");
        return result;
    }
}
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
public class ModelUserVerificationRequest extends Model {

    @JsonProperty("Code")
    String code;
    @JsonProperty("ContactType")
    String contactType;
    @JsonProperty("LanguageTag")
    String languageTag;

    public ModelUserVerificationRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Code", "code");
        result.put("ContactType", "contactType");
        result.put("LanguageTag", "languageTag");
        return result;
    }
}
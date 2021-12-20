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
public class ModelUserVerificationRequestV3 extends Model {

    @JsonProperty("code")
    String code;
    @JsonProperty("contactType")
    String contactType;
    @JsonProperty("languageTag")
    String languageTag;

    public ModelUserVerificationRequestV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("contactType", "contactType");
        result.put("languageTag", "languageTag");
        return result;
    }
}
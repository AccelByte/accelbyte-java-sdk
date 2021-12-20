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
public class ModelSendVerificationCodeRequest extends Model {

    @JsonProperty("Context")
    String context;
    @JsonProperty("LanguageTag")
    String languageTag;
    @JsonProperty("LoginID")
    String loginID;

    public ModelSendVerificationCodeRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Context", "context");
        result.put("LanguageTag", "languageTag");
        result.put("LoginID", "loginID");
        return result;
    }
}
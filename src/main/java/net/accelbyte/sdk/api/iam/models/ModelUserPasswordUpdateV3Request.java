package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserPasswordUpdateV3Request extends Model {

    @JsonProperty("languageTag")
    private String languageTag;

    @JsonProperty("newPassword")
    private String newPassword;

    @JsonProperty("oldPassword")
    private String oldPassword;

    public ModelUserPasswordUpdateV3Request createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUserPasswordUpdateV3Request> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserPasswordUpdateV3Request>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("languageTag", "languageTag");
        result.put("newPassword", "newPassword");
        result.put("oldPassword", "oldPassword");
        return result;
    }
}
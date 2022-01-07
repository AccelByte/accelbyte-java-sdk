package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModelValidationDetailPublic extends Model {

    @JsonProperty("allowDigit")
    private Boolean allowDigit;

    @JsonProperty("allowLetter")
    private Boolean allowLetter;

    @JsonProperty("allowSpace")
    private Boolean allowSpace;

    @JsonProperty("allowUnicode")
    private Boolean allowUnicode;

    @JsonProperty("description")
    private AccountcommonInputValidationDescription description;

    @JsonProperty("isCustomRegex")
    private Boolean isCustomRegex;

    @JsonProperty("letterCase")
    private String letterCase;

    @JsonProperty("maxLength")
    private Integer maxLength;

    @JsonProperty("maxRepeatingAlphaNum")
    private Integer maxRepeatingAlphaNum;

    @JsonProperty("maxRepeatingSpecialCharacter")
    private Integer maxRepeatingSpecialCharacter;

    @JsonProperty("minCharType")
    private Integer minCharType;

    @JsonProperty("minLength")
    private Integer minLength;

    @JsonProperty("regex")
    private String regex;

    @JsonProperty("specialCharacterLocation")
    private String specialCharacterLocation;

    @JsonProperty("specialCharacters")
    private List<String> specialCharacters;

    @JsonIgnore
    public ModelValidationDetailPublic createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelValidationDetailPublic> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelValidationDetailPublic>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allowDigit", "allowDigit");
        result.put("allowLetter", "allowLetter");
        result.put("allowSpace", "allowSpace");
        result.put("allowUnicode", "allowUnicode");
        result.put("description", "description");
        result.put("isCustomRegex", "isCustomRegex");
        result.put("letterCase", "letterCase");
        result.put("maxLength", "maxLength");
        result.put("maxRepeatingAlphaNum", "maxRepeatingAlphaNum");
        result.put("maxRepeatingSpecialCharacter", "maxRepeatingSpecialCharacter");
        result.put("minCharType", "minCharType");
        result.put("minLength", "minLength");
        result.put("regex", "regex");
        result.put("specialCharacterLocation", "specialCharacterLocation");
        result.put("specialCharacters", "specialCharacters");
        return result;
    }
}
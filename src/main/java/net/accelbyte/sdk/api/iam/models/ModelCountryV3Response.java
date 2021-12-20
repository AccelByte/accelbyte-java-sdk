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
public class ModelCountryV3Response extends Model {

    @JsonProperty("ageRestriction")
    Integer ageRestriction;
    @JsonProperty("countryCode")
    String countryCode;
    @JsonProperty("countryName")
    String countryName;
    @JsonProperty("enable")
    Boolean enable;

    public ModelCountryV3Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ageRestriction", "ageRestriction");
        result.put("countryCode", "countryCode");
        result.put("countryName", "countryName");
        result.put("enable", "enable");
        return result;
    }
}
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
public class AccountcommonCountryAgeRestriction extends Model {

    @JsonProperty("AgeRestriction")
    private Integer ageRestriction;

    @JsonProperty("CountryCode")
    private String countryCode;

    @JsonProperty("CountryName")
    private String countryName;

    @JsonProperty("Enable")
    private Boolean enable;

    public AccountcommonCountryAgeRestriction createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AccountcommonCountryAgeRestriction> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonCountryAgeRestriction>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AgeRestriction", "ageRestriction");
        result.put("CountryCode", "countryCode");
        result.put("CountryName", "countryName");
        result.put("Enable", "enable");
        return result;
    }
}
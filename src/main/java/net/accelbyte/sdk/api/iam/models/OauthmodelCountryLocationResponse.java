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
public class OauthmodelCountryLocationResponse extends Model {

    @JsonProperty("city")
    String city;
    @JsonProperty("countryCode")
    String countryCode;
    @JsonProperty("countryName")
    String countryName;
    @JsonProperty("state")
    String state;

    public OauthmodelCountryLocationResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("city", "city");
        result.put("countryCode", "countryCode");
        result.put("countryName", "countryName");
        result.put("state", "state");
        return result;
    }
}
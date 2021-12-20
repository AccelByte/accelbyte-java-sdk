package net.accelbyte.sdk.api.basic.models;

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
public class AddCountryGroupResponse extends Model {

    @JsonProperty("countries")
    List<CountryObject> countries;
    @JsonProperty("countryGroupCode")
    String countryGroupCode;
    @JsonProperty("countryGroupName")
    String countryGroupName;

    public AddCountryGroupResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countries", "countries");
        result.put("countryGroupCode", "countryGroupCode");
        result.put("countryGroupName", "countryGroupName");
        return result;
    }
}
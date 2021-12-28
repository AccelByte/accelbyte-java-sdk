package net.accelbyte.sdk.api.basic.models;

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
public class AddCountryGroupRequest extends Model {

    @JsonProperty("countries")
    private List<CountryObject> countries;

    @JsonProperty("countryGroupCode")
    private String countryGroupCode;

    @JsonProperty("countryGroupName")
    private String countryGroupName;

    public AddCountryGroupRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AddCountryGroupRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AddCountryGroupRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countries", "countries");
        result.put("countryGroupCode", "countryGroupCode");
        result.put("countryGroupName", "countryGroupName");
        return result;
    }
}
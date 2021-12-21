package net.accelbyte.sdk.api.platform.models;

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
public class CurrencyCreate extends Model {

    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("currencySymbol")
    String currencySymbol;
    @JsonProperty("currencyType")
    String currencyType;
    @JsonProperty("decimals")
    Integer decimals;
    @JsonProperty("localizationDescriptions")
    Map<String, String> localizationDescriptions;

    public CurrencyCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("currencyType", "currencyType");
        result.put("decimals", "decimals");
        result.put("localizationDescriptions", "localizationDescriptions");
        return result;
    }
}
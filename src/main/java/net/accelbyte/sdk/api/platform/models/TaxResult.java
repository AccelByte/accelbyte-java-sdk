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
public class TaxResult extends Model {

    @JsonProperty("enableTax")
    Boolean enableTax;
    @JsonProperty("formattedTax")
    String formattedTax;
    @JsonProperty("state")
    String state;
    @JsonProperty("tax")
    Integer tax;

    public TaxResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("enableTax", "enableTax");
        result.put("formattedTax", "formattedTax");
        result.put("state", "state");
        result.put("tax", "tax");
        return result;
    }
}
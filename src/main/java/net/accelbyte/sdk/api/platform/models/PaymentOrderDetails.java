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
public class PaymentOrderDetails extends Model {

    @JsonProperty("charging")
    Boolean charging;
    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("currencySymbol")
    String currencySymbol;
    @JsonProperty("description")
    String description;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("price")
    String price;
    @JsonProperty("region")
    String region;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("title")
    String title;

    public PaymentOrderDetails createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("charging", "charging");
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("description", "description");
        result.put("displayName", "displayName");
        result.put("price", "price");
        result.put("region", "region");
        result.put("sandbox", "sandbox");
        result.put("title", "title");
        return result;
    }
}
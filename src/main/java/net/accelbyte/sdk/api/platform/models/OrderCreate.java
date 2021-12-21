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
public class OrderCreate extends Model {

    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("discountedPrice")
    Integer discountedPrice;
    @JsonProperty("ext")
    Map<String, ?> ext;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("language")
    String language;
    @JsonProperty("price")
    Integer price;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("region")
    String region;
    @JsonProperty("returnUrl")
    String returnUrl;

    public OrderCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currencyCode", "currencyCode");
        result.put("discountedPrice", "discountedPrice");
        result.put("ext", "ext");
        result.put("itemId", "itemId");
        result.put("language", "language");
        result.put("price", "price");
        result.put("quantity", "quantity");
        result.put("region", "region");
        result.put("returnUrl", "returnUrl");
        return result;
    }
}
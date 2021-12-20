package net.accelbyte.sdk.api.seasonpass.models;

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
public class RewardUpdate extends Model {

    @JsonProperty("type")
    String type;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("currency")
    RewardCurrency currency;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("image")
    Image image;
    @JsonProperty("nullFields")
    List<String> nullFields;

    public RewardUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("type", "type");
        result.put("itemId", "itemId");
        result.put("currency", "currency");
        result.put("quantity", "quantity");
        result.put("image", "image");
        result.put("nullFields", "nullFields");
        return result;
    }
}
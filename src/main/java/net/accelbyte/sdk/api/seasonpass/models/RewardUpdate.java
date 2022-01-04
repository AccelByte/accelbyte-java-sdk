package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class RewardUpdate extends Model {

    @JsonProperty("type")
    private String type;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("currency")
    private RewardCurrency currency;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("image")
    private Image image;

    @JsonProperty("nullFields")
    private List<String> nullFields;

    @JsonIgnore
    public RewardUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RewardUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardUpdate>>() {});
    }

    @JsonIgnore
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
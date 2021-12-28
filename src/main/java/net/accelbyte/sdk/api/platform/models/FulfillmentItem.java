package net.accelbyte.sdk.api.platform.models;

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
public class FulfillmentItem extends Model {

    @JsonProperty("extraSubscriptionDays")
    private Integer extraSubscriptionDays;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemName")
    private String itemName;

    @JsonProperty("itemSku")
    private String itemSku;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("storeId")
    private String storeId;

    public FulfillmentItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<FulfillmentItem> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentItem>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("extraSubscriptionDays", "extraSubscriptionDays");
        result.put("itemId", "itemId");
        result.put("itemName", "itemName");
        result.put("itemSku", "itemSku");
        result.put("itemType", "itemType");
        result.put("quantity", "quantity");
        result.put("storeId", "storeId");
        return result;
    }
}
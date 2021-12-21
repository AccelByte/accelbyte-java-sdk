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
public class FulfillmentItem extends Model {

    @JsonProperty("extraSubscriptionDays")
    Integer extraSubscriptionDays;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemName")
    String itemName;
    @JsonProperty("itemSku")
    String itemSku;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("storeId")
    String storeId;

    public FulfillmentItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
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
public class FulfillmentRequest extends Model {

    @JsonProperty("duration")
    Integer duration;
    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemSku")
    String itemSku;
    @JsonProperty("language")
    String language;
    @JsonProperty("order")
    OrderSummary order;
    @JsonProperty("orderNo")
    String orderNo;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("region")
    String region;
    @JsonProperty("source")
    String source;
    @JsonProperty("startDate")
    String startDate;
    @JsonProperty("storeId")
    String storeId;

    public FulfillmentRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("duration", "duration");
        result.put("endDate", "endDate");
        result.put("itemId", "itemId");
        result.put("itemSku", "itemSku");
        result.put("language", "language");
        result.put("order", "order");
        result.put("orderNo", "orderNo");
        result.put("quantity", "quantity");
        result.put("region", "region");
        result.put("source", "source");
        result.put("startDate", "startDate");
        result.put("storeId", "storeId");
        return result;
    }
}
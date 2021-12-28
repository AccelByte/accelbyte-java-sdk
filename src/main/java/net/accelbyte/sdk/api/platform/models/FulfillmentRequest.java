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
public class FulfillmentRequest extends Model {

    @JsonProperty("duration")
    private Integer duration;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemSku")
    private String itemSku;

    @JsonProperty("language")
    private String language;

    @JsonProperty("order")
    private OrderSummary order;

    @JsonProperty("orderNo")
    private String orderNo;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("region")
    private String region;

    @JsonProperty("source")
    private String source;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("storeId")
    private String storeId;

    public FulfillmentRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<FulfillmentRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentRequest>>() {});
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
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
public class FulfillmentScriptContext extends Model {

    @JsonProperty("item")
    private ItemInfo item;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("order")
    private OrderSummary order;

    @JsonProperty("source")
    private String source;

    public FulfillmentScriptContext createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<FulfillmentScriptContext> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentScriptContext>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("item", "item");
        result.put("namespace", "namespace");
        result.put("order", "order");
        result.put("source", "source");
        return result;
    }
}
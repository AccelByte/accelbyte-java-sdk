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
public class KeyGroupDynamicInfo extends Model {

    @JsonProperty("availableSaleCount")
    Integer availableSaleCount;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("saleCount")
    Integer saleCount;

    public KeyGroupDynamicInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("availableSaleCount", "availableSaleCount");
        result.put("quantity", "quantity");
        result.put("saleCount", "saleCount");
        return result;
    }
}
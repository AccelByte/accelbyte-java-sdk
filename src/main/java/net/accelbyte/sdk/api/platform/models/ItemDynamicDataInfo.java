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
public class ItemDynamicDataInfo extends Model {

    @JsonProperty("availableCount")
    Integer availableCount;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userAvailableCount")
    Integer userAvailableCount;
    @JsonProperty("userPurchaseLimit")
    Integer userPurchaseLimit;

    public ItemDynamicDataInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("availableCount", "availableCount");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("userAvailableCount", "userAvailableCount");
        result.put("userPurchaseLimit", "userPurchaseLimit");
        return result;
    }
}
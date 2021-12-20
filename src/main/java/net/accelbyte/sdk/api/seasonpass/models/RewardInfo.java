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
public class RewardInfo extends Model {

    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("seasonId")
    String seasonId;
    @JsonProperty("code")
    String code;
    @JsonProperty("type")
    String type;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("itemName")
    String itemName;
    @JsonProperty("itemSku")
    String itemSku;
    @JsonProperty("currency")
    RewardCurrency currency;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("image")
    Image image;

    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace", "namespace");
        result.put("seasonId", "seasonId");
        result.put("code", "code");
        result.put("type", "type");
        result.put("itemId", "itemId");
        result.put("itemType", "itemType");
        result.put("itemName", "itemName");
        result.put("itemSku", "itemSku");
        result.put("currency", "currency");
        result.put("quantity", "quantity");
        result.put("image", "image");
        return result;
    }
}
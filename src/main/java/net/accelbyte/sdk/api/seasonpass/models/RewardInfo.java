package net.accelbyte.sdk.api.seasonpass.models;

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
public class RewardInfo extends Model {

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("code")
    private String code;

    @JsonProperty("type")
    private String type;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("itemName")
    private String itemName;

    @JsonProperty("itemSku")
    private String itemSku;

    @JsonProperty("currency")
    private RewardCurrency currency;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("image")
    private Image image;

    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<RewardInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardInfo>>() {});
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
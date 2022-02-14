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
public class RewardInfo extends Model {

    @JsonProperty("code")
    private String code;

    @JsonProperty("currency")
    private RewardCurrency currency;

    @JsonProperty("image")
    private Image image;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemName")
    private String itemName;

    @JsonProperty("itemSku")
    private String itemSku;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("type")
    private String type;

    @JsonIgnore
    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RewardInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("currency", "currency");
        result.put("image", "image");
        result.put("itemId", "itemId");
        result.put("itemName", "itemName");
        result.put("itemSku", "itemSku");
        result.put("itemType", "itemType");
        result.put("namespace", "namespace");
        result.put("quantity", "quantity");
        result.put("seasonId", "seasonId");
        result.put("type", "type");
        return result;
    }
}
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
public class RegionDataItem extends Model {

    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("currencyNamespace")
    String currencyNamespace;
    @JsonProperty("currencyType")
    String currencyType;
    @JsonProperty("discountAmount")
    Integer discountAmount;
    @JsonProperty("discountExpireAt")
    String discountExpireAt;
    @JsonProperty("discountPercentage")
    Integer discountPercentage;
    @JsonProperty("discountPurchaseAt")
    String discountPurchaseAt;
    @JsonProperty("discountedPrice")
    Integer discountedPrice;
    @JsonProperty("expireAt")
    String expireAt;
    @JsonProperty("price")
    Integer price;
    @JsonProperty("purchaseAt")
    String purchaseAt;
    @JsonProperty("trialPrice")
    Integer trialPrice;

    public RegionDataItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currencyCode", "currencyCode");
        result.put("currencyNamespace", "currencyNamespace");
        result.put("currencyType", "currencyType");
        result.put("discountAmount", "discountAmount");
        result.put("discountExpireAt", "discountExpireAt");
        result.put("discountPercentage", "discountPercentage");
        result.put("discountPurchaseAt", "discountPurchaseAt");
        result.put("discountedPrice", "discountedPrice");
        result.put("expireAt", "expireAt");
        result.put("price", "price");
        result.put("purchaseAt", "purchaseAt");
        result.put("trialPrice", "trialPrice");
        return result;
    }
}
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
public class GoogleIAPReceipt extends Model {

    @JsonProperty("language")
    String language;
    @JsonProperty("orderId")
    String orderId;
    @JsonProperty("packageName")
    String packageName;
    @JsonProperty("productId")
    String productId;
    @JsonProperty("purchaseTime")
    Integer purchaseTime;
    @JsonProperty("purchaseToken")
    String purchaseToken;
    @JsonProperty("region")
    String region;

    public GoogleIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("language", "language");
        result.put("orderId", "orderId");
        result.put("packageName", "packageName");
        result.put("productId", "productId");
        result.put("purchaseTime", "purchaseTime");
        result.put("purchaseToken", "purchaseToken");
        result.put("region", "region");
        return result;
    }
}
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
public class AppleIAPReceipt extends Model {

    @JsonProperty("excludeOldTransactions")
    Boolean excludeOldTransactions;
    @JsonProperty("language")
    String language;
    @JsonProperty("productId")
    String productId;
    @JsonProperty("receiptData")
    String receiptData;
    @JsonProperty("region")
    String region;
    @JsonProperty("transactionId")
    String transactionId;

    public AppleIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("excludeOldTransactions", "excludeOldTransactions");
        result.put("language", "language");
        result.put("productId", "productId");
        result.put("receiptData", "receiptData");
        result.put("region", "region");
        result.put("transactionId", "transactionId");
        return result;
    }
}
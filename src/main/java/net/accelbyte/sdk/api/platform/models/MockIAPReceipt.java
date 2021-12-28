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
public class MockIAPReceipt extends Model {

    @JsonProperty("language")
    String language;
    @JsonProperty("productId")
    String productId;
    @JsonProperty("region")
    String region;
    @JsonProperty("type")
    String type;

    public MockIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("language", "language");
        result.put("productId", "productId");
        result.put("region", "region");
        result.put("type", "type");
        return result;
    }
}
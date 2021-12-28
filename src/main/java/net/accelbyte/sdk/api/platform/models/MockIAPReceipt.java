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
public class MockIAPReceipt extends Model {

    @JsonProperty("language")
    private String language;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("type")
    private String type;

    public MockIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<MockIAPReceipt> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<MockIAPReceipt>>() {});
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
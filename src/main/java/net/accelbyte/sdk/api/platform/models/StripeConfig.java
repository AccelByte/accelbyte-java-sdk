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
public class StripeConfig extends Model {

    @JsonProperty("allowedPaymentMethodTypes")
    private List<String> allowedPaymentMethodTypes;

    @JsonProperty("publishableKey")
    private String publishableKey;

    @JsonProperty("secretKey")
    private String secretKey;

    @JsonProperty("webhookSecret")
    private String webhookSecret;

    public StripeConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<StripeConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StripeConfig>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allowedPaymentMethodTypes", "allowedPaymentMethodTypes");
        result.put("publishableKey", "publishableKey");
        result.put("secretKey", "secretKey");
        result.put("webhookSecret", "webhookSecret");
        return result;
    }
}
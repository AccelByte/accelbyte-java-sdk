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
public class StripeConfig extends Model {

    @JsonProperty("allowedPaymentMethodTypes")
    List<String> allowedPaymentMethodTypes;
    @JsonProperty("publishableKey")
    String publishableKey;
    @JsonProperty("secretKey")
    String secretKey;
    @JsonProperty("webhookSecret")
    String webhookSecret;

    public StripeConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
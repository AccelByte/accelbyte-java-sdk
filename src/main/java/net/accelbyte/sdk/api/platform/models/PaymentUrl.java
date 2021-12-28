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
public class PaymentUrl extends Model {

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("paymentType")
    private String paymentType;

    @JsonProperty("paymentUrl")
    private String paymentUrl;

    @JsonProperty("returnUrl")
    private String returnUrl;

    public PaymentUrl createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentUrl> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentUrl>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("paymentProvider", "paymentProvider");
        result.put("paymentType", "paymentType");
        result.put("paymentUrl", "paymentUrl");
        result.put("returnUrl", "returnUrl");
        return result;
    }
}
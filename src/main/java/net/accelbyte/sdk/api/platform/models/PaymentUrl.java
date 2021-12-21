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
public class PaymentUrl extends Model {

    @JsonProperty("paymentProvider")
    String paymentProvider;
    @JsonProperty("paymentType")
    String paymentType;
    @JsonProperty("paymentUrl")
    String paymentUrl;
    @JsonProperty("returnUrl")
    String returnUrl;

    public PaymentUrl createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
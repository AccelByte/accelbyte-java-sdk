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
public class PaymentUrlCreate extends Model {

    @JsonProperty("paymentOrderNo")
    String paymentOrderNo;
    @JsonProperty("paymentProvider")
    String paymentProvider;
    @JsonProperty("returnUrl")
    String returnUrl;
    @JsonProperty("ui")
    String ui;
    @JsonProperty("zipCode")
    String zipCode;

    public PaymentUrlCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentProvider", "paymentProvider");
        result.put("returnUrl", "returnUrl");
        result.put("ui", "ui");
        result.put("zipCode", "zipCode");
        return result;
    }
}
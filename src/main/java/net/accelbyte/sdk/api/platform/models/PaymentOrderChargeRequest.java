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
public class PaymentOrderChargeRequest extends Model {

    @JsonProperty("extTxId")
    private String extTxId;

    @JsonProperty("paymentMethod")
    private String paymentMethod;

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    public PaymentOrderChargeRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentOrderChargeRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderChargeRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("extTxId", "extTxId");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentProvider", "paymentProvider");
        return result;
    }
}
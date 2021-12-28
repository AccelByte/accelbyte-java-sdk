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
public class PaymentOrderNotifySimulation extends Model {

    @JsonProperty("amount")
    private Integer amount;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("notifyType")
    private String notifyType;

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("vat")
    private Integer vat;

    public PaymentOrderNotifySimulation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentOrderNotifySimulation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderNotifySimulation>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("amount", "amount");
        result.put("currencyCode", "currencyCode");
        result.put("notifyType", "notifyType");
        result.put("paymentProvider", "paymentProvider");
        result.put("salesTax", "salesTax");
        result.put("vat", "vat");
        return result;
    }
}
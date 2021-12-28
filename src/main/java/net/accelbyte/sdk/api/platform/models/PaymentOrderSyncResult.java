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
public class PaymentOrderSyncResult extends Model {

    @JsonProperty("nextEvaluatedKey")
    String nextEvaluatedKey;
    @JsonProperty("paymentOrders")
    List<PaymentOrder> paymentOrders;

    public PaymentOrderSyncResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("nextEvaluatedKey", "nextEvaluatedKey");
        result.put("paymentOrders", "paymentOrders");
        return result;
    }
}
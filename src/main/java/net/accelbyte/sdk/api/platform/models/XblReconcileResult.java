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
public class XblReconcileResult extends Model {

    @JsonProperty("iapOrderStatus")
    String iapOrderStatus;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("transactionId")
    String transactionId;
    @JsonProperty("xboxProductId")
    String xboxProductId;

    public XblReconcileResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("iapOrderStatus", "iapOrderStatus");
        result.put("itemId", "itemId");
        result.put("sku", "sku");
        result.put("transactionId", "transactionId");
        result.put("xboxProductId", "xboxProductId");
        return result;
    }
}
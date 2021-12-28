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
public class XblReconcileResult extends Model {

    @JsonProperty("iapOrderStatus")
    private String iapOrderStatus;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("transactionId")
    private String transactionId;

    @JsonProperty("xboxProductId")
    private String xboxProductId;

    public XblReconcileResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<XblReconcileResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XblReconcileResult>>() {});
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
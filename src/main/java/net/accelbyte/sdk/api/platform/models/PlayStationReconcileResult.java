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
public class PlayStationReconcileResult extends Model {

    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("psnItemId")
    String psnItemId;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("status")
    String status;
    @JsonProperty("transactionId")
    String transactionId;

    public PlayStationReconcileResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("itemId", "itemId");
        result.put("psnItemId", "psnItemId");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("transactionId", "transactionId");
        return result;
    }
}
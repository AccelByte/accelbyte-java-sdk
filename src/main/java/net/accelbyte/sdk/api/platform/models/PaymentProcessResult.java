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
public class PaymentProcessResult extends Model {

    @JsonProperty("pending")
    private Boolean pending;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("redirectUrl")
    private String redirectUrl;

    @JsonProperty("success")
    private Boolean success;

    public PaymentProcessResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentProcessResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentProcessResult>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("pending", "pending");
        result.put("reason", "reason");
        result.put("redirectUrl", "redirectUrl");
        result.put("success", "success");
        return result;
    }
}
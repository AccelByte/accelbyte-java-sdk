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
public class PayPalConfig extends Model {

    @JsonProperty("clientID")
    private String clientID;

    @JsonProperty("clientSecret")
    private String clientSecret;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("webHookId")
    private String webHookId;

    public PayPalConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PayPalConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PayPalConfig>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clientID", "clientID");
        result.put("clientSecret", "clientSecret");
        result.put("returnUrl", "returnUrl");
        result.put("webHookId", "webHookId");
        return result;
    }
}
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
public class AdyenConfig extends Model {

    @JsonProperty("allowedPaymentMethods")
    List<String> allowedPaymentMethods;
    @JsonProperty("apiKey")
    String apiKey;
    @JsonProperty("authoriseAsCapture")
    Boolean authoriseAsCapture;
    @JsonProperty("blockedPaymentMethods")
    List<String> blockedPaymentMethods;
    @JsonProperty("liveEndpointUrlPrefix")
    String liveEndpointUrlPrefix;
    @JsonProperty("merchantAccount")
    String merchantAccount;
    @JsonProperty("notificationHmacKey")
    String notificationHmacKey;
    @JsonProperty("notificationPassword")
    String notificationPassword;
    @JsonProperty("notificationUsername")
    String notificationUsername;
    @JsonProperty("returnUrl")
    String returnUrl;
    @JsonProperty("settings")
    String settings;

    public AdyenConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allowedPaymentMethods", "allowedPaymentMethods");
        result.put("apiKey", "apiKey");
        result.put("authoriseAsCapture", "authoriseAsCapture");
        result.put("blockedPaymentMethods", "blockedPaymentMethods");
        result.put("liveEndpointUrlPrefix", "liveEndpointUrlPrefix");
        result.put("merchantAccount", "merchantAccount");
        result.put("notificationHmacKey", "notificationHmacKey");
        result.put("notificationPassword", "notificationPassword");
        result.put("notificationUsername", "notificationUsername");
        result.put("returnUrl", "returnUrl");
        result.put("settings", "settings");
        return result;
    }
}
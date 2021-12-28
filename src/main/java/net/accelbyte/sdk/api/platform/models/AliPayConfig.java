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
public class AliPayConfig extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("privateKey")
    String privateKey;
    @JsonProperty("publicKey")
    String publicKey;
    @JsonProperty("returnUrl")
    String returnUrl;

    public AliPayConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("privateKey", "privateKey");
        result.put("publicKey", "publicKey");
        result.put("returnUrl", "returnUrl");
        return result;
    }
}
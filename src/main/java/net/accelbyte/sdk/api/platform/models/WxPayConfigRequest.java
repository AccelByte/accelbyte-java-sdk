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
public class WxPayConfigRequest extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("key")
    String key;
    @JsonProperty("mchid")
    String mchid;
    @JsonProperty("returnUrl")
    String returnUrl;

    public WxPayConfigRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("key", "key");
        result.put("mchid", "mchid");
        result.put("returnUrl", "returnUrl");
        return result;
    }
}
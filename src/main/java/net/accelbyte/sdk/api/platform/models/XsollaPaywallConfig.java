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
public class XsollaPaywallConfig extends Model {

    @JsonProperty("device")
    String device;
    @JsonProperty("showCloseButton")
    Boolean showCloseButton;
    @JsonProperty("size")
    String size;
    @JsonProperty("theme")
    String theme;

    public XsollaPaywallConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("device", "device");
        result.put("showCloseButton", "showCloseButton");
        result.put("size", "size");
        result.put("theme", "theme");
        return result;
    }
}
package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsRegisterLocalServerRequest extends Model {

    @JsonProperty("custom_attribute")
    String customAttribute;
    @JsonProperty("ip")
    String ip;
    @JsonProperty("name")
    String name;
    @JsonProperty("port")
    Integer port;

    public ModelsRegisterLocalServerRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("custom_attribute", "customAttribute");
        result.put("ip", "ip");
        result.put("name", "name");
        result.put("port", "port");
        return result;
    }
}
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
public class Requirement extends Model {

    @JsonProperty("additionals")
    String additionals;
    @JsonProperty("directXVersion")
    String directXVersion;
    @JsonProperty("diskSpace")
    String diskSpace;
    @JsonProperty("graphics")
    String graphics;
    @JsonProperty("label")
    String label;
    @JsonProperty("osVersion")
    String osVersion;
    @JsonProperty("processor")
    String processor;
    @JsonProperty("ram")
    String ram;
    @JsonProperty("soundCard")
    String soundCard;

    public Requirement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionals", "additionals");
        result.put("directXVersion", "directXVersion");
        result.put("diskSpace", "diskSpace");
        result.put("graphics", "graphics");
        result.put("label", "label");
        result.put("osVersion", "osVersion");
        result.put("processor", "processor");
        result.put("ram", "ram");
        result.put("soundCard", "soundCard");
        return result;
    }
}
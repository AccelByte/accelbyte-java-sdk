package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class Requirement extends Model {

    @JsonProperty("additionals")
    private String additionals;

    @JsonProperty("directXVersion")
    private String directXVersion;

    @JsonProperty("diskSpace")
    private String diskSpace;

    @JsonProperty("graphics")
    private String graphics;

    @JsonProperty("label")
    private String label;

    @JsonProperty("osVersion")
    private String osVersion;

    @JsonProperty("processor")
    private String processor;

    @JsonProperty("ram")
    private String ram;

    @JsonProperty("soundCard")
    private String soundCard;

    @JsonIgnore
    public Requirement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<Requirement> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Requirement>>() {});
    }

    @JsonIgnore
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
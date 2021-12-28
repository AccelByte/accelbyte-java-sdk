package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsUpdateAllianceRule extends Model {

    @JsonProperty("maxNumber")
    private Integer maxNumber;

    @JsonProperty("minNumber")
    private Integer minNumber;

    @JsonProperty("playerMaxNumber")
    private Integer playerMaxNumber;

    @JsonProperty("playerMinNumber")
    private Integer playerMinNumber;

    public ModelsUpdateAllianceRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUpdateAllianceRule> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdateAllianceRule>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("maxNumber", "maxNumber");
        result.put("minNumber", "minNumber");
        result.put("playerMaxNumber", "playerMaxNumber");
        result.put("playerMinNumber", "playerMinNumber");
        return result;
    }
}
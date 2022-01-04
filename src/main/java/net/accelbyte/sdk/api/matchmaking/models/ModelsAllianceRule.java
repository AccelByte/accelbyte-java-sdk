package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsAllianceRule extends Model {

    @JsonProperty("max_number")
    private Integer maxNumber;

    @JsonProperty("min_number")
    private Integer minNumber;

    @JsonProperty("player_max_number")
    private Integer playerMaxNumber;

    @JsonProperty("player_min_number")
    private Integer playerMinNumber;

    @JsonIgnore
    public ModelsAllianceRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAllianceRule> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAllianceRule>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("max_number", "maxNumber");
        result.put("min_number", "minNumber");
        result.put("player_max_number", "playerMaxNumber");
        result.put("player_min_number", "playerMinNumber");
        return result;
    }
}
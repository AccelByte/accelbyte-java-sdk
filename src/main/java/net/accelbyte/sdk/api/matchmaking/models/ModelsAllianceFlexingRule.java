package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsAllianceFlexingRule extends Model {

    @JsonProperty("duration")
    Integer duration;
    @JsonProperty("max_number")
    Integer maxNumber;
    @JsonProperty("min_number")
    Integer minNumber;
    @JsonProperty("player_max_number")
    Integer playerMaxNumber;
    @JsonProperty("player_min_number")
    Integer playerMinNumber;

    public ModelsAllianceFlexingRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("duration", "duration");
        result.put("max_number", "maxNumber");
        result.put("min_number", "minNumber");
        result.put("player_max_number", "playerMaxNumber");
        result.put("player_min_number", "playerMinNumber");
        return result;
    }
}
package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsUpdateSessionRequest extends Model {

    @JsonProperty("game_current_player")
    Integer gameCurrentPlayer;
    @JsonProperty("game_max_player")
    Integer gameMaxPlayer;

    public ModelsUpdateSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("game_current_player", "gameCurrentPlayer");
        result.put("game_max_player", "gameMaxPlayer");
        return result;
    }
}
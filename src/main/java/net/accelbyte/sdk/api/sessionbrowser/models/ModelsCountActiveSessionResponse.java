package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsCountActiveSessionResponse extends Model {

    @JsonProperty("custom_game")
    private Integer customGame;

    @JsonProperty("matchmaking_game")
    private Integer matchmakingGame;

    @JsonProperty("total")
    private Integer total;

    public ModelsCountActiveSessionResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsCountActiveSessionResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCountActiveSessionResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("custom_game", "customGame");
        result.put("matchmaking_game", "matchmakingGame");
        result.put("total", "total");
        return result;
    }
}
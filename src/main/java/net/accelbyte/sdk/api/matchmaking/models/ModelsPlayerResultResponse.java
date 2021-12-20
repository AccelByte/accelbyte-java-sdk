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
public class ModelsPlayerResultResponse extends Model {

    @JsonProperty("current_score")
    List<ModelsResultAttributeResponse> currentScore;
    @JsonProperty("user_id")
    String userId;

    public ModelsPlayerResultResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("current_score", "currentScore");
        result.put("user_id", "userId");
        return result;
    }
}
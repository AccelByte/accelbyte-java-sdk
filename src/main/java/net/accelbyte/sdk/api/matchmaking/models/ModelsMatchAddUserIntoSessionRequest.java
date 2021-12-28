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
public class ModelsMatchAddUserIntoSessionRequest extends Model {

    @JsonProperty("blocked_players")
    private List<String> blockedPlayers;

    @JsonProperty("party_id")
    private String partyId;

    @JsonProperty("user_id")
    private String userId;

    public ModelsMatchAddUserIntoSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsMatchAddUserIntoSessionRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatchAddUserIntoSessionRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("blocked_players", "blockedPlayers");
        result.put("party_id", "partyId");
        result.put("user_id", "userId");
        return result;
    }
}
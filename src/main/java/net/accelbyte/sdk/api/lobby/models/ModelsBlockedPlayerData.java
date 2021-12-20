package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsBlockedPlayerData extends Model {

    @JsonProperty("blockedAt")
    String blockedAt;
    @JsonProperty("blockedUserId")
    String blockedUserId;

    public ModelsBlockedPlayerData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("blockedAt", "blockedAt");
        result.put("blockedUserId", "blockedUserId");
        return result;
    }
}
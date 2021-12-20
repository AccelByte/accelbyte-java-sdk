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
public class ModelsAdminVerifyMessageProfanityResponse extends Model {

    @JsonProperty("filteredMessage")
    String filteredMessage;
    @JsonProperty("hasProfanity")
    Boolean hasProfanity;

    public ModelsAdminVerifyMessageProfanityResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("filteredMessage", "filteredMessage");
        result.put("hasProfanity", "hasProfanity");
        return result;
    }
}
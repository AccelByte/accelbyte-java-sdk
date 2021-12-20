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
public class ModelChatMessageResponse extends Model {

    @JsonProperty("from")
    String from;
    @JsonProperty("id")
    String id;
    @JsonProperty("payload")
    String payload;
    @JsonProperty("receivedAt")
    Integer receivedAt;
    @JsonProperty("to")
    String to;

    public ModelChatMessageResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("from", "from");
        result.put("id", "id");
        result.put("payload", "payload");
        result.put("receivedAt", "receivedAt");
        result.put("to", "to");
        return result;
    }
}
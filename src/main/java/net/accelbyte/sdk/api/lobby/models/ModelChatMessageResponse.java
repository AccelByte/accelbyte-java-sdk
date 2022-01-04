package net.accelbyte.sdk.api.lobby.models;

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
public class ModelChatMessageResponse extends Model {

    @JsonProperty("from")
    private String from;

    @JsonProperty("id")
    private String id;

    @JsonProperty("payload")
    private String payload;

    @JsonProperty("receivedAt")
    private Integer receivedAt;

    @JsonProperty("to")
    private String to;

    @JsonIgnore
    public ModelChatMessageResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelChatMessageResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelChatMessageResponse>>() {});
    }

    @JsonIgnore
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
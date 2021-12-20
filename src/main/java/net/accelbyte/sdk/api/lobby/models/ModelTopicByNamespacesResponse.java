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
public class ModelTopicByNamespacesResponse extends Model {

    @JsonProperty("first")
    String first;
    @JsonProperty("last")
    String last;
    @JsonProperty("next")
    String next;
    @JsonProperty("previous")
    String previous;
    @JsonProperty("topics")
    List<ModelNotificationTopicResponse> topics;

    public ModelTopicByNamespacesResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("first", "first");
        result.put("last", "last");
        result.put("next", "next");
        result.put("previous", "previous");
        result.put("topics", "topics");
        return result;
    }
}
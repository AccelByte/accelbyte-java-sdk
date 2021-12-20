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
public class ModelNotificationTopicResponse extends Model {

    @JsonProperty("createdAt")
    Integer createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("topic")
    String topic;

    public ModelNotificationTopicResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("namespace", "namespace");
        result.put("topic", "topic");
        return result;
    }
}
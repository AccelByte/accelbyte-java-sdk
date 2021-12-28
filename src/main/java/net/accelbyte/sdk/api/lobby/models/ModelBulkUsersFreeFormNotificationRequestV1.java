package net.accelbyte.sdk.api.lobby.models;

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
public class ModelBulkUsersFreeFormNotificationRequestV1 extends Model {

    @JsonProperty("message")
    private String message;

    @JsonProperty("topicName")
    private String topicName;

    @JsonProperty("userIds")
    private List<String> userIds;

    public ModelBulkUsersFreeFormNotificationRequestV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelBulkUsersFreeFormNotificationRequestV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelBulkUsersFreeFormNotificationRequestV1>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("message", "message");
        result.put("topicName", "topicName");
        result.put("userIds", "userIds");
        return result;
    }
}
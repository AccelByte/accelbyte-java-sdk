package net.accelbyte.sdk.api.group.models;

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
public class ModelsMemberRequestResponseV1 extends Model {

    @JsonProperty("groupId")
    String groupId;
    @JsonProperty("requestType")
    String requestType;
    @JsonProperty("userId")
    String userId;

    public ModelsMemberRequestResponseV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("groupId", "groupId");
        result.put("requestType", "requestType");
        result.put("userId", "userId");
        return result;
    }
}
package net.accelbyte.sdk.api.iam.models;

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
public class ModelGameUserBaseInfo extends Model {

    @JsonProperty("avatarUrl")
    String avatarUrl;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("userId")
    String userId;

    public ModelGameUserBaseInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("avatarUrl", "avatarUrl");
        result.put("displayName", "displayName");
        result.put("userId", "userId");
        return result;
    }
}
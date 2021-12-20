package net.accelbyte.sdk.api.basic.models;

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
public class ADTOObjectForEqu8UserStatus extends Model {

    @JsonProperty("actionComment")
    String actionComment;
    @JsonProperty("actionId")
    Integer actionId;
    @JsonProperty("expires")
    String expires;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("when")
    String when;

    public ADTOObjectForEqu8UserStatus createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("actionComment", "actionComment");
        result.put("actionId", "actionId");
        result.put("expires", "expires");
        result.put("userId", "userId");
        result.put("when", "when");
        return result;
    }
}
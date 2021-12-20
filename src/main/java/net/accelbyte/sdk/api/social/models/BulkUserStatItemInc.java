package net.accelbyte.sdk.api.social.models;

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
public class BulkUserStatItemInc extends Model {

    @JsonProperty("inc")
    Float inc;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("userId")
    String userId;

    public BulkUserStatItemInc createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("inc", "inc");
        result.put("statCode", "statCode");
        result.put("userId", "userId");
        return result;
    }
}
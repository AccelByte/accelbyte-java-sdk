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
public class BulkUserStatItemUpdate extends Model {

    @JsonProperty("additionalData")
    Map<String, ?> additionalData;
    @JsonProperty("additionalKey")
    String additionalKey;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("updateStrategy")
    String updateStrategy;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("value")
    Float value;

    public BulkUserStatItemUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("additionalKey", "additionalKey");
        result.put("statCode", "statCode");
        result.put("updateStrategy", "updateStrategy");
        result.put("userId", "userId");
        result.put("value", "value");
        return result;
    }
}
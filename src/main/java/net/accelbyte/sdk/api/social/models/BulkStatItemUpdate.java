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
public class BulkStatItemUpdate extends Model {

    @JsonProperty("additionalData")
    Map<String, ?> additionalData;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("updateStrategy")
    String updateStrategy;
    @JsonProperty("value")
    Float value;

    public BulkStatItemUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("statCode", "statCode");
        result.put("updateStrategy", "updateStrategy");
        result.put("value", "value");
        return result;
    }
}
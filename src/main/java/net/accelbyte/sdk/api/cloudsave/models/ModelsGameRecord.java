package net.accelbyte.sdk.api.cloudsave.models;

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
public class ModelsGameRecord extends Model {

    @JsonProperty("created_at")
    String createdAt;
    @JsonProperty("key")
    String key;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("updated_at")
    String updatedAt;
    @JsonProperty("value")
    Map<String, ?> value;

    public ModelsGameRecord createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("created_at", "createdAt");
        result.put("key", "key");
        result.put("namespace", "namespace");
        result.put("updated_at", "updatedAt");
        result.put("value", "value");
        return result;
    }
}
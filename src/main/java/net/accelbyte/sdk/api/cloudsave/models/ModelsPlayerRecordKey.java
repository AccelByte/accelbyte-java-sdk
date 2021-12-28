package net.accelbyte.sdk.api.cloudsave.models;

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
public class ModelsPlayerRecordKey extends Model {

    @JsonProperty("key")
    private String key;

    @JsonProperty("user_id")
    private String userId;

    public ModelsPlayerRecordKey createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsPlayerRecordKey> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPlayerRecordKey>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("key", "key");
        result.put("user_id", "userId");
        return result;
    }
}
package net.accelbyte.sdk.api.platform.models;

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
public class InGameItemSync extends Model {

    @JsonProperty("categoryPath")
    private String categoryPath;

    @JsonProperty("targetItemId")
    private String targetItemId;

    @JsonProperty("targetNamespace")
    private String targetNamespace;

    public InGameItemSync createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<InGameItemSync> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<InGameItemSync>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("categoryPath", "categoryPath");
        result.put("targetItemId", "targetItemId");
        result.put("targetNamespace", "targetNamespace");
        return result;
    }
}
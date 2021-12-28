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
public class ModelsPartyPUTCustomAttributesRequest extends Model {

    @JsonProperty("custom_attribute")
    private Map<String, ?> customAttribute;

    @JsonProperty("updatedAt")
    private Integer updatedAt;

    public ModelsPartyPUTCustomAttributesRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsPartyPUTCustomAttributesRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPartyPUTCustomAttributesRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("custom_attribute", "customAttribute");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
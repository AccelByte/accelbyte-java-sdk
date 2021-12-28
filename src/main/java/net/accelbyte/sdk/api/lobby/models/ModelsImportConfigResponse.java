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
public class ModelsImportConfigResponse extends Model {

    @JsonProperty("failedConfigs")
    private List<String> failedConfigs;

    @JsonProperty("ignoredConfigs")
    private List<String> ignoredConfigs;

    @JsonProperty("newConfigs")
    private List<String> newConfigs;

    @JsonProperty("replacedConfigs")
    private List<String> replacedConfigs;

    public ModelsImportConfigResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsImportConfigResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsImportConfigResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("failedConfigs", "failedConfigs");
        result.put("ignoredConfigs", "ignoredConfigs");
        result.put("newConfigs", "newConfigs");
        result.put("replacedConfigs", "replacedConfigs");
        return result;
    }
}
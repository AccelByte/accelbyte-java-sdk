package net.accelbyte.sdk.api.social.models;

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
public class StatImportInfo extends Model {

    @JsonProperty("failedConfigs")
    private List<String> failedConfigs;

    @JsonProperty("ignoredConfigs")
    private List<String> ignoredConfigs;

    @JsonProperty("newConfigs")
    private List<String> newConfigs;

    @JsonProperty("replacedConfigs")
    private List<String> replacedConfigs;

    public StatImportInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<StatImportInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StatImportInfo>>() {});
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
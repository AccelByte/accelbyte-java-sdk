package net.accelbyte.sdk.api.achievement.models;

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
public class ServiceImportConfigResponse extends Model {

    @JsonProperty("failedConfigs")
    List<String> failedConfigs;
    @JsonProperty("ignoredConfigs")
    List<String> ignoredConfigs;
    @JsonProperty("newConfigs")
    List<String> newConfigs;
    @JsonProperty("replacedConfigs")
    List<String> replacedConfigs;

    public ServiceImportConfigResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
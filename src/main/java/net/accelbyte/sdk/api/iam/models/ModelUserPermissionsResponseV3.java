package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserPermissionsResponseV3 extends Model {

    @JsonProperty("action")
    private Integer action;

    @JsonProperty("resource")
    private String resource;

    @JsonProperty("schedAction")
    private Integer schedAction;

    @JsonProperty("schedCron")
    private String schedCron;

    @JsonProperty("schedRange")
    private List<String> schedRange;

    public ModelUserPermissionsResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUserPermissionsResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserPermissionsResponseV3>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "action");
        result.put("resource", "resource");
        result.put("schedAction", "schedAction");
        result.put("schedCron", "schedCron");
        result.put("schedRange", "schedRange");
        return result;
    }
}
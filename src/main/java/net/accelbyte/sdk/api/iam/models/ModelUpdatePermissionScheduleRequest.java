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
public class ModelUpdatePermissionScheduleRequest extends Model {

    @JsonProperty("SchedAction")
    private Integer schedAction;

    @JsonProperty("SchedCron")
    private String schedCron;

    @JsonProperty("SchedRange")
    private List<String> schedRange;

    public ModelUpdatePermissionScheduleRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUpdatePermissionScheduleRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUpdatePermissionScheduleRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("SchedAction", "schedAction");
        result.put("SchedCron", "schedCron");
        result.put("SchedRange", "schedRange");
        return result;
    }
}
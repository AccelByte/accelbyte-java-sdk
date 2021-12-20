package net.accelbyte.sdk.api.iam.models;

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
public class ModelUpdatePermissionScheduleRequest extends Model {

    @JsonProperty("SchedAction")
    Integer schedAction;
    @JsonProperty("SchedCron")
    String schedCron;
    @JsonProperty("SchedRange")
    List<String> schedRange;

    public ModelUpdatePermissionScheduleRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("SchedAction", "schedAction");
        result.put("SchedCron", "schedCron");
        result.put("SchedRange", "schedRange");
        return result;
    }
}
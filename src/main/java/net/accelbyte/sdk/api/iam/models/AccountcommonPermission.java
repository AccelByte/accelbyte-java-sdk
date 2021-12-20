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
public class AccountcommonPermission extends Model {

    @JsonProperty("Action")
    Integer action;
    @JsonProperty("Resource")
    String resource;
    @JsonProperty("SchedAction")
    Integer schedAction;
    @JsonProperty("SchedCron")
    String schedCron;
    @JsonProperty("SchedRange")
    List<String> schedRange;

    public AccountcommonPermission createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Action", "action");
        result.put("Resource", "resource");
        result.put("SchedAction", "schedAction");
        result.put("SchedCron", "schedCron");
        result.put("SchedRange", "schedRange");
        return result;
    }
}
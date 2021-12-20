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
public class AccountcommonPermissionV3 extends Model {

    @JsonProperty("action")
    Integer action;
    @JsonProperty("resource")
    String resource;
    @JsonProperty("schedAction")
    Integer schedAction;
    @JsonProperty("schedCron")
    String schedCron;
    @JsonProperty("schedRange")
    List<String> schedRange;

    public AccountcommonPermissionV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
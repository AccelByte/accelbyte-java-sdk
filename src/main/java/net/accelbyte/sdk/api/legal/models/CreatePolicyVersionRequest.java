package net.accelbyte.sdk.api.legal.models;

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
public class CreatePolicyVersionRequest extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("displayVersion")
    String displayVersion;
    @JsonProperty("isCommitted")
    Boolean isCommitted;

    public CreatePolicyVersionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("displayVersion", "displayVersion");
        result.put("isCommitted", "isCommitted");
        return result;
    }
}
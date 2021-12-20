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
public class UpdatePolicyRequest extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("isDefaultOpted")
    Boolean isDefaultOpted;
    @JsonProperty("isMandatory")
    Boolean isMandatory;
    @JsonProperty("policyName")
    String policyName;
    @JsonProperty("readableId")
    String readableId;
    @JsonProperty("shouldNotifyOnUpdate")
    Boolean shouldNotifyOnUpdate;

    public UpdatePolicyRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("isDefaultOpted", "isDefaultOpted");
        result.put("isMandatory", "isMandatory");
        result.put("policyName", "policyName");
        result.put("readableId", "readableId");
        result.put("shouldNotifyOnUpdate", "shouldNotifyOnUpdate");
        return result;
    }
}
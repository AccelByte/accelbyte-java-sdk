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
public class RetrievePolicyResponse extends Model {

    @JsonProperty("countryCode")
    String countryCode;
    @JsonProperty("countryGroupCode")
    String countryGroupCode;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("id")
    String id;
    @JsonProperty("isDefaultOpted")
    Boolean isDefaultOpted;
    @JsonProperty("isDefaultSelection")
    Boolean isDefaultSelection;
    @JsonProperty("isMandatory")
    Boolean isMandatory;
    @JsonProperty("policyName")
    String policyName;
    @JsonProperty("policyVersions")
    List<PolicyVersionObject> policyVersions;
    @JsonProperty("readableId")
    String readableId;
    @JsonProperty("shouldNotifyOnUpdate")
    Boolean shouldNotifyOnUpdate;
    @JsonProperty("updatedAt")
    String updatedAt;

    public RetrievePolicyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countryCode", "countryCode");
        result.put("countryGroupCode", "countryGroupCode");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("id", "id");
        result.put("isDefaultOpted", "isDefaultOpted");
        result.put("isDefaultSelection", "isDefaultSelection");
        result.put("isMandatory", "isMandatory");
        result.put("policyName", "policyName");
        result.put("policyVersions", "policyVersions");
        result.put("readableId", "readableId");
        result.put("shouldNotifyOnUpdate", "shouldNotifyOnUpdate");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
package net.accelbyte.sdk.api.legal.models;

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
public class RetrievePolicyResponse extends Model {

    @JsonProperty("countryCode")
    private String countryCode;

    @JsonProperty("countryGroupCode")
    private String countryGroupCode;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isDefaultOpted")
    private Boolean isDefaultOpted;

    @JsonProperty("isDefaultSelection")
    private Boolean isDefaultSelection;

    @JsonProperty("isMandatory")
    private Boolean isMandatory;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("policyVersions")
    private List<PolicyVersionObject> policyVersions;

    @JsonProperty("readableId")
    private String readableId;

    @JsonProperty("shouldNotifyOnUpdate")
    private Boolean shouldNotifyOnUpdate;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public RetrievePolicyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<RetrievePolicyResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyResponse>>() {});
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
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
public class RetrieveUserEligibilitiesResponse extends Model {

    @JsonProperty("baseUrls")
    List<String> baseUrls;
    @JsonProperty("countryCode")
    String countryCode;
    @JsonProperty("countryGroupCode")
    String countryGroupCode;
    @JsonProperty("description")
    String description;
    @JsonProperty("isAccepted")
    Boolean isAccepted;
    @JsonProperty("isMandatory")
    Boolean isMandatory;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("policyId")
    String policyId;
    @JsonProperty("policyName")
    String policyName;
    @JsonProperty("policyType")
    String policyType;
    @JsonProperty("policyVersions")
    List<PolicyVersionWithLocalizedVersionObject> policyVersions;
    @JsonProperty("readableId")
    String readableId;

    public RetrieveUserEligibilitiesResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("baseUrls", "baseUrls");
        result.put("countryCode", "countryCode");
        result.put("countryGroupCode", "countryGroupCode");
        result.put("description", "description");
        result.put("isAccepted", "isAccepted");
        result.put("isMandatory", "isMandatory");
        result.put("namespace", "namespace");
        result.put("policyId", "policyId");
        result.put("policyName", "policyName");
        result.put("policyType", "policyType");
        result.put("policyVersions", "policyVersions");
        result.put("readableId", "readableId");
        return result;
    }
}
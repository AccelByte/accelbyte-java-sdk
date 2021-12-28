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
public class LegalAcceptedPoliciesRequest extends Model {

    @JsonProperty("isAccepted")
    Boolean isAccepted;
    @JsonProperty("localizedPolicyVersionId")
    String localizedPolicyVersionId;
    @JsonProperty("policyId")
    String policyId;
    @JsonProperty("policyVersionId")
    String policyVersionId;

    public LegalAcceptedPoliciesRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("isAccepted", "isAccepted");
        result.put("localizedPolicyVersionId", "localizedPolicyVersionId");
        result.put("policyId", "policyId");
        result.put("policyVersionId", "policyVersionId");
        return result;
    }
}
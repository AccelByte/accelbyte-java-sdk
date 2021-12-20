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
public class RetrieveAcceptedAgreementResponse extends Model {

    @JsonProperty("countryCode")
    String countryCode;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("displayVersion")
    String displayVersion;
    @JsonProperty("id")
    String id;
    @JsonProperty("isAccepted")
    Boolean isAccepted;
    @JsonProperty("localizedPolicyVersion")
    LocalizedPolicyVersionObject localizedPolicyVersion;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("policyId")
    String policyId;
    @JsonProperty("policyName")
    String policyName;
    @JsonProperty("policyType")
    String policyType;
    @JsonProperty("signingDate")
    String signingDate;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public RetrieveAcceptedAgreementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countryCode", "countryCode");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("displayVersion", "displayVersion");
        result.put("id", "id");
        result.put("isAccepted", "isAccepted");
        result.put("localizedPolicyVersion", "localizedPolicyVersion");
        result.put("namespace", "namespace");
        result.put("policyId", "policyId");
        result.put("policyName", "policyName");
        result.put("policyType", "policyType");
        result.put("signingDate", "signingDate");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
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
public class RetrieveUserAcceptedAgreementResponse extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("email")
    String email;
    @JsonProperty("id")
    String id;
    @JsonProperty("isAccepted")
    Boolean isAccepted;
    @JsonProperty("localizedPolicyVersion")
    LocalizedPolicyVersionObject localizedPolicyVersion;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("policyName")
    String policyName;
    @JsonProperty("policyType")
    String policyType;
    @JsonProperty("publisherUserId")
    String publisherUserId;
    @JsonProperty("signingDate")
    String signingDate;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("username")
    String username;

    public RetrieveUserAcceptedAgreementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("displayName", "displayName");
        result.put("email", "email");
        result.put("id", "id");
        result.put("isAccepted", "isAccepted");
        result.put("localizedPolicyVersion", "localizedPolicyVersion");
        result.put("namespace", "namespace");
        result.put("policyName", "policyName");
        result.put("policyType", "policyType");
        result.put("publisherUserId", "publisherUserId");
        result.put("signingDate", "signingDate");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("username", "username");
        return result;
    }
}
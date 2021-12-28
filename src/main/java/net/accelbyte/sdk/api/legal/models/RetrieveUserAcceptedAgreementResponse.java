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
public class RetrieveUserAcceptedAgreementResponse extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("email")
    private String email;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isAccepted")
    private Boolean isAccepted;

    @JsonProperty("localizedPolicyVersion")
    private LocalizedPolicyVersionObject localizedPolicyVersion;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("policyType")
    private String policyType;

    @JsonProperty("publisherUserId")
    private String publisherUserId;

    @JsonProperty("signingDate")
    private String signingDate;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("username")
    private String username;

    public RetrieveUserAcceptedAgreementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<RetrieveUserAcceptedAgreementResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveUserAcceptedAgreementResponse>>() {});
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
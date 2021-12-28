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
public class RetrieveLocalizedPolicyVersionPublicResponse extends Model {

    @JsonProperty("attachmentChecksum")
    private String attachmentChecksum;

    @JsonProperty("attachmentLocation")
    private String attachmentLocation;

    @JsonProperty("attachmentVersionIdentifier")
    private String attachmentVersionIdentifier;

    @JsonProperty("basePolicyId")
    private String basePolicyId;

    @JsonProperty("baseUrls")
    private List<String> baseUrls;

    @JsonProperty("contentType")
    private String contentType;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("localeCode")
    private String localeCode;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policy")
    private PolicyObject policy;

    @JsonProperty("policyVersion")
    private PolicyVersionObject policyVersion;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public RetrieveLocalizedPolicyVersionPublicResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<RetrieveLocalizedPolicyVersionPublicResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveLocalizedPolicyVersionPublicResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attachmentChecksum", "attachmentChecksum");
        result.put("attachmentLocation", "attachmentLocation");
        result.put("attachmentVersionIdentifier", "attachmentVersionIdentifier");
        result.put("basePolicyId", "basePolicyId");
        result.put("baseUrls", "baseUrls");
        result.put("contentType", "contentType");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("id", "id");
        result.put("localeCode", "localeCode");
        result.put("namespace", "namespace");
        result.put("policy", "policy");
        result.put("policyVersion", "policyVersion");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
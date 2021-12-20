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
public class RetrieveLocalizedPolicyVersionPublicResponse extends Model {

    @JsonProperty("attachmentChecksum")
    String attachmentChecksum;
    @JsonProperty("attachmentLocation")
    String attachmentLocation;
    @JsonProperty("attachmentVersionIdentifier")
    String attachmentVersionIdentifier;
    @JsonProperty("basePolicyId")
    String basePolicyId;
    @JsonProperty("baseUrls")
    List<String> baseUrls;
    @JsonProperty("contentType")
    String contentType;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("id")
    String id;
    @JsonProperty("localeCode")
    String localeCode;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("policy")
    PolicyObject policy;
    @JsonProperty("policyVersion")
    PolicyVersionObject policyVersion;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("updatedAt")
    String updatedAt;

    public RetrieveLocalizedPolicyVersionPublicResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
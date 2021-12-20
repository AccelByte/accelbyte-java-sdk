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
public class RetrieveBasePolicyResponse extends Model {

    @JsonProperty("affectedClientIds")
    List<String> affectedClientIds;
    @JsonProperty("basePolicyName")
    String basePolicyName;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("policies")
    List<PolicyObject> policies;
    @JsonProperty("policyTypeId")
    String policyTypeId;
    @JsonProperty("policyTypeName")
    String policyTypeName;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("updatedAt")
    String updatedAt;

    public RetrieveBasePolicyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("affectedClientIds", "affectedClientIds");
        result.put("basePolicyName", "basePolicyName");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("policies", "policies");
        result.put("policyTypeId", "policyTypeId");
        result.put("policyTypeName", "policyTypeName");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
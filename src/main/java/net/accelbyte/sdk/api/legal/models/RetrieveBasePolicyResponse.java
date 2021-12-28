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
public class RetrieveBasePolicyResponse extends Model {

    @JsonProperty("affectedClientIds")
    private List<String> affectedClientIds;

    @JsonProperty("basePolicyName")
    private String basePolicyName;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policies")
    private List<PolicyObject> policies;

    @JsonProperty("policyTypeId")
    private String policyTypeId;

    @JsonProperty("policyTypeName")
    private String policyTypeName;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public RetrieveBasePolicyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<RetrieveBasePolicyResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveBasePolicyResponse>>() {});
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
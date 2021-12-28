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
public class CreateBasePolicyResponse extends Model {

    @JsonProperty("affectedClientIds")
    private List<String> affectedClientIds;

    @JsonProperty("affectedCountries")
    private List<String> affectedCountries;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("globalPolicyName")
    private String globalPolicyName;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policyId")
    private String policyId;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("typeId")
    private String typeId;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public CreateBasePolicyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<CreateBasePolicyResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CreateBasePolicyResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("affectedClientIds", "affectedClientIds");
        result.put("affectedCountries", "affectedCountries");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("globalPolicyName", "globalPolicyName");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("policyId", "policyId");
        result.put("tags", "tags");
        result.put("typeId", "typeId");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
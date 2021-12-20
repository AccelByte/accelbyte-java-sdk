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
public class CreateBasePolicyResponse extends Model {

    @JsonProperty("affectedClientIds")
    List<String> affectedClientIds;
    @JsonProperty("affectedCountries")
    List<String> affectedCountries;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("globalPolicyName")
    String globalPolicyName;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("policyId")
    String policyId;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("typeId")
    String typeId;
    @JsonProperty("updatedAt")
    String updatedAt;

    public CreateBasePolicyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
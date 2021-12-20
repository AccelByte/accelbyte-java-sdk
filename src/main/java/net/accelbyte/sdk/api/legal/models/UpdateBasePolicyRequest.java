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
public class UpdateBasePolicyRequest extends Model {

    @JsonProperty("affectedClientIds")
    List<String> affectedClientIds;
    @JsonProperty("affectedCountries")
    List<String> affectedCountries;
    @JsonProperty("basePolicyName")
    String basePolicyName;
    @JsonProperty("description")
    String description;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("tags")
    List<String> tags;

    public UpdateBasePolicyRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("affectedClientIds", "affectedClientIds");
        result.put("affectedCountries", "affectedCountries");
        result.put("basePolicyName", "basePolicyName");
        result.put("description", "description");
        result.put("namespace", "namespace");
        result.put("tags", "tags");
        return result;
    }
}
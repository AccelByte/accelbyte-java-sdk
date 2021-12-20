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
public class RetrievePolicyTypeResponse extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("id")
    String id;
    @JsonProperty("isNeedDocument")
    Boolean isNeedDocument;
    @JsonProperty("policyTypeName")
    String policyTypeName;
    @JsonProperty("updatedAt")
    String updatedAt;

    public RetrievePolicyTypeResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("id", "id");
        result.put("isNeedDocument", "isNeedDocument");
        result.put("policyTypeName", "policyTypeName");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
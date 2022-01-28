package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccountcommonRegisteredDomain extends Model {

    @JsonProperty("affectedClientIDs")
    private List<String> affectedClientIDs;

    @JsonProperty("domain")
    private String domain;

    @JsonProperty("namespaces")
    private List<String> namespaces;

    @JsonProperty("roleId")
    private String roleId;

    @JsonIgnore
    public AccountcommonRegisteredDomain createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AccountcommonRegisteredDomain> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonRegisteredDomain>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("affectedClientIDs", "affectedClientIDs");
        result.put("domain", "domain");
        result.put("namespaces", "namespaces");
        result.put("roleId", "roleId");
        return result;
    }
}
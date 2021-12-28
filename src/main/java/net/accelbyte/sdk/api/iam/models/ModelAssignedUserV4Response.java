package net.accelbyte.sdk.api.iam.models;

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
public class ModelAssignedUserV4Response extends Model {

    @JsonProperty("assignedNamespaces")
    private List<String> assignedNamespaces;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("email")
    private String email;

    @JsonProperty("roleId")
    private String roleId;

    @JsonProperty("userId")
    private String userId;

    public ModelAssignedUserV4Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelAssignedUserV4Response> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelAssignedUserV4Response>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("assignedNamespaces", "assignedNamespaces");
        result.put("displayName", "displayName");
        result.put("email", "email");
        result.put("roleId", "roleId");
        result.put("userId", "userId");
        return result;
    }
}
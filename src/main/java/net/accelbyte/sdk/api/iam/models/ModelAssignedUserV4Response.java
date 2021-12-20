package net.accelbyte.sdk.api.iam.models;

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
public class ModelAssignedUserV4Response extends Model {

    @JsonProperty("assignedNamespaces")
    List<String> assignedNamespaces;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("email")
    String email;
    @JsonProperty("roleId")
    String roleId;
    @JsonProperty("userId")
    String userId;

    public ModelAssignedUserV4Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
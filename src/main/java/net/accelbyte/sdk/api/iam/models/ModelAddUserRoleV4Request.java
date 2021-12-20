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
public class ModelAddUserRoleV4Request extends Model {

    @JsonProperty("assignedNamespaces")
    List<String> assignedNamespaces;
    @JsonProperty("roleId")
    String roleId;

    public ModelAddUserRoleV4Request createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("assignedNamespaces", "assignedNamespaces");
        result.put("roleId", "roleId");
        return result;
    }
}
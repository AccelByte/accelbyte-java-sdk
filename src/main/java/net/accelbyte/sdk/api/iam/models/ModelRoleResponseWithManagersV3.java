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
public class ModelRoleResponseWithManagersV3 extends Model {

    @JsonProperty("adminRole")
    Boolean adminRole;
    @JsonProperty("isWildcard")
    Boolean isWildcard;
    @JsonProperty("managers")
    List<AccountcommonRoleManagerV3> managers;
    @JsonProperty("permissions")
    List<AccountcommonPermissionV3> permissions;
    @JsonProperty("roleId")
    String roleId;
    @JsonProperty("roleName")
    String roleName;

    public ModelRoleResponseWithManagersV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("adminRole", "adminRole");
        result.put("isWildcard", "isWildcard");
        result.put("managers", "managers");
        result.put("permissions", "permissions");
        result.put("roleId", "roleId");
        result.put("roleName", "roleName");
        return result;
    }
}
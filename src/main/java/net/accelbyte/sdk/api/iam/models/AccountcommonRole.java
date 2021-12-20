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
public class AccountcommonRole extends Model {

    @JsonProperty("AdminRole")
    Boolean adminRole;
    @JsonProperty("IsWildcard")
    Boolean isWildcard;
    @JsonProperty("Managers")
    List<AccountcommonRoleManager> managers;
    @JsonProperty("Members")
    List<AccountcommonRoleMember> members;
    @JsonProperty("Permissions")
    List<AccountcommonPermission> permissions;
    @JsonProperty("RoleId")
    String roleId;
    @JsonProperty("RoleName")
    String roleName;

    public AccountcommonRole createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AdminRole", "adminRole");
        result.put("IsWildcard", "isWildcard");
        result.put("Managers", "managers");
        result.put("Members", "members");
        result.put("Permissions", "permissions");
        result.put("RoleId", "roleId");
        result.put("RoleName", "roleName");
        return result;
    }
}
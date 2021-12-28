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
public class AccountcommonRole extends Model {

    @JsonProperty("AdminRole")
    private Boolean adminRole;

    @JsonProperty("IsWildcard")
    private Boolean isWildcard;

    @JsonProperty("Managers")
    private List<AccountcommonRoleManager> managers;

    @JsonProperty("Members")
    private List<AccountcommonRoleMember> members;

    @JsonProperty("Permissions")
    private List<AccountcommonPermission> permissions;

    @JsonProperty("RoleId")
    private String roleId;

    @JsonProperty("RoleName")
    private String roleName;

    public AccountcommonRole createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AccountcommonRole> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonRole>>() {});
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
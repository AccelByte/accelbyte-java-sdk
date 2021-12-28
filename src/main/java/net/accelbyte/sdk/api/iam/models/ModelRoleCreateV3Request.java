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
public class ModelRoleCreateV3Request extends Model {

    @JsonProperty("adminRole")
    private Boolean adminRole;

    @JsonProperty("isWildcard")
    private Boolean isWildcard;

    @JsonProperty("managers")
    private List<AccountcommonRoleManagerV3> managers;

    @JsonProperty("members")
    private List<AccountcommonRoleMemberV3> members;

    @JsonProperty("permissions")
    private List<AccountcommonPermissionV3> permissions;

    @JsonProperty("roleName")
    private String roleName;

    public ModelRoleCreateV3Request createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelRoleCreateV3Request> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelRoleCreateV3Request>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("adminRole", "adminRole");
        result.put("isWildcard", "isWildcard");
        result.put("managers", "managers");
        result.put("members", "members");
        result.put("permissions", "permissions");
        result.put("roleName", "roleName");
        return result;
    }
}
package net.accelbyte.sdk.api.group.models;

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
public class ModelsGetMemberRoleResponseV1 extends Model {

    @JsonProperty("memberRoleId")
    String memberRoleId;
    @JsonProperty("memberRoleName")
    String memberRoleName;
    @JsonProperty("memberRolePermissions")
    List<ModelsRolePermission> memberRolePermissions;

    public ModelsGetMemberRoleResponseV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("memberRoleId", "memberRoleId");
        result.put("memberRoleName", "memberRoleName");
        result.put("memberRolePermissions", "memberRolePermissions");
        return result;
    }
}
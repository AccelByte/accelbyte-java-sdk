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
public class ModelsUpdateGroupConfigurationResponseV1 extends Model {

    @JsonProperty("configurationCode")
    String configurationCode;
    @JsonProperty("description")
    String description;
    @JsonProperty("globalRules")
    List<ModelsRule> globalRules;
    @JsonProperty("groupAdminRoleId")
    String groupAdminRoleId;
    @JsonProperty("groupMaxMember")
    Integer groupMaxMember;
    @JsonProperty("groupMemberRoleId")
    String groupMemberRoleId;
    @JsonProperty("name")
    String name;

    public ModelsUpdateGroupConfigurationResponseV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("configurationCode", "configurationCode");
        result.put("description", "description");
        result.put("globalRules", "globalRules");
        result.put("groupAdminRoleId", "groupAdminRoleId");
        result.put("groupMaxMember", "groupMaxMember");
        result.put("groupMemberRoleId", "groupMemberRoleId");
        result.put("name", "name");
        return result;
    }
}
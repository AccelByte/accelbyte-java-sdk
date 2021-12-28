package net.accelbyte.sdk.api.group.models;

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
public class ModelsGetGroupConfigurationResponseV1 extends Model {

    @JsonProperty("configurationCode")
    private String configurationCode;

    @JsonProperty("description")
    private String description;

    @JsonProperty("globalRules")
    private List<ModelsRule> globalRules;

    @JsonProperty("groupAdminRoleId")
    private String groupAdminRoleId;

    @JsonProperty("groupMaxMember")
    private Integer groupMaxMember;

    @JsonProperty("groupMemberRoleId")
    private String groupMemberRoleId;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    public ModelsGetGroupConfigurationResponseV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsGetGroupConfigurationResponseV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGetGroupConfigurationResponseV1>>() {});
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
        result.put("namespace", "namespace");
        return result;
    }
}
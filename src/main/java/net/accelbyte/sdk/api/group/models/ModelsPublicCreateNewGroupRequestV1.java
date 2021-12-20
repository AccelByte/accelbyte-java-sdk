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
public class ModelsPublicCreateNewGroupRequestV1 extends Model {

    @JsonProperty("configurationCode")
    String configurationCode;
    @JsonProperty("customAttributes")
    Map<String, ?> customAttributes;
    @JsonProperty("groupDescription")
    String groupDescription;
    @JsonProperty("groupIcon")
    String groupIcon;
    @JsonProperty("groupMaxMember")
    Integer groupMaxMember;
    @JsonProperty("groupName")
    String groupName;
    @JsonProperty("groupRegion")
    String groupRegion;
    @JsonProperty("groupRules")
    ModelsGroupRule groupRules;
    @JsonProperty("groupType")
    String groupType;

    public ModelsPublicCreateNewGroupRequestV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("configurationCode", "configurationCode");
        result.put("customAttributes", "customAttributes");
        result.put("groupDescription", "groupDescription");
        result.put("groupIcon", "groupIcon");
        result.put("groupMaxMember", "groupMaxMember");
        result.put("groupName", "groupName");
        result.put("groupRegion", "groupRegion");
        result.put("groupRules", "groupRules");
        result.put("groupType", "groupType");
        return result;
    }
}
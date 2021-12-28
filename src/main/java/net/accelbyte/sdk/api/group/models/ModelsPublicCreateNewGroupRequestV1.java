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
public class ModelsPublicCreateNewGroupRequestV1 extends Model {

    @JsonProperty("configurationCode")
    private String configurationCode;

    @JsonProperty("customAttributes")
    private Map<String, ?> customAttributes;

    @JsonProperty("groupDescription")
    private String groupDescription;

    @JsonProperty("groupIcon")
    private String groupIcon;

    @JsonProperty("groupMaxMember")
    private Integer groupMaxMember;

    @JsonProperty("groupName")
    private String groupName;

    @JsonProperty("groupRegion")
    private String groupRegion;

    @JsonProperty("groupRules")
    private ModelsGroupRule groupRules;

    @JsonProperty("groupType")
    private String groupType;

    public ModelsPublicCreateNewGroupRequestV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsPublicCreateNewGroupRequestV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPublicCreateNewGroupRequestV1>>() {});
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
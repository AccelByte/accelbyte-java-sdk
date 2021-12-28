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
public class ModelsGroupRule extends Model {

    @JsonProperty("groupCustomRule")
    private ModelsGroupRuleGroupCustomRule groupCustomRule;

    @JsonProperty("groupPredefinedRules")
    private List<ModelsRule> groupPredefinedRules;

    public ModelsGroupRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsGroupRule> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGroupRule>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("groupCustomRule", "groupCustomRule");
        result.put("groupPredefinedRules", "groupPredefinedRules");
        return result;
    }
}
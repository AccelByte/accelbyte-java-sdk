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
public class ModelsGroupRuleGroupCustomRule extends Model {

    public ModelsGroupRuleGroupCustomRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsGroupRuleGroupCustomRule> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGroupRuleGroupCustomRule>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        return result;
    }
}
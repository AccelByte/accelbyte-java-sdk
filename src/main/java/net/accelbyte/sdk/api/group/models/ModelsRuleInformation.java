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
public class ModelsRuleInformation extends Model {

    @JsonProperty("ruleAttribute")
    private String ruleAttribute;

    @JsonProperty("ruleCriteria")
    private String ruleCriteria;

    @JsonProperty("ruleValue")
    private Float ruleValue;

    public ModelsRuleInformation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsRuleInformation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleInformation>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ruleAttribute", "ruleAttribute");
        result.put("ruleCriteria", "ruleCriteria");
        result.put("ruleValue", "ruleValue");
        return result;
    }
}
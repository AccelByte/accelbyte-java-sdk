package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsRuleSetV1 extends Model {

    @JsonProperty("alliance")
    private ModelsAllianceRuleV1 alliance;

    @JsonProperty("alliance_flexing_rule")
    private List<ModelsAllianceFlexingRule> allianceFlexingRule;

    @JsonProperty("flexingRules")
    private List<ModelsFlexingRule> flexingRules;

    @JsonProperty("match_options")
    private ModelsMatchOptionRule matchOptions;

    @JsonProperty("matchingRules")
    private List<ModelsMatchingRule> matchingRules;

    @JsonProperty("sub_game_modes")
    private Map<String, ModelsSubGameMode> subGameModes;

    public ModelsRuleSetV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsRuleSetV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleSetV1>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("alliance", "alliance");
        result.put("alliance_flexing_rule", "allianceFlexingRule");
        result.put("flexingRules", "flexingRules");
        result.put("match_options", "matchOptions");
        result.put("matchingRules", "matchingRules");
        result.put("sub_game_modes", "subGameModes");
        return result;
    }
}
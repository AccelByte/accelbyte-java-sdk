/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.matchmaking.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModelsRuleSet extends Model {

    @JsonProperty("alliance")
    private ModelsAllianceRule alliance;

    @JsonProperty("alliance_flexing_rule")
    private List<ModelsAllianceFlexingRule> allianceFlexingRule;

    @JsonProperty("flexing_rule")
    private List<ModelsFlexingRule> flexingRule;

    @JsonProperty("match_options")
    private ModelsMatchOptionRule matchOptions;

    @JsonProperty("matching_rule")
    private List<ModelsMatchingRule> matchingRule;

    @JsonProperty("sub_game_modes")
    private Map<String, ModelsSubGameMode> subGameModes;

    @JsonIgnore
    public ModelsRuleSet createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsRuleSet> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleSet>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("alliance", "alliance");
        result.put("alliance_flexing_rule", "allianceFlexingRule");
        result.put("flexing_rule", "flexingRule");
        result.put("match_options", "matchOptions");
        result.put("matching_rule", "matchingRule");
        result.put("sub_game_modes", "subGameModes");
        return result;
    }
}
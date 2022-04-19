/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsUpdateRuleset extends Model {

    @JsonProperty("alliance")
    private ModelsUpdateAllianceRule alliance;

    @JsonProperty("alliance_flexing_rule")
    private List<ModelsAllianceFlexingRule> allianceFlexingRule;

    @JsonProperty("flexingRules")
    private List<ModelsFlexingRule> flexingRules;

    @JsonProperty("match_options")
    private ModelsMatchOptionRule matchOptions;

    @JsonProperty("matchingRules")
    private List<ModelsMatchingRule> matchingRules;

    @JsonProperty("sub_game_modes")
    private ModelsUpdateRulesetSubGameModes subGameModes;

    @JsonIgnore
    public ModelsUpdateRuleset createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsUpdateRuleset> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdateRuleset>>() {});
    }

    @JsonIgnore
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
/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsUpdateRuleset extends Model {

  @JsonProperty("alliance")
  private ModelsUpdateAllianceRule alliance;

  @JsonProperty("alliance_flexing_rule")
  private List<ModelsAllianceFlexingRule> allianceFlexingRule;

  @JsonProperty("flexingRules")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsFlexingRule> flexingRules;

  @JsonProperty("match_options")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsMatchOptionRule matchOptions;

  @JsonProperty("matchingRules")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsMatchingRule> matchingRules;

  @JsonProperty("sub_game_modes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsUpdateRulesetSubGameModes subGameModes;

  @JsonIgnore
  public ModelsUpdateRuleset createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsUpdateRuleset> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdateRuleset>>() {});
  }
}

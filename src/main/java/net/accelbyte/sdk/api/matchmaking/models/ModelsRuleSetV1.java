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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsRuleSetV1 extends Model {

  @JsonProperty("alliance")
  private ModelsAllianceRuleV1 alliance;

  @JsonProperty("alliance_flexing_rule")
  private List<ModelsAllianceFlexingRule> allianceFlexingRule;

  @JsonProperty("bucket_mmr_rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsBucketMMRRule bucketMmrRule;

  @JsonProperty("flexingRules")
  private List<ModelsFlexingRule> flexingRules;

  @JsonProperty("match_options")
  private ModelsMatchOptionRule matchOptions;

  @JsonProperty("matchingRules")
  private List<ModelsMatchingRule> matchingRules;

  @JsonProperty("sub_game_modes")
  private Map<String, ModelsSubGameMode> subGameModes;

  @JsonProperty("use_newest_ticket_for_flexing")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useNewestTicketForFlexing;

  @JsonIgnore
  public ModelsRuleSetV1 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsRuleSetV1> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleSetV1>>() {});
  }
}

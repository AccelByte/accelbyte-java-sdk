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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsAllianceRuleV1 alliance;

  @JsonProperty("alliance_flexing_rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsAllianceFlexingRule> allianceFlexingRule;

  @JsonProperty("batch_size")
  private Integer batchSize;

  @JsonProperty("bucket_mmr_rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsBucketMMRRule bucketMmrRule;

  @JsonProperty("flexingRules")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsFlexingRule> flexingRules;

  @JsonProperty("match_options")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsMatchOptionRule matchOptions;

  @JsonProperty("matchingRules")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsMatchingRule> matchingRules;

  @JsonProperty("sort_ticket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsSortTicket sortTicket;

  @JsonProperty("sort_tickets")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsSortTicketRule> sortTickets;

  @JsonProperty("sub_game_modes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ModelsSubGameMode> subGameModes;

  @JsonProperty("ticket_flexing_selection")
  private String ticketFlexingSelection;

  @JsonProperty("ticket_flexing_selections")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsSelectionRule> ticketFlexingSelections;

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

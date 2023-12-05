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

  @JsonProperty("batch_size")
  private Integer batchSize;

  @JsonProperty("bucket_mmr_rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsBucketMMRRule bucketMmrRule;

  @JsonProperty("flexingRules")
  private List<ModelsFlexingRule> flexingRules;

  @JsonProperty("match_options")
  private ModelsMatchOptionRule matchOptions;

  @JsonProperty("matchingRules")
  private List<ModelsMatchingRule> matchingRules;

  @JsonProperty("sort_ticket")
  private ModelsSortTicket sortTicket;

  @JsonProperty("sort_tickets")
  private List<ModelsSortTicketRule> sortTickets;

  @JsonProperty("sub_game_modes")
  private Map<String, ModelsSubGameMode> subGameModes;

  @JsonProperty("ticket_flexing_selection")
  private String ticketFlexingSelection;

  @JsonProperty("ticket_flexing_selections")
  private List<ModelsSelectionRule> ticketFlexingSelections;

  @JsonProperty("use_newest_ticket_for_flexing")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useNewestTicketForFlexing;

  @JsonIgnore
  public String getTicketFlexingSelection() {
    return this.ticketFlexingSelection;
  }

  @JsonIgnore
  public TicketFlexingSelection getTicketFlexingSelectionAsEnum() {
    return TicketFlexingSelection.valueOf(this.ticketFlexingSelection);
  }

  @JsonIgnore
  public void setTicketFlexingSelection(final String ticketFlexingSelection) {
    this.ticketFlexingSelection = ticketFlexingSelection;
  }

  @JsonIgnore
  public void setTicketFlexingSelectionFromEnum(
      final TicketFlexingSelection ticketFlexingSelection) {
    this.ticketFlexingSelection = ticketFlexingSelection.toString();
  }

  @JsonIgnore
  public ModelsRuleSetV1 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsRuleSetV1> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleSetV1>>() {});
  }

  public enum TicketFlexingSelection {
    Newest("newest"),
    Oldest("oldest"),
    Pivot("pivot"),
    Random("random");

    private String value;

    TicketFlexingSelection(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsRuleSetV1Builder {
    private String ticketFlexingSelection;

    public ModelsRuleSetV1Builder ticketFlexingSelection(final String ticketFlexingSelection) {
      this.ticketFlexingSelection = ticketFlexingSelection;
      return this;
    }

    public ModelsRuleSetV1Builder ticketFlexingSelectionFromEnum(
        final TicketFlexingSelection ticketFlexingSelection) {
      this.ticketFlexingSelection = ticketFlexingSelection.toString();
      return this;
    }
  }
}

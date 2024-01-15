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
public class ModelsChannelRequest extends Model {

  @JsonProperty("blocked_player_option")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String blockedPlayerOption;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("description")
  private String description;

  @JsonProperty("find_match_timeout_seconds")
  private Integer findMatchTimeoutSeconds;

  @JsonProperty("game_mode")
  private String gameMode;

  @JsonProperty("joinable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean joinable;

  @JsonProperty("max_delay_ms")
  private Integer maxDelayMs;

  @JsonProperty("region_expansion_range_ms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer regionExpansionRangeMs;

  @JsonProperty("region_expansion_rate_ms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer regionExpansionRateMs;

  @JsonProperty("region_latency_initial_range_ms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer regionLatencyInitialRangeMs;

  @JsonProperty("region_latency_max_ms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer regionLatencyMaxMs;

  @JsonProperty("rule_set")
  private ModelsRuleSet ruleSet;

  @JsonProperty("session_queue_timeout_seconds")
  private Integer sessionQueueTimeoutSeconds;

  @JsonProperty("social_matchmaking")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean socialMatchmaking;

  @JsonProperty("sub_gamemode_selection")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subGamemodeSelection;

  @JsonProperty("ticket_observability_enable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean ticketObservabilityEnable;

  @JsonProperty("use_sub_gamemode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useSubGamemode;

  @JsonIgnore
  public String getBlockedPlayerOption() {
    return this.blockedPlayerOption;
  }

  @JsonIgnore
  public BlockedPlayerOption getBlockedPlayerOptionAsEnum() {
    return BlockedPlayerOption.valueOf(this.blockedPlayerOption);
  }

  @JsonIgnore
  public void setBlockedPlayerOption(final String blockedPlayerOption) {
    this.blockedPlayerOption = blockedPlayerOption;
  }

  @JsonIgnore
  public void setBlockedPlayerOptionFromEnum(final BlockedPlayerOption blockedPlayerOption) {
    this.blockedPlayerOption = blockedPlayerOption.toString();
  }

  @JsonIgnore
  public String getSubGamemodeSelection() {
    return this.subGamemodeSelection;
  }

  @JsonIgnore
  public SubGamemodeSelection getSubGamemodeSelectionAsEnum() {
    return SubGamemodeSelection.valueOf(this.subGamemodeSelection);
  }

  @JsonIgnore
  public void setSubGamemodeSelection(final String subGamemodeSelection) {
    this.subGamemodeSelection = subGamemodeSelection;
  }

  @JsonIgnore
  public void setSubGamemodeSelectionFromEnum(final SubGamemodeSelection subGamemodeSelection) {
    this.subGamemodeSelection = subGamemodeSelection.toString();
  }

  @JsonIgnore
  public ModelsChannelRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsChannelRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChannelRequest>>() {});
  }

  public enum BlockedPlayerOption {
    BlockedPlayerCanMatch("blockedPlayerCanMatch"),
    BlockedPlayerCanMatchOnDifferentTeam("blockedPlayerCanMatchOnDifferentTeam"),
    BlockedPlayerCannotMatch("blockedPlayerCannotMatch");

    private String value;

    BlockedPlayerOption(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SubGamemodeSelection {
    Random("random"),
    TicketOrder("ticketOrder");

    private String value;

    SubGamemodeSelection(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsChannelRequestBuilder {
    private String blockedPlayerOption;
    private String subGamemodeSelection;

    public ModelsChannelRequestBuilder blockedPlayerOption(final String blockedPlayerOption) {
      this.blockedPlayerOption = blockedPlayerOption;
      return this;
    }

    public ModelsChannelRequestBuilder blockedPlayerOptionFromEnum(
        final BlockedPlayerOption blockedPlayerOption) {
      this.blockedPlayerOption = blockedPlayerOption.toString();
      return this;
    }

    public ModelsChannelRequestBuilder subGamemodeSelection(final String subGamemodeSelection) {
      this.subGamemodeSelection = subGamemodeSelection;
      return this;
    }

    public ModelsChannelRequestBuilder subGamemodeSelectionFromEnum(
        final SubGamemodeSelection subGamemodeSelection) {
      this.subGamemodeSelection = subGamemodeSelection.toString();
      return this;
    }
  }
}

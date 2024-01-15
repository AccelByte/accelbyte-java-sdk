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
public class ModelsCreateChannelResponse extends Model {

  @JsonProperty("blocked_player_option")
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
  private Boolean joinable;

  @JsonProperty("max_delay_ms")
  private Integer maxDelayMs;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("region_expansion_range_ms")
  private Integer regionExpansionRangeMs;

  @JsonProperty("region_expansion_rate_ms")
  private Integer regionExpansionRateMs;

  @JsonProperty("region_latency_initial_range_ms")
  private Integer regionLatencyInitialRangeMs;

  @JsonProperty("region_latency_max_ms")
  private Integer regionLatencyMaxMs;

  @JsonProperty("ruleset")
  private ModelsRuleSet ruleset;

  @JsonProperty("session_queue_timeout_seconds")
  private Integer sessionQueueTimeoutSeconds;

  @JsonProperty("slug")
  private String slug;

  @JsonProperty("social_matchmaking")
  private Boolean socialMatchmaking;

  @JsonProperty("sub_gamemode_selection")
  private String subGamemodeSelection;

  @JsonProperty("ticket_observability_enable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean ticketObservabilityEnable;

  @JsonProperty("updated_at")
  private String updatedAt;

  @JsonProperty("use_sub_gamemode")
  private Boolean useSubGamemode;

  @JsonIgnore
  public ModelsCreateChannelResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCreateChannelResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsCreateChannelResponse>>() {});
  }
}

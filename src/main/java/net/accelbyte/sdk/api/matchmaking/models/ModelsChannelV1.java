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
public class ModelsChannelV1 extends Model {

  @JsonProperty("blocked_player_option")
  private String blockedPlayerOption;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("description")
  private String description;

  @JsonProperty("findMatchTimeoutSeconds")
  private Integer findMatchTimeoutSeconds;

  @JsonProperty("gameMode")
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

  @JsonProperty("ruleSet")
  private ModelsRuleSetV1 ruleSet;

  @JsonProperty("sessionQueueTimeoutSeconds")
  private Integer sessionQueueTimeoutSeconds;

  @JsonProperty("slug")
  private String slug;

  @JsonProperty("socialMatchmaking")
  private Boolean socialMatchmaking;

  @JsonProperty("ticket_observability_enable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean ticketObservabilityEnable;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("use_sub_gamemode")
  private Boolean useSubGamemode;

  @JsonIgnore
  public ModelsChannelV1 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsChannelV1> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChannelV1>>() {});
  }
}

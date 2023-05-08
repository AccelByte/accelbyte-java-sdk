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

  @JsonProperty("use_sub_gamemode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useSubGamemode;

  @JsonIgnore
  public ModelsChannelRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsChannelRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChannelRequest>>() {});
  }
}

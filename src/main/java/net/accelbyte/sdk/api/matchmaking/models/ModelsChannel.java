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
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsChannel extends Model {

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

  @JsonProperty("ruleset")
  private ModelsRuleSet ruleset;

  @JsonProperty("session_queue_timeout_seconds")
  private Integer sessionQueueTimeoutSeconds;

  @JsonProperty("slug")
  private String slug;

  @JsonProperty("social_matchmaking")
  private Boolean socialMatchmaking;

  @JsonProperty("updated_at")
  private String updatedAt;

  @JsonProperty("use_sub_gamemode")
  private Boolean useSubGamemode;

  @JsonIgnore
  public ModelsChannel createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsChannel> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChannel>>() {});
  }
}

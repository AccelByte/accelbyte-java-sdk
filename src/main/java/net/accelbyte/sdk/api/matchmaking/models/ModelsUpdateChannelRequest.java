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
public class ModelsUpdateChannelRequest extends Model {

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("description")
  private String description;

  @JsonProperty("findMatchTimeoutSeconds")
  private Integer findMatchTimeoutSeconds;

  @JsonProperty("joinable")
  private Boolean joinable;

  @JsonProperty("max_delay_ms")
  private Integer maxDelayMs;

  @JsonProperty("ruleSet")
  private ModelsUpdateRuleset ruleSet;

  @JsonProperty("sessionQueueTimeoutSeconds")
  private Integer sessionQueueTimeoutSeconds;

  @JsonProperty("socialMatchmaking")
  private Boolean socialMatchmaking;

  @JsonProperty("use_sub_gamemode")
  private Boolean useSubGamemode;

  @JsonIgnore
  public ModelsUpdateChannelRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsUpdateChannelRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsUpdateChannelRequest>>() {});
  }
}

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
public class ModelsAllianceFlexingRule extends Model {

  @JsonProperty("combination")
  private ModelsCombination combination;

  @JsonProperty("duration")
  private Integer duration;

  @JsonProperty("max_number")
  private Integer maxNumber;

  @JsonProperty("min_number")
  private Integer minNumber;

  @JsonProperty("player_max_number")
  private Integer playerMaxNumber;

  @JsonProperty("player_min_number")
  private Integer playerMinNumber;

  @JsonIgnore
  public ModelsAllianceFlexingRule createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsAllianceFlexingRule> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsAllianceFlexingRule>>() {});
  }
}

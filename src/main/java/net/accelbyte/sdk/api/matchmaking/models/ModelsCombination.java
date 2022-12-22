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
public class ModelsCombination extends Model {

  @JsonProperty("alliances")
  private List<ModelsCombinationAlliances> alliances;

  @JsonProperty("has_combination")
  private Boolean hasCombination;

  @JsonProperty("role_flexing_enable")
  private Boolean roleFlexingEnable;

  @JsonProperty("role_flexing_player")
  private Integer roleFlexingPlayer;

  @JsonProperty("role_flexing_second")
  private Integer roleFlexingSecond;

  @JsonIgnore
  public ModelsCombination createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCombination> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCombination>>() {});
  }
}

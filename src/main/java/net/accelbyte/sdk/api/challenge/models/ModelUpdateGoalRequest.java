/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.models;

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
public class ModelUpdateGoalRequest extends Model {

  @JsonProperty("description")
  private String description;

  @JsonProperty("isActive")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isActive;

  @JsonProperty("name")
  private String name;

  @JsonProperty("requirementGroups")
  private List<ModelRequirement> requirementGroups;

  @JsonProperty("rewards")
  private List<ModelReward> rewards;

  @JsonProperty("schedule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelGoalSchedule schedule;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonIgnore
  public ModelUpdateGoalRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUpdateGoalRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelUpdateGoalRequest>>() {});
  }
}

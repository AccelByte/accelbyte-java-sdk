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
public class ModelUpdateChallengeScheduleRequest extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonIgnore
  public String getAction() {
    return this.action;
  }

  @JsonIgnore
  public Action getActionAsEnum() {
    return Action.valueOf(this.action);
  }

  @JsonIgnore
  public void setAction(final String action) {
    this.action = action;
  }

  @JsonIgnore
  public void setActionFromEnum(final Action action) {
    this.action = action.toString();
  }

  @JsonIgnore
  public ModelUpdateChallengeScheduleRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUpdateChallengeScheduleRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelUpdateChallengeScheduleRequest>>() {});
  }

  public enum Action {
    ACCELERATE("ACCELERATE"),
    STOP("STOP");

    private String value;

    Action(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelUpdateChallengeScheduleRequestBuilder {
    private String action;

    public ModelUpdateChallengeScheduleRequestBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public ModelUpdateChallengeScheduleRequestBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }
  }
}

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
public class ModelChallengeResponse extends Model {

  @JsonProperty("activeGoalsPerRotation")
  private Integer activeGoalsPerRotation;

  @JsonProperty("assignmentRule")
  private String assignmentRule;

  @JsonProperty("code")
  private String code;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("endAfter")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer endAfter;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonProperty("goalsVisibility")
  private String goalsVisibility;

  @JsonProperty("name")
  private String name;

  @JsonProperty("repeatAfter")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer repeatAfter;

  @JsonProperty("rotation")
  private String rotation;

  @JsonProperty("startDate")
  private String startDate;

  @JsonProperty("status")
  private String status;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public String getAssignmentRule() {
    return this.assignmentRule;
  }

  @JsonIgnore
  public AssignmentRule getAssignmentRuleAsEnum() {
    return AssignmentRule.valueOf(this.assignmentRule);
  }

  @JsonIgnore
  public void setAssignmentRule(final String assignmentRule) {
    this.assignmentRule = assignmentRule;
  }

  @JsonIgnore
  public void setAssignmentRuleFromEnum(final AssignmentRule assignmentRule) {
    this.assignmentRule = assignmentRule.toString();
  }

  @JsonIgnore
  public String getGoalsVisibility() {
    return this.goalsVisibility;
  }

  @JsonIgnore
  public GoalsVisibility getGoalsVisibilityAsEnum() {
    return GoalsVisibility.valueOf(this.goalsVisibility);
  }

  @JsonIgnore
  public void setGoalsVisibility(final String goalsVisibility) {
    this.goalsVisibility = goalsVisibility;
  }

  @JsonIgnore
  public void setGoalsVisibilityFromEnum(final GoalsVisibility goalsVisibility) {
    this.goalsVisibility = goalsVisibility.toString();
  }

  @JsonIgnore
  public String getRotation() {
    return this.rotation;
  }

  @JsonIgnore
  public Rotation getRotationAsEnum() {
    return Rotation.valueOf(this.rotation);
  }

  @JsonIgnore
  public void setRotation(final String rotation) {
    this.rotation = rotation;
  }

  @JsonIgnore
  public void setRotationFromEnum(final Rotation rotation) {
    this.rotation = rotation.toString();
  }

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public ModelChallengeResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelChallengeResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelChallengeResponse>>() {});
  }

  public enum AssignmentRule {
    FIXED("FIXED"),
    RANDOMIZED("RANDOMIZED"),
    UNSCHEDULED("UNSCHEDULED");

    private String value;

    AssignmentRule(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum GoalsVisibility {
    PERIODONLY("PERIODONLY"),
    SHOWALL("SHOWALL");

    private String value;

    GoalsVisibility(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Rotation {
    DAILY("DAILY"),
    MONTHLY("MONTHLY"),
    NONE("NONE"),
    WEEKLY("WEEKLY");

    private String value;

    Rotation(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    INIT("INIT"),
    RETIRED("RETIRED"),
    TIED("TIED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelChallengeResponseBuilder {
    private String assignmentRule;
    private String goalsVisibility;
    private String rotation;
    private String status;

    public ModelChallengeResponseBuilder assignmentRule(final String assignmentRule) {
      this.assignmentRule = assignmentRule;
      return this;
    }

    public ModelChallengeResponseBuilder assignmentRuleFromEnum(
        final AssignmentRule assignmentRule) {
      this.assignmentRule = assignmentRule.toString();
      return this;
    }

    public ModelChallengeResponseBuilder goalsVisibility(final String goalsVisibility) {
      this.goalsVisibility = goalsVisibility;
      return this;
    }

    public ModelChallengeResponseBuilder goalsVisibilityFromEnum(
        final GoalsVisibility goalsVisibility) {
      this.goalsVisibility = goalsVisibility.toString();
      return this;
    }

    public ModelChallengeResponseBuilder rotation(final String rotation) {
      this.rotation = rotation;
      return this;
    }

    public ModelChallengeResponseBuilder rotationFromEnum(final Rotation rotation) {
      this.rotation = rotation.toString();
      return this;
    }

    public ModelChallengeResponseBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ModelChallengeResponseBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

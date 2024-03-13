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
public class ModelRequirement extends Model {

  @JsonProperty("operator")
  private String operator;

  @JsonProperty("predicates")
  private List<ModelPredicate> predicates;

  @JsonIgnore
  public String getOperator() {
    return this.operator;
  }

  @JsonIgnore
  public Operator getOperatorAsEnum() {
    return Operator.valueOf(this.operator);
  }

  @JsonIgnore
  public void setOperator(final String operator) {
    this.operator = operator;
  }

  @JsonIgnore
  public void setOperatorFromEnum(final Operator operator) {
    this.operator = operator.toString();
  }

  @JsonIgnore
  public ModelRequirement createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelRequirement> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelRequirement>>() {});
  }

  public enum Operator {
    AND("AND");

    private String value;

    Operator(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelRequirementBuilder {
    private String operator;

    public ModelRequirementBuilder operator(final String operator) {
      this.operator = operator;
      return this;
    }

    public ModelRequirementBuilder operatorFromEnum(final Operator operator) {
      this.operator = operator.toString();
      return this;
    }
  }
}

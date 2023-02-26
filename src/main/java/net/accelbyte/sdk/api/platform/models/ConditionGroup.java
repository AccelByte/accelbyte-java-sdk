/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class ConditionGroup extends Model {

  @JsonProperty("operator")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String operator;

  @JsonProperty("predicates")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Predicate> predicates;

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
  public ConditionGroup createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ConditionGroup> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ConditionGroup>>() {});
  }

  public enum Operator {
    And("and"),
    Or("or");

    private String value;

    Operator(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ConditionGroupBuilder {
    private String operator;

    public ConditionGroupBuilder operator(final String operator) {
      this.operator = operator;
      return this;
    }

    public ConditionGroupBuilder operatorFromEnum(final Operator operator) {
      this.operator = operator.toString();
      return this;
    }
  }
}

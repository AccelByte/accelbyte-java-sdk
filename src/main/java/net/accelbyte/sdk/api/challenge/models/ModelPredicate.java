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
public class ModelPredicate extends Model {

  @JsonProperty("matcher")
  private String matcher;

  @JsonProperty("parameterName")
  private String parameterName;

  @JsonProperty("parameterType")
  private String parameterType;

  @JsonProperty("targetValue")
  private Float targetValue;

  @JsonIgnore
  public String getMatcher() {
    return this.matcher;
  }

  @JsonIgnore
  public Matcher getMatcherAsEnum() {
    return Matcher.valueOf(this.matcher);
  }

  @JsonIgnore
  public void setMatcher(final String matcher) {
    this.matcher = matcher;
  }

  @JsonIgnore
  public void setMatcherFromEnum(final Matcher matcher) {
    this.matcher = matcher.toString();
  }

  @JsonIgnore
  public String getParameterType() {
    return this.parameterType;
  }

  @JsonIgnore
  public ParameterType getParameterTypeAsEnum() {
    return ParameterType.valueOf(this.parameterType);
  }

  @JsonIgnore
  public void setParameterType(final String parameterType) {
    this.parameterType = parameterType;
  }

  @JsonIgnore
  public void setParameterTypeFromEnum(final ParameterType parameterType) {
    this.parameterType = parameterType.toString();
  }

  @JsonIgnore
  public ModelPredicate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelPredicate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelPredicate>>() {});
  }

  public enum Matcher {
    EQUAL("EQUAL"),
    GREATERTHAN("GREATER_THAN"),
    GREATERTHANEQUAL("GREATER_THAN_EQUAL"),
    LESSTHAN("LESS_THAN"),
    LESSTHANEQUAL("LESS_THAN_EQUAL");

    private String value;

    Matcher(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum ParameterType {
    ACHIEVEMENT("ACHIEVEMENT"),
    STATISTIC("STATISTIC"),
    USERACCOUNT("USERACCOUNT");

    private String value;

    ParameterType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelPredicateBuilder {
    private String matcher;
    private String parameterType;

    public ModelPredicateBuilder matcher(final String matcher) {
      this.matcher = matcher;
      return this;
    }

    public ModelPredicateBuilder matcherFromEnum(final Matcher matcher) {
      this.matcher = matcher.toString();
      return this;
    }

    public ModelPredicateBuilder parameterType(final String parameterType) {
      this.parameterType = parameterType;
      return this;
    }

    public ModelPredicateBuilder parameterTypeFromEnum(final ParameterType parameterType) {
      this.parameterType = parameterType.toString();
      return this;
    }
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class PredicateObject extends Model {

  @JsonProperty("anyOf")
  private Integer anyOf;

  @JsonProperty("comparison")
  private String comparison;

  @JsonProperty("name")
  private String name;

  @JsonProperty("predicateType")
  private String predicateType;

  @JsonProperty("value")
  private String value;

  @JsonProperty("values")
  private List<String> values;

  @JsonIgnore
  public String getComparison() {
    return this.comparison;
  }

  @JsonIgnore
  public Comparison getComparisonAsEnum() {
    return Comparison.valueOf(this.comparison);
  }

  @JsonIgnore
  public void setComparison(final String comparison) {
    this.comparison = comparison;
  }

  @JsonIgnore
  public void setComparisonFromEnum(final Comparison comparison) {
    this.comparison = comparison.toString();
  }

  @JsonIgnore
  public String getPredicateType() {
    return this.predicateType;
  }

  @JsonIgnore
  public PredicateType getPredicateTypeAsEnum() {
    return PredicateType.valueOf(this.predicateType);
  }

  @JsonIgnore
  public void setPredicateType(final String predicateType) {
    this.predicateType = predicateType;
  }

  @JsonIgnore
  public void setPredicateTypeFromEnum(final PredicateType predicateType) {
    this.predicateType = predicateType.toString();
  }

  @JsonIgnore
  public PredicateObject createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PredicateObject> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PredicateObject>>() {});
  }

  public enum Comparison {
    Excludes("excludes"),
    Includes("includes"),
    Is("is"),
    IsGreaterThan("isGreaterThan"),
    IsGreaterThanOrEqual("isGreaterThanOrEqual"),
    IsLessThan("isLessThan"),
    IsLessThanOrEqual("isLessThanOrEqual"),
    IsNot("isNot");

    private String value;

    Comparison(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum PredicateType {
    EntitlementPredicate("EntitlementPredicate"),
    SeasonPassPredicate("SeasonPassPredicate"),
    SeasonTierPredicate("SeasonTierPredicate");

    private String value;

    PredicateType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PredicateObjectBuilder {
    private String comparison;
    private String predicateType;

    public PredicateObjectBuilder comparison(final String comparison) {
      this.comparison = comparison;
      return this;
    }

    public PredicateObjectBuilder comparisonFromEnum(final Comparison comparison) {
      this.comparison = comparison.toString();
      return this;
    }

    public PredicateObjectBuilder predicateType(final String predicateType) {
      this.predicateType = predicateType;
      return this;
    }

    public PredicateObjectBuilder predicateTypeFromEnum(final PredicateType predicateType) {
      this.predicateType = predicateType.toString();
      return this;
    }
  }
}

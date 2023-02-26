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
public class Predicate extends Model {

  @JsonProperty("anyOf")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer anyOf;

  @JsonProperty("comparison")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String comparison;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("predicateType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String predicateType;

  @JsonProperty("value")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String value;

  @JsonProperty("values")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  public Predicate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Predicate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Predicate>>() {});
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

  public static class PredicateBuilder {
    private String comparison;
    private String predicateType;

    public PredicateBuilder comparison(final String comparison) {
      this.comparison = comparison;
      return this;
    }

    public PredicateBuilder comparisonFromEnum(final Comparison comparison) {
      this.comparison = comparison.toString();
      return this;
    }

    public PredicateBuilder predicateType(final String predicateType) {
      this.predicateType = predicateType;
      return this;
    }

    public PredicateBuilder predicateTypeFromEnum(final PredicateType predicateType) {
      this.predicateType = predicateType.toString();
      return this;
    }
  }
}

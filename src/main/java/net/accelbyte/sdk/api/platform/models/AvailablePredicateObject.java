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
public class AvailablePredicateObject extends Model {

  @JsonProperty("availableComparisons")
  private List<AvailableComparisonObject> availableComparisons;

  @JsonProperty("predicateType")
  private String predicateType;

  @JsonProperty("showAnyOf")
  private Boolean showAnyOf;

  @JsonProperty("valueType")
  private String valueType;

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
  public String getValueType() {
    return this.valueType;
  }

  @JsonIgnore
  public ValueType getValueTypeAsEnum() {
    return ValueType.valueOf(this.valueType);
  }

  @JsonIgnore
  public void setValueType(final String valueType) {
    this.valueType = valueType;
  }

  @JsonIgnore
  public void setValueTypeFromEnum(final ValueType valueType) {
    this.valueType = valueType.toString();
  }

  @JsonIgnore
  public AvailablePredicateObject createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AvailablePredicateObject> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<AvailablePredicateObject>>() {});
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

  public enum ValueType {
    List("List"),
    Number("Number"),
    String("String");

    private String value;

    ValueType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AvailablePredicateObjectBuilder {
    private String predicateType;
    private String valueType;

    public AvailablePredicateObjectBuilder predicateType(final String predicateType) {
      this.predicateType = predicateType;
      return this;
    }

    public AvailablePredicateObjectBuilder predicateTypeFromEnum(
        final PredicateType predicateType) {
      this.predicateType = predicateType.toString();
      return this;
    }

    public AvailablePredicateObjectBuilder valueType(final String valueType) {
      this.valueType = valueType;
      return this;
    }

    public AvailablePredicateObjectBuilder valueTypeFromEnum(final ValueType valueType) {
      this.valueType = valueType.toString();
      return this;
    }
  }
}

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
public class AvailableComparison extends Model {

  @JsonProperty("comparison")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String comparison;

  @JsonProperty("text")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String text;

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
  public AvailableComparison createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AvailableComparison> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<AvailableComparison>>() {});
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

  public static class AvailableComparisonBuilder {
    private String comparison;

    public AvailableComparisonBuilder comparison(final String comparison) {
      this.comparison = comparison;
      return this;
    }

    public AvailableComparisonBuilder comparisonFromEnum(final Comparison comparison) {
      this.comparison = comparison.toString();
      return this;
    }
  }
}

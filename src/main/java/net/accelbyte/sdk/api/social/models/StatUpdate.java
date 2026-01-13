/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class StatUpdate extends Model {

  @JsonProperty("capCycleOverride")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean capCycleOverride;

  @JsonProperty("cycleIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> cycleIds;

  @JsonProperty("cycleOverrides")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<CycleOverrideRequest> cycleOverrides;

  @JsonProperty("defaultValue")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float defaultValue;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("globalAggregationMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String globalAggregationMethod;

  @JsonProperty("ignoreAdditionalDataOnValueRejected")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean ignoreAdditionalDataOnValueRejected;

  @JsonProperty("incrementOnly")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean incrementOnly;

  @JsonProperty("isPublic")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isPublic;

  @JsonProperty("maximum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float maximum;

  @JsonProperty("minimum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float minimum;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("setAsGlobal")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean setAsGlobal;

  @JsonProperty("setBy")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String setBy;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("visibility")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String visibility;

  @JsonIgnore
  public String getGlobalAggregationMethod() {
    return this.globalAggregationMethod;
  }

  @JsonIgnore
  public GlobalAggregationMethod getGlobalAggregationMethodAsEnum() {
    return GlobalAggregationMethod.valueOf(this.globalAggregationMethod);
  }

  @JsonIgnore
  public void setGlobalAggregationMethod(final String globalAggregationMethod) {
    this.globalAggregationMethod = globalAggregationMethod;
  }

  @JsonIgnore
  public void setGlobalAggregationMethodFromEnum(
      final GlobalAggregationMethod globalAggregationMethod) {
    this.globalAggregationMethod = globalAggregationMethod.toString();
  }

  @JsonIgnore
  public String getSetBy() {
    return this.setBy;
  }

  @JsonIgnore
  public SetBy getSetByAsEnum() {
    return SetBy.valueOf(this.setBy);
  }

  @JsonIgnore
  public void setSetBy(final String setBy) {
    this.setBy = setBy;
  }

  @JsonIgnore
  public void setSetByFromEnum(final SetBy setBy) {
    this.setBy = setBy.toString();
  }

  @JsonIgnore
  public String getVisibility() {
    return this.visibility;
  }

  @JsonIgnore
  public Visibility getVisibilityAsEnum() {
    return Visibility.valueOf(this.visibility);
  }

  @JsonIgnore
  public void setVisibility(final String visibility) {
    this.visibility = visibility;
  }

  @JsonIgnore
  public void setVisibilityFromEnum(final Visibility visibility) {
    this.visibility = visibility.toString();
  }

  @JsonIgnore
  public StatUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StatUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StatUpdate>>() {});
  }

  public enum GlobalAggregationMethod {
    LAST("LAST"),
    MAX("MAX"),
    MIN("MIN"),
    TOTAL("TOTAL");

    private String value;

    GlobalAggregationMethod(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SetBy {
    CLIENT("CLIENT"),
    SERVER("SERVER");

    private String value;

    SetBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Visibility {
    SERVERONLY("SERVERONLY"),
    SHOWALL("SHOWALL");

    private String value;

    Visibility(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class StatUpdateBuilder {
    private String globalAggregationMethod;
    private String setBy;
    private String visibility;

    public StatUpdateBuilder globalAggregationMethod(final String globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod;
      return this;
    }

    public StatUpdateBuilder globalAggregationMethodFromEnum(
        final GlobalAggregationMethod globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod.toString();
      return this;
    }

    public StatUpdateBuilder setBy(final String setBy) {
      this.setBy = setBy;
      return this;
    }

    public StatUpdateBuilder setByFromEnum(final SetBy setBy) {
      this.setBy = setBy.toString();
      return this;
    }

    public StatUpdateBuilder visibility(final String visibility) {
      this.visibility = visibility;
      return this;
    }

    public StatUpdateBuilder visibilityFromEnum(final Visibility visibility) {
      this.visibility = visibility.toString();
      return this;
    }
  }
}

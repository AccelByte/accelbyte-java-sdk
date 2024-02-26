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
public class StatInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("cycleIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> cycleIds;

  @JsonProperty("defaultValue")
  private Float defaultValue;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("globalAggregationMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String globalAggregationMethod;

  @JsonProperty("ignoreAdditionalDataOnValueRejected")
  private Boolean ignoreAdditionalDataOnValueRejected;

  @JsonProperty("incrementOnly")
  private Boolean incrementOnly;

  @JsonProperty("isPublic")
  private Boolean isPublic;

  @JsonProperty("maximum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float maximum;

  @JsonProperty("minimum")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float minimum;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("setAsGlobal")
  private Boolean setAsGlobal;

  @JsonProperty("setBy")
  private String setBy;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("updatedAt")
  private String updatedAt;

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
  public StatInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StatInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StatInfo>>() {});
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

  public enum Status {
    INIT("INIT"),
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

  public static class StatInfoBuilder {
    private String globalAggregationMethod;
    private String setBy;
    private String status;

    public StatInfoBuilder globalAggregationMethod(final String globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod;
      return this;
    }

    public StatInfoBuilder globalAggregationMethodFromEnum(
        final GlobalAggregationMethod globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod.toString();
      return this;
    }

    public StatInfoBuilder setBy(final String setBy) {
      this.setBy = setBy;
      return this;
    }

    public StatInfoBuilder setByFromEnum(final SetBy setBy) {
      this.setBy = setBy.toString();
      return this;
    }

    public StatInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public StatInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

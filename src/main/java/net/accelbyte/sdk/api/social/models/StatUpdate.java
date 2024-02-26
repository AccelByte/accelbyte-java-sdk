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

  @JsonProperty("cycleIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> cycleIds;

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

  @JsonProperty("isPublic")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isPublic;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

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

  public static class StatUpdateBuilder {
    private String globalAggregationMethod;

    public StatUpdateBuilder globalAggregationMethod(final String globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod;
      return this;
    }

    public StatUpdateBuilder globalAggregationMethodFromEnum(
        final GlobalAggregationMethod globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod.toString();
      return this;
    }
  }
}

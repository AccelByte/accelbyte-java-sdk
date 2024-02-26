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
public class GlobalStatItemInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("globalAggregationMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String globalAggregationMethod;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("statName")
  private String statName;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("value")
  private Float value;

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
  public GlobalStatItemInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GlobalStatItemInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<GlobalStatItemInfo>>() {});
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

  public static class GlobalStatItemInfoBuilder {
    private String globalAggregationMethod;

    public GlobalStatItemInfoBuilder globalAggregationMethod(final String globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod;
      return this;
    }

    public GlobalStatItemInfoBuilder globalAggregationMethodFromEnum(
        final GlobalAggregationMethod globalAggregationMethod) {
      this.globalAggregationMethod = globalAggregationMethod.toString();
      return this;
    }
  }
}

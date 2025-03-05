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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class FeatureReference extends Model {

  @JsonProperty("feature")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String feature;

  @JsonProperty("references")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModuleReference> references;

  @JsonIgnore
  public String getFeature() {
    return this.feature;
  }

  @JsonIgnore
  public Feature getFeatureAsEnum() {
    return Feature.valueOf(this.feature);
  }

  @JsonIgnore
  public void setFeature(final String feature) {
    this.feature = feature;
  }

  @JsonIgnore
  public void setFeatureFromEnum(final Feature feature) {
    this.feature = feature.toString();
  }

  @JsonIgnore
  public FeatureReference createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FeatureReference> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FeatureReference>>() {});
  }

  public enum Feature {
    CAMPAIGN("CAMPAIGN"),
    CATALOG("CATALOG"),
    DLC("DLC"),
    ENTITLEMENT("ENTITLEMENT"),
    IAP("IAP"),
    REWARD("REWARD");

    private String value;

    Feature(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class FeatureReferenceBuilder {
    private String feature;

    public FeatureReferenceBuilder feature(final String feature) {
      this.feature = feature;
      return this;
    }

    public FeatureReferenceBuilder featureFromEnum(final Feature feature) {
      this.feature = feature.toString();
      return this;
    }
  }
}

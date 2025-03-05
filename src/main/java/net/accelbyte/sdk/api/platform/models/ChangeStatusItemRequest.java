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
public class ChangeStatusItemRequest extends Model {

  @JsonProperty("featuresToCheck")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> featuresToCheck;

  @JsonIgnore
  public List<String> getFeaturesToCheck() {
    return this.featuresToCheck;
  }

  @JsonIgnore
  public List<FeaturesToCheck> getFeaturesToCheckAsEnum() {
    ArrayList<FeaturesToCheck> en = new ArrayList<FeaturesToCheck>();
    for (String e : this.featuresToCheck) en.add(FeaturesToCheck.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setFeaturesToCheck(final List<String> featuresToCheck) {
    this.featuresToCheck = featuresToCheck;
  }

  @JsonIgnore
  public void setFeaturesToCheckFromEnum(final List<FeaturesToCheck> featuresToCheck) {
    ArrayList<String> en = new ArrayList<String>();
    for (FeaturesToCheck e : featuresToCheck) en.add(e.toString());
    this.featuresToCheck = en;
  }

  @JsonIgnore
  public ChangeStatusItemRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ChangeStatusItemRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ChangeStatusItemRequest>>() {});
  }

  public enum FeaturesToCheck {
    CAMPAIGN("CAMPAIGN"),
    CATALOG("CATALOG"),
    DLC("DLC"),
    ENTITLEMENT("ENTITLEMENT"),
    IAP("IAP"),
    REWARD("REWARD");

    private String value;

    FeaturesToCheck(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ChangeStatusItemRequestBuilder {
    private List<String> featuresToCheck;

    public ChangeStatusItemRequestBuilder featuresToCheck(final List<String> featuresToCheck) {
      this.featuresToCheck = featuresToCheck;
      return this;
    }

    public ChangeStatusItemRequestBuilder featuresToCheckFromEnum(
        final List<FeaturesToCheck> featuresToCheck) {
      ArrayList<String> en = new ArrayList<String>();
      for (FeaturesToCheck e : featuresToCheck) en.add(e.toString());
      this.featuresToCheck = en;
      return this;
    }
  }
}

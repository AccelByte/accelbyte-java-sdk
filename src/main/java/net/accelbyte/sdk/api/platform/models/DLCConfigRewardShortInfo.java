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
public class DLCConfigRewardShortInfo extends Model {

  @JsonProperty("data")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, List<String>> data;

  @JsonProperty("dlcType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dlcType;

  @JsonIgnore
  public String getDlcType() {
    return this.dlcType;
  }

  @JsonIgnore
  public DlcType getDlcTypeAsEnum() {
    return DlcType.valueOf(this.dlcType);
  }

  @JsonIgnore
  public void setDlcType(final String dlcType) {
    this.dlcType = dlcType;
  }

  @JsonIgnore
  public void setDlcTypeFromEnum(final DlcType dlcType) {
    this.dlcType = dlcType.toString();
  }

  @JsonIgnore
  public DLCConfigRewardShortInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DLCConfigRewardShortInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DLCConfigRewardShortInfo>>() {});
  }

  public enum DlcType {
    EPICGAMES("EPICGAMES"),
    OCULUS("OCULUS"),
    PSN("PSN"),
    STEAM("STEAM"),
    XBOX("XBOX");

    private String value;

    DlcType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DLCConfigRewardShortInfoBuilder {
    private String dlcType;

    public DLCConfigRewardShortInfoBuilder dlcType(final String dlcType) {
      this.dlcType = dlcType;
      return this;
    }

    public DLCConfigRewardShortInfoBuilder dlcTypeFromEnum(final DlcType dlcType) {
      this.dlcType = dlcType.toString();
      return this;
    }
  }
}

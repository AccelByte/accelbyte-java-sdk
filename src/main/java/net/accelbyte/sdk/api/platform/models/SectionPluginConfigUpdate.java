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
public class SectionPluginConfigUpdate extends Model {

  @JsonProperty("appConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AppConfig appConfig;

  @JsonProperty("customConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private BaseCustomConfig customConfig;

  @JsonProperty("extendType")
  private String extendType;

  @JsonIgnore
  public String getExtendType() {
    return this.extendType;
  }

  @JsonIgnore
  public ExtendType getExtendTypeAsEnum() {
    return ExtendType.valueOf(this.extendType);
  }

  @JsonIgnore
  public void setExtendType(final String extendType) {
    this.extendType = extendType;
  }

  @JsonIgnore
  public void setExtendTypeFromEnum(final ExtendType extendType) {
    this.extendType = extendType.toString();
  }

  @JsonIgnore
  public SectionPluginConfigUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SectionPluginConfigUpdate> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<SectionPluginConfigUpdate>>() {});
  }

  public enum ExtendType {
    APP("APP"),
    CUSTOM("CUSTOM");

    private String value;

    ExtendType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class SectionPluginConfigUpdateBuilder {
    private String extendType;

    public SectionPluginConfigUpdateBuilder extendType(final String extendType) {
      this.extendType = extendType;
      return this;
    }

    public SectionPluginConfigUpdateBuilder extendTypeFromEnum(final ExtendType extendType) {
      this.extendType = extendType.toString();
      return this;
    }
  }
}

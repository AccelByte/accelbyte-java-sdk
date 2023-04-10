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
public class PlatformDlcEntry extends Model {

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("platformDlcIdMap")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> platformDlcIdMap;

  @JsonIgnore
  public String getPlatform() {
    return this.platform;
  }

  @JsonIgnore
  public Platform getPlatformAsEnum() {
    return Platform.valueOf(this.platform);
  }

  @JsonIgnore
  public void setPlatform(final String platform) {
    this.platform = platform;
  }

  @JsonIgnore
  public void setPlatformFromEnum(final Platform platform) {
    this.platform = platform.toString();
  }

  @JsonIgnore
  public PlatformDlcEntry createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PlatformDlcEntry> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PlatformDlcEntry>>() {});
  }

  public enum Platform {
    EPICGAMES("EPICGAMES"),
    PSN("PSN"),
    STEAM("STEAM"),
    XBOX("XBOX");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PlatformDlcEntryBuilder {
    private String platform;

    public PlatformDlcEntryBuilder platform(final String platform) {
      this.platform = platform;
      return this;
    }

    public PlatformDlcEntryBuilder platformFromEnum(final Platform platform) {
      this.platform = platform.toString();
      return this;
    }
  }
}

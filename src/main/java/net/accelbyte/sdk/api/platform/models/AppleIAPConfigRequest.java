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
public class AppleIAPConfigRequest extends Model {

  @JsonProperty("appAppleId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long appAppleId;

  @JsonProperty("bundleId")
  private String bundleId;

  @JsonProperty("issuerId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String issuerId;

  @JsonProperty("keyId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String keyId;

  @JsonProperty("password")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String password;

  @JsonProperty("version")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String version;

  @JsonIgnore
  public String getVersion() {
    return this.version;
  }

  @JsonIgnore
  public Version getVersionAsEnum() {
    return Version.valueOf(this.version);
  }

  @JsonIgnore
  public void setVersion(final String version) {
    this.version = version;
  }

  @JsonIgnore
  public void setVersionFromEnum(final Version version) {
    this.version = version.toString();
  }

  @JsonIgnore
  public AppleIAPConfigRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AppleIAPConfigRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<AppleIAPConfigRequest>>() {});
  }

  public enum Version {
    V1("V1"),
    V2("V2");

    private String value;

    Version(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AppleIAPConfigRequestBuilder {
    private String version;

    public AppleIAPConfigRequestBuilder version(final String version) {
      this.version = version;
      return this;
    }

    public AppleIAPConfigRequestBuilder versionFromEnum(final Version version) {
      this.version = version.toString();
      return this;
    }
  }
}

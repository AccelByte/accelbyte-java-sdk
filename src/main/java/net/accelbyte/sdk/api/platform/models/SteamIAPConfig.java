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
public class SteamIAPConfig extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("env")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String env;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("publisherAuthenticationKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publisherAuthenticationKey;

  @JsonProperty("rvn")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer rvn;

  @JsonProperty("syncMode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String syncMode;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public String getEnv() {
    return this.env;
  }

  @JsonIgnore
  public Env getEnvAsEnum() {
    return Env.valueOf(this.env);
  }

  @JsonIgnore
  public void setEnv(final String env) {
    this.env = env;
  }

  @JsonIgnore
  public void setEnvFromEnum(final Env env) {
    this.env = env.toString();
  }

  @JsonIgnore
  public String getSyncMode() {
    return this.syncMode;
  }

  @JsonIgnore
  public SyncMode getSyncModeAsEnum() {
    return SyncMode.valueOf(this.syncMode);
  }

  @JsonIgnore
  public void setSyncMode(final String syncMode) {
    this.syncMode = syncMode;
  }

  @JsonIgnore
  public void setSyncModeFromEnum(final SyncMode syncMode) {
    this.syncMode = syncMode.toString();
  }

  @JsonIgnore
  public SteamIAPConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SteamIAPConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SteamIAPConfig>>() {});
  }

  public enum Env {
    LIVE("LIVE"),
    SANDBOX("SANDBOX");

    private String value;

    Env(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SyncMode {
    INVENTORY("INVENTORY"),
    TRANSACTION("TRANSACTION");

    private String value;

    SyncMode(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class SteamIAPConfigBuilder {
    private String env;
    private String syncMode;

    public SteamIAPConfigBuilder env(final String env) {
      this.env = env;
      return this;
    }

    public SteamIAPConfigBuilder envFromEnum(final Env env) {
      this.env = env.toString();
      return this;
    }

    public SteamIAPConfigBuilder syncMode(final String syncMode) {
      this.syncMode = syncMode;
      return this;
    }

    public SteamIAPConfigBuilder syncModeFromEnum(final SyncMode syncMode) {
      this.syncMode = syncMode.toString();
      return this;
    }
  }
}

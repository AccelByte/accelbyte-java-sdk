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
public class SteamIAPConfigInfo extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("env")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String env;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("publisherAuthenticationKey")
  private String publisherAuthenticationKey;

  @JsonProperty("syncMode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String syncMode;

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
  public SteamIAPConfigInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SteamIAPConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SteamIAPConfigInfo>>() {});
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

  public static class SteamIAPConfigInfoBuilder {
    private String env;
    private String syncMode;

    public SteamIAPConfigInfoBuilder env(final String env) {
      this.env = env;
      return this;
    }

    public SteamIAPConfigInfoBuilder envFromEnum(final Env env) {
      this.env = env.toString();
      return this;
    }

    public SteamIAPConfigInfoBuilder syncMode(final String syncMode) {
      this.syncMode = syncMode;
      return this;
    }

    public SteamIAPConfigInfoBuilder syncModeFromEnum(final SyncMode syncMode) {
      this.syncMode = syncMode.toString();
      return this;
    }
  }
}

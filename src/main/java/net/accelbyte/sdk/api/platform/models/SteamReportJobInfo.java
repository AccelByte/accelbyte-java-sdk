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
public class SteamReportJobInfo extends Model {

  @JsonProperty("env")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String env;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("lastTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lastTime;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

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
  public SteamReportJobInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SteamReportJobInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SteamReportJobInfo>>() {});
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

  public static class SteamReportJobInfoBuilder {
    private String env;

    public SteamReportJobInfoBuilder env(final String env) {
      this.env = env;
      return this;
    }

    public SteamReportJobInfoBuilder envFromEnum(final Env env) {
      this.env = env.toString();
      return this;
    }
  }
}

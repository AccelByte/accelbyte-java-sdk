/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class LogconfigConfiguration extends Model {

  @JsonProperty("logLevel")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String logLevel;

  @JsonIgnore
  public String getLogLevel() {
    return this.logLevel;
  }

  @JsonIgnore
  public LogLevel getLogLevelAsEnum() {
    return LogLevel.valueOf(this.logLevel);
  }

  @JsonIgnore
  public void setLogLevel(final String logLevel) {
    this.logLevel = logLevel;
  }

  @JsonIgnore
  public void setLogLevelFromEnum(final LogLevel logLevel) {
    this.logLevel = logLevel.toString();
  }

  @JsonIgnore
  public LogconfigConfiguration createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<LogconfigConfiguration> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<LogconfigConfiguration>>() {});
  }

  public enum LogLevel {
    Debug("debug"),
    Error("error"),
    Fatal("fatal"),
    Info("info"),
    Panic("panic"),
    Trace("trace"),
    Warning("warning");

    private String value;

    LogLevel(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class LogconfigConfigurationBuilder {
    private String logLevel;

    public LogconfigConfigurationBuilder logLevel(final String logLevel) {
      this.logLevel = logLevel;
      return this;
    }

    public LogconfigConfigurationBuilder logLevelFromEnum(final LogLevel logLevel) {
      this.logLevel = logLevel.toString();
      return this;
    }
  }
}

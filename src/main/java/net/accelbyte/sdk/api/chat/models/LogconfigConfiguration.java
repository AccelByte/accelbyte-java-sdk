/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

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

  @JsonProperty("internalAccessLogEnabled")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean internalAccessLogEnabled;

  @JsonProperty("logLevel")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String logLevel;

  @JsonProperty("logLevelDB")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String logLevelDB;

  @JsonProperty("slowQueryThreshold")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long slowQueryThreshold;

  @JsonProperty("socketLogEnabled")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean socketLogEnabled;

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
  public String getLogLevelDB() {
    return this.logLevelDB;
  }

  @JsonIgnore
  public LogLevelDB getLogLevelDBAsEnum() {
    return LogLevelDB.valueOf(this.logLevelDB);
  }

  @JsonIgnore
  public void setLogLevelDB(final String logLevelDB) {
    this.logLevelDB = logLevelDB;
  }

  @JsonIgnore
  public void setLogLevelDBFromEnum(final LogLevelDB logLevelDB) {
    this.logLevelDB = logLevelDB.toString();
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

  public enum LogLevelDB {
    Debug("debug"),
    Error("error"),
    Fatal("fatal"),
    Info("info"),
    Panic("panic"),
    Trace("trace"),
    Warning("warning");

    private String value;

    LogLevelDB(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class LogconfigConfigurationBuilder {
    private String logLevel;
    private String logLevelDB;

    public LogconfigConfigurationBuilder logLevel(final String logLevel) {
      this.logLevel = logLevel;
      return this;
    }

    public LogconfigConfigurationBuilder logLevelFromEnum(final LogLevel logLevel) {
      this.logLevel = logLevel.toString();
      return this;
    }

    public LogconfigConfigurationBuilder logLevelDB(final String logLevelDB) {
      this.logLevelDB = logLevelDB;
      return this;
    }

    public LogconfigConfigurationBuilder logLevelDBFromEnum(final LogLevelDB logLevelDB) {
      this.logLevelDB = logLevelDB.toString();
      return this;
    }
  }
}

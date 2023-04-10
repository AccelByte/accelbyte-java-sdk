/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class StatCycleInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("currentVersion")
  private Integer currentVersion;

  @JsonProperty("cycleType")
  private String cycleType;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("end")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String end;

  @JsonProperty("id")
  private String id;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("nextReset")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String nextReset;

  @JsonProperty("resetDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer resetDate;

  @JsonProperty("resetDay")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer resetDay;

  @JsonProperty("resetMonth")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer resetMonth;

  @JsonProperty("resetTime")
  private String resetTime;

  @JsonProperty("seasonPeriod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer seasonPeriod;

  @JsonProperty("start")
  private String start;

  @JsonProperty("status")
  private String status;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public String getCycleType() {
    return this.cycleType;
  }

  @JsonIgnore
  public CycleType getCycleTypeAsEnum() {
    return CycleType.valueOf(this.cycleType);
  }

  @JsonIgnore
  public void setCycleType(final String cycleType) {
    this.cycleType = cycleType;
  }

  @JsonIgnore
  public void setCycleTypeFromEnum(final CycleType cycleType) {
    this.cycleType = cycleType.toString();
  }

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public StatCycleInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StatCycleInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StatCycleInfo>>() {});
  }

  public enum CycleType {
    ANNUALLY("ANNUALLY"),
    DAILY("DAILY"),
    MONTHLY("MONTHLY"),
    SEASONAL("SEASONAL"),
    WEEKLY("WEEKLY");

    private String value;

    CycleType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    INIT("INIT"),
    STOPPED("STOPPED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class StatCycleInfoBuilder {
    private String cycleType;
    private String status;

    public StatCycleInfoBuilder cycleType(final String cycleType) {
      this.cycleType = cycleType;
      return this;
    }

    public StatCycleInfoBuilder cycleTypeFromEnum(final CycleType cycleType) {
      this.cycleType = cycleType.toString();
      return this;
    }

    public StatCycleInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public StatCycleInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

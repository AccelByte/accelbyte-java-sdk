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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class StatCycleCreate extends Model {

  @JsonProperty("cycleType")
  private String cycleType;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("end")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String end;

  @JsonProperty("name")
  private String name;

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
  public StatCycleCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StatCycleCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StatCycleCreate>>() {});
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

  public static class StatCycleCreateBuilder {
    private String cycleType;

    public StatCycleCreateBuilder cycleType(final String cycleType) {
      this.cycleType = cycleType;
      return this;
    }

    public StatCycleCreateBuilder cycleTypeFromEnum(final CycleType cycleType) {
      this.cycleType = cycleType.toString();
      return this;
    }
  }
}

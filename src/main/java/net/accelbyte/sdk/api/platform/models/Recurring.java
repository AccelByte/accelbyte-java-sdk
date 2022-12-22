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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class Recurring extends Model {

  @JsonProperty("cycle")
  private String cycle;

  @JsonProperty("fixedFreeDays")
  private Integer fixedFreeDays;

  @JsonProperty("fixedTrialCycles")
  private Integer fixedTrialCycles;

  @JsonProperty("graceDays")
  private Integer graceDays;

  @JsonIgnore
  public String getCycle() {
    return this.cycle;
  }

  @JsonIgnore
  public Cycle getCycleAsEnum() {
    return Cycle.valueOf(this.cycle);
  }

  @JsonIgnore
  public void setCycle(final String cycle) {
    this.cycle = cycle;
  }

  @JsonIgnore
  public void setCycleFromEnum(final Cycle cycle) {
    this.cycle = cycle.toString();
  }

  @JsonIgnore
  public Recurring createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Recurring> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Recurring>>() {});
  }

  public enum Cycle {
    MONTHLY("MONTHLY"),
    QUARTERLY("QUARTERLY"),
    WEEKLY("WEEKLY"),
    YEARLY("YEARLY");

    private String value;

    Cycle(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RecurringBuilder {
    private String cycle;

    public RecurringBuilder cycle(final String cycle) {
      this.cycle = cycle;
      return this;
    }

    public RecurringBuilder cycleFromEnum(final Cycle cycle) {
      this.cycle = cycle.toString();
      return this;
    }
  }
}

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
public class FixedPeriodRotationConfig extends Model {

  @JsonProperty("backfillType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String backfillType;

  @JsonProperty("duration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer duration;

  @JsonProperty("itemCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer itemCount;

  @JsonProperty("rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String rule;

  @JsonIgnore
  public String getBackfillType() {
    return this.backfillType;
  }

  @JsonIgnore
  public BackfillType getBackfillTypeAsEnum() {
    return BackfillType.valueOf(this.backfillType);
  }

  @JsonIgnore
  public void setBackfillType(final String backfillType) {
    this.backfillType = backfillType;
  }

  @JsonIgnore
  public void setBackfillTypeFromEnum(final BackfillType backfillType) {
    this.backfillType = backfillType.toString();
  }

  @JsonIgnore
  public String getRule() {
    return this.rule;
  }

  @JsonIgnore
  public Rule getRuleAsEnum() {
    return Rule.valueOf(this.rule);
  }

  @JsonIgnore
  public void setRule(final String rule) {
    this.rule = rule;
  }

  @JsonIgnore
  public void setRuleFromEnum(final Rule rule) {
    this.rule = rule.toString();
  }

  @JsonIgnore
  public FixedPeriodRotationConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FixedPeriodRotationConfig> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<FixedPeriodRotationConfig>>() {});
  }

  public enum BackfillType {
    CUSTOM("CUSTOM"),
    NONE("NONE");

    private String value;

    BackfillType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Rule {
    SEQUENCE("SEQUENCE");

    private String value;

    Rule(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class FixedPeriodRotationConfigBuilder {
    private String backfillType;
    private String rule;

    public FixedPeriodRotationConfigBuilder backfillType(final String backfillType) {
      this.backfillType = backfillType;
      return this;
    }

    public FixedPeriodRotationConfigBuilder backfillTypeFromEnum(final BackfillType backfillType) {
      this.backfillType = backfillType.toString();
      return this;
    }

    public FixedPeriodRotationConfigBuilder rule(final String rule) {
      this.rule = rule;
      return this;
    }

    public FixedPeriodRotationConfigBuilder ruleFromEnum(final Rule rule) {
      this.rule = rule.toString();
      return this;
    }
  }
}

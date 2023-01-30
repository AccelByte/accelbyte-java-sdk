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
public class LootBoxConfig extends Model {

  @JsonProperty("rewardCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer rewardCount;

  @JsonProperty("rewards")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<LootBoxReward> rewards;

  @JsonProperty("rollFunction")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String rollFunction;

  @JsonIgnore
  public String getRollFunction() {
    return this.rollFunction;
  }

  @JsonIgnore
  public RollFunction getRollFunctionAsEnum() {
    return RollFunction.valueOf(this.rollFunction);
  }

  @JsonIgnore
  public void setRollFunction(final String rollFunction) {
    this.rollFunction = rollFunction;
  }

  @JsonIgnore
  public void setRollFunctionFromEnum(final RollFunction rollFunction) {
    this.rollFunction = rollFunction.toString();
  }

  @JsonIgnore
  public LootBoxConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<LootBoxConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<LootBoxConfig>>() {});
  }

  public enum RollFunction {
    CUSTOM("CUSTOM"),
    DEFAULT("DEFAULT");

    private String value;

    RollFunction(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class LootBoxConfigBuilder {
    private String rollFunction;

    public LootBoxConfigBuilder rollFunction(final String rollFunction) {
      this.rollFunction = rollFunction;
      return this;
    }

    public LootBoxConfigBuilder rollFunctionFromEnum(final RollFunction rollFunction) {
      this.rollFunction = rollFunction.toString();
      return this;
    }
  }
}

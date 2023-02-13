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
public class WalletRevocationConfig extends Model {

  @JsonProperty("enabled")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enabled;

  @JsonProperty("strategy")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String strategy;

  @JsonIgnore
  public String getStrategy() {
    return this.strategy;
  }

  @JsonIgnore
  public Strategy getStrategyAsEnum() {
    return Strategy.valueOf(this.strategy);
  }

  @JsonIgnore
  public void setStrategy(final String strategy) {
    this.strategy = strategy;
  }

  @JsonIgnore
  public void setStrategyFromEnum(final Strategy strategy) {
    this.strategy = strategy.toString();
  }

  @JsonIgnore
  public WalletRevocationConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<WalletRevocationConfig> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<WalletRevocationConfig>>() {});
  }

  public enum Strategy {
    ALWAYSREVOKE("ALWAYS_REVOKE"),
    REVOKEORREPORT("REVOKE_OR_REPORT");

    private String value;

    Strategy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class WalletRevocationConfigBuilder {
    private String strategy;

    public WalletRevocationConfigBuilder strategy(final String strategy) {
      this.strategy = strategy;
      return this;
    }

    public WalletRevocationConfigBuilder strategyFromEnum(final Strategy strategy) {
      this.strategy = strategy.toString();
      return this;
    }
  }
}

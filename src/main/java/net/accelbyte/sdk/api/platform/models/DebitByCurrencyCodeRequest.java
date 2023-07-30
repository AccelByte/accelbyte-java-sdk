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
public class DebitByCurrencyCodeRequest extends Model {

  @JsonProperty("allowOverdraft")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean allowOverdraft;

  @JsonProperty("amount")
  private Integer amount;

  @JsonProperty("balanceOrigin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String balanceOrigin;

  @JsonProperty("reason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String reason;

  @JsonIgnore
  public String getBalanceOrigin() {
    return this.balanceOrigin;
  }

  @JsonIgnore
  public BalanceOrigin getBalanceOriginAsEnum() {
    return BalanceOrigin.valueOf(this.balanceOrigin);
  }

  @JsonIgnore
  public void setBalanceOrigin(final String balanceOrigin) {
    this.balanceOrigin = balanceOrigin;
  }

  @JsonIgnore
  public void setBalanceOriginFromEnum(final BalanceOrigin balanceOrigin) {
    this.balanceOrigin = balanceOrigin.toString();
  }

  @JsonIgnore
  public DebitByCurrencyCodeRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DebitByCurrencyCodeRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DebitByCurrencyCodeRequest>>() {});
  }

  public enum BalanceOrigin {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    System("System"),
    Twitch("Twitch"),
    Xbox("Xbox");

    private String value;

    BalanceOrigin(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DebitByCurrencyCodeRequestBuilder {
    private String balanceOrigin;

    public DebitByCurrencyCodeRequestBuilder balanceOrigin(final String balanceOrigin) {
      this.balanceOrigin = balanceOrigin;
      return this;
    }

    public DebitByCurrencyCodeRequestBuilder balanceOriginFromEnum(
        final BalanceOrigin balanceOrigin) {
      this.balanceOrigin = balanceOrigin.toString();
      return this;
    }
  }
}

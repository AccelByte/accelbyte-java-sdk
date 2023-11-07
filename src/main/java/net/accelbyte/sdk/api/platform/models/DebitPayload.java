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
public class DebitPayload extends Model {

  @JsonProperty("count")
  private Integer count;

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("walletPlatform")
  private String walletPlatform;

  @JsonIgnore
  public String getWalletPlatform() {
    return this.walletPlatform;
  }

  @JsonIgnore
  public WalletPlatform getWalletPlatformAsEnum() {
    return WalletPlatform.valueOf(this.walletPlatform);
  }

  @JsonIgnore
  public void setWalletPlatform(final String walletPlatform) {
    this.walletPlatform = walletPlatform;
  }

  @JsonIgnore
  public void setWalletPlatformFromEnum(final WalletPlatform walletPlatform) {
    this.walletPlatform = walletPlatform.toString();
  }

  @JsonIgnore
  public DebitPayload createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DebitPayload> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<DebitPayload>>() {});
  }

  public enum WalletPlatform {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    Xbox("Xbox");

    private String value;

    WalletPlatform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DebitPayloadBuilder {
    private String walletPlatform;

    public DebitPayloadBuilder walletPlatform(final String walletPlatform) {
      this.walletPlatform = walletPlatform;
      return this;
    }

    public DebitPayloadBuilder walletPlatformFromEnum(final WalletPlatform walletPlatform) {
      this.walletPlatform = walletPlatform.toString();
      return this;
    }
  }
}

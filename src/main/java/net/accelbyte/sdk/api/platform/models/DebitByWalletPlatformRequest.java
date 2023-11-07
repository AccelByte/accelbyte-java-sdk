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
public class DebitByWalletPlatformRequest extends Model {

  @JsonProperty("amount")
  private Integer amount;

  @JsonProperty("debitBalanceSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String debitBalanceSource;

  @JsonProperty("metadata")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> metadata;

  @JsonProperty("reason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String reason;

  @JsonProperty("walletPlatform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String walletPlatform;

  @JsonIgnore
  public String getDebitBalanceSource() {
    return this.debitBalanceSource;
  }

  @JsonIgnore
  public DebitBalanceSource getDebitBalanceSourceAsEnum() {
    return DebitBalanceSource.valueOf(this.debitBalanceSource);
  }

  @JsonIgnore
  public void setDebitBalanceSource(final String debitBalanceSource) {
    this.debitBalanceSource = debitBalanceSource;
  }

  @JsonIgnore
  public void setDebitBalanceSourceFromEnum(final DebitBalanceSource debitBalanceSource) {
    this.debitBalanceSource = debitBalanceSource.toString();
  }

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
  public DebitByWalletPlatformRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DebitByWalletPlatformRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DebitByWalletPlatformRequest>>() {});
  }

  public enum DebitBalanceSource {
    DLCREVOCATION("DLC_REVOCATION"),
    EXPIRATION("EXPIRATION"),
    IAPREVOCATION("IAP_REVOCATION"),
    ORDERREVOCATION("ORDER_REVOCATION"),
    OTHER("OTHER"),
    PAYMENT("PAYMENT"),
    TRADE("TRADE");

    private String value;

    DebitBalanceSource(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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

  public static class DebitByWalletPlatformRequestBuilder {
    private String debitBalanceSource;
    private String walletPlatform;

    public DebitByWalletPlatformRequestBuilder debitBalanceSource(final String debitBalanceSource) {
      this.debitBalanceSource = debitBalanceSource;
      return this;
    }

    public DebitByWalletPlatformRequestBuilder debitBalanceSourceFromEnum(
        final DebitBalanceSource debitBalanceSource) {
      this.debitBalanceSource = debitBalanceSource.toString();
      return this;
    }

    public DebitByWalletPlatformRequestBuilder walletPlatform(final String walletPlatform) {
      this.walletPlatform = walletPlatform;
      return this;
    }

    public DebitByWalletPlatformRequestBuilder walletPlatformFromEnum(
        final WalletPlatform walletPlatform) {
      this.walletPlatform = walletPlatform.toString();
      return this;
    }
  }
}

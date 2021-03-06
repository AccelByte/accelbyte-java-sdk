/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlatformWallet extends Model {

  @JsonProperty("balance")
  private Integer balance;

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("currencySymbol")
  private String currencySymbol;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("walletInfos")
  private List<WalletInfo> walletInfos;

  @JsonProperty("walletStatus")
  private String walletStatus;

  @JsonIgnore
  public String getWalletStatus() {
    return this.walletStatus;
  }

  @JsonIgnore
  public WalletStatus getWalletStatusAsEnum() {
    return WalletStatus.valueOf(this.walletStatus);
  }

  @JsonIgnore
  public void setWalletStatus(final String walletStatus) {
    this.walletStatus = walletStatus;
  }

  @JsonIgnore
  public void setWalletStatusFromEnum(final WalletStatus walletStatus) {
    this.walletStatus = walletStatus.toString();
  }

  @JsonIgnore
  public PlatformWallet createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PlatformWallet> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PlatformWallet>>() {});
  }

  public enum WalletStatus {
    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE");

    private String value;

    WalletStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PlatformWalletBuilder {
    private String walletStatus;

    public PlatformWalletBuilder walletStatus(final String walletStatus) {
      this.walletStatus = walletStatus;
      return this;
    }

    public PlatformWalletBuilder walletStatusFromEnum(final WalletStatus walletStatus) {
      this.walletStatus = walletStatus.toString();
      return this;
    }
  }
}

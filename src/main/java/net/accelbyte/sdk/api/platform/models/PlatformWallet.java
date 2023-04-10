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
public class PlatformWallet extends Model {

  @JsonProperty("balance")
  private Integer balance;

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("currencySymbol")
  private String currencySymbol;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("walletInfos")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<WalletInfo> walletInfos;

  @JsonProperty("walletStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String walletStatus;

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

  public enum Status {
    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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
    private String status;
    private String walletStatus;

    public PlatformWalletBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PlatformWalletBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

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

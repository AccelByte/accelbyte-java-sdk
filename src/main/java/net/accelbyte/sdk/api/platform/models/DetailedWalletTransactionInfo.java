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
public class DetailedWalletTransactionInfo extends Model {

  @JsonProperty("amount")
  private Integer amount;

  @JsonProperty("balanceSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String balanceSource;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("operator")
  private String operator;

  @JsonProperty("reason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String reason;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("walletAction")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String walletAction;

  @JsonProperty("walletId")
  private String walletId;

  @JsonIgnore
  public String getWalletAction() {
    return this.walletAction;
  }

  @JsonIgnore
  public WalletAction getWalletActionAsEnum() {
    return WalletAction.valueOf(this.walletAction);
  }

  @JsonIgnore
  public void setWalletAction(final String walletAction) {
    this.walletAction = walletAction;
  }

  @JsonIgnore
  public void setWalletActionFromEnum(final WalletAction walletAction) {
    this.walletAction = walletAction.toString();
  }

  @JsonIgnore
  public DetailedWalletTransactionInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DetailedWalletTransactionInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DetailedWalletTransactionInfo>>() {});
  }

  public enum WalletAction {
    CREDIT("CREDIT"),
    DEBIT("DEBIT"),
    PAYMENT("PAYMENT");

    private String value;

    WalletAction(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DetailedWalletTransactionInfoBuilder {
    private String walletAction;

    public DetailedWalletTransactionInfoBuilder walletAction(final String walletAction) {
      this.walletAction = walletAction;
      return this;
    }

    public DetailedWalletTransactionInfoBuilder walletActionFromEnum(
        final WalletAction walletAction) {
      this.walletAction = walletAction.toString();
      return this;
    }
  }
}

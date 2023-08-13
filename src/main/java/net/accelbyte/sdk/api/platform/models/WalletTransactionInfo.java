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
public class WalletTransactionInfo extends Model {

  @JsonProperty("amount")
  private Integer amount;

  @JsonProperty("balanceSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String balanceSource;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("metadata")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> metadata;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("operator")
  private String operator;

  @JsonProperty("reason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String reason;

  @JsonProperty("transactionAmountDetails")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<TransactionAmountDetails> transactionAmountDetails;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("walletAction")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String walletAction;

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
  public WalletTransactionInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<WalletTransactionInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<WalletTransactionInfo>>() {});
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

  public static class WalletTransactionInfoBuilder {
    private String walletAction;

    public WalletTransactionInfoBuilder walletAction(final String walletAction) {
      this.walletAction = walletAction;
      return this;
    }

    public WalletTransactionInfoBuilder walletActionFromEnum(final WalletAction walletAction) {
      this.walletAction = walletAction.toString();
      return this;
    }
  }
}

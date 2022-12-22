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
public class Transaction extends Model {

  @JsonProperty("additionalData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AdditionalData additionalData;

  @JsonProperty("amount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer amount;

  @JsonProperty("currency")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CurrencySummary currency;

  @JsonProperty("extMessage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extMessage;

  @JsonProperty("extStatusCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extStatusCode;

  @JsonProperty("extTxId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extTxId;

  @JsonProperty("merchantId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String merchantId;

  @JsonProperty("notified")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean notified;

  @JsonProperty("paymentMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentMethod;

  @JsonProperty("paymentMethodFee")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentMethodFee;

  @JsonProperty("paymentProviderFee")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentProviderFee;

  @JsonProperty("provider")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String provider;

  @JsonProperty("salesTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer salesTax;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("tax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer tax;

  @JsonProperty("txEndTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String txEndTime;

  @JsonProperty("txId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String txId;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("vat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer vat;

  @JsonIgnore
  public String getProvider() {
    return this.provider;
  }

  @JsonIgnore
  public Provider getProviderAsEnum() {
    return Provider.valueOf(this.provider);
  }

  @JsonIgnore
  public void setProvider(final String provider) {
    this.provider = provider;
  }

  @JsonIgnore
  public void setProviderFromEnum(final Provider provider) {
    this.provider = provider.toString();
  }

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
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public Transaction createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Transaction> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Transaction>>() {});
  }

  public enum Provider {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    Provider(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    FAILED("FAILED"),
    FINISHED("FINISHED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    AUTHORISATION("AUTHORISATION"),
    CHARGE("CHARGE"),
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGEFAILED("CHARGE_FAILED"),
    NOTIFICATIONOFCHARGEBACK("NOTIFICATION_OF_CHARGEBACK"),
    REFUND("REFUND"),
    REFUNDFAILED("REFUND_FAILED"),
    REQUESTFORINFORMATION("REQUEST_FOR_INFORMATION");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class TransactionBuilder {
    private String provider;
    private String status;
    private String type;

    public TransactionBuilder provider(final String provider) {
      this.provider = provider;
      return this;
    }

    public TransactionBuilder providerFromEnum(final Provider provider) {
      this.provider = provider.toString();
      return this;
    }

    public TransactionBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public TransactionBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public TransactionBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public TransactionBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

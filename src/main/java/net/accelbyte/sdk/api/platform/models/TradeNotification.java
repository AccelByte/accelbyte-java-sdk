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
public class TradeNotification extends Model {

  @JsonProperty("additionalData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AdditionalData additionalData;

  @JsonProperty("authorisedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String authorisedTime;

  @JsonProperty("chargebackReversedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackReversedTime;

  @JsonProperty("chargebackTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackTime;

  @JsonProperty("chargedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargedTime;

  @JsonProperty("createdTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdTime;

  @JsonProperty("currency")
  private CurrencySummary currency;

  @JsonProperty("customParameters")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customParameters;

  @JsonProperty("extOrderNo")
  private String extOrderNo;

  @JsonProperty("extTxId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extTxId;

  @JsonProperty("extUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extUserId;

  @JsonProperty("issuedAt")
  private String issuedAt;

  @JsonProperty("metadata")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> metadata;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("nonceStr")
  private String nonceStr;

  @JsonProperty("paymentMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentMethod;

  @JsonProperty("paymentMethodFee")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentMethodFee;

  @JsonProperty("paymentOrderNo")
  private String paymentOrderNo;

  @JsonProperty("paymentProvider")
  private String paymentProvider;

  @JsonProperty("paymentProviderFee")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentProviderFee;

  @JsonProperty("paymentStationUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentStationUrl;

  @JsonProperty("price")
  private Integer price;

  @JsonProperty("refundedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String refundedTime;

  @JsonProperty("salesTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer salesTax;

  @JsonProperty("sandbox")
  private Boolean sandbox;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("subscriptionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subscriptionId;

  @JsonProperty("subtotalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer subtotalPrice;

  @JsonProperty("targetNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetNamespace;

  @JsonProperty("targetUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetUserId;

  @JsonProperty("tax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer tax;

  @JsonProperty("totalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalPrice;

  @JsonProperty("totalTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalTax;

  @JsonProperty("txEndTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String txEndTime;

  @JsonProperty("type")
  private String type;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonProperty("vat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer vat;

  @JsonIgnore
  public String getPaymentProvider() {
    return this.paymentProvider;
  }

  @JsonIgnore
  public PaymentProvider getPaymentProviderAsEnum() {
    return PaymentProvider.valueOf(this.paymentProvider);
  }

  @JsonIgnore
  public void setPaymentProvider(final String paymentProvider) {
    this.paymentProvider = paymentProvider;
  }

  @JsonIgnore
  public void setPaymentProviderFromEnum(final PaymentProvider paymentProvider) {
    this.paymentProvider = paymentProvider.toString();
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
  public TradeNotification createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<TradeNotification> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<TradeNotification>>() {});
  }

  public enum PaymentProvider {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    PaymentProvider(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    AUTHORISED("AUTHORISED"),
    AUTHORISEFAILED("AUTHORISE_FAILED"),
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGED("CHARGED"),
    CHARGEFAILED("CHARGE_FAILED"),
    DELETED("DELETED"),
    INIT("INIT"),
    NOTIFICATIONOFCHARGEBACK("NOTIFICATION_OF_CHARGEBACK"),
    REFUNDED("REFUNDED"),
    REFUNDING("REFUNDING"),
    REFUNDFAILED("REFUND_FAILED"),
    REQUESTFORINFORMATION("REQUEST_FOR_INFORMATION");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class TradeNotificationBuilder {
    private String paymentProvider;
    private String status;

    public TradeNotificationBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public TradeNotificationBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }

    public TradeNotificationBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public TradeNotificationBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

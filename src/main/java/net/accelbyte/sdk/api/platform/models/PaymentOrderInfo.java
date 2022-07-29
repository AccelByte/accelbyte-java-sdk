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
public class PaymentOrderInfo extends Model {

  @JsonProperty("authorisedTime")
  private String authorisedTime;

  @JsonProperty("channel")
  private String channel;

  @JsonProperty("chargebackReversedTime")
  private String chargebackReversedTime;

  @JsonProperty("chargebackTime")
  private String chargebackTime;

  @JsonProperty("chargedTime")
  private String chargedTime;

  @JsonProperty("charging")
  private Boolean charging;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("currency")
  private CurrencySummary currency;

  @JsonProperty("customParameters")
  private Map<String, ?> customParameters;

  @JsonProperty("description")
  private String description;

  @JsonProperty("extOrderNo")
  private String extOrderNo;

  @JsonProperty("extUserId")
  private String extUserId;

  @JsonProperty("itemType")
  private String itemType;

  @JsonProperty("language")
  private String language;

  @JsonProperty("metadata")
  private Map<String, String> metadata;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("notifyUrl")
  private String notifyUrl;

  @JsonProperty("omitNotification")
  private Boolean omitNotification;

  @JsonProperty("paymentMethod")
  private String paymentMethod;

  @JsonProperty("paymentMethodFee")
  private Integer paymentMethodFee;

  @JsonProperty("paymentOrderNo")
  private String paymentOrderNo;

  @JsonProperty("paymentProvider")
  private String paymentProvider;

  @JsonProperty("paymentProviderFee")
  private Integer paymentProviderFee;

  @JsonProperty("paymentStationUrl")
  private String paymentStationUrl;

  @JsonProperty("price")
  private Integer price;

  @JsonProperty("recurringPaymentOrderNo")
  private String recurringPaymentOrderNo;

  @JsonProperty("refundedTime")
  private String refundedTime;

  @JsonProperty("region")
  private String region;

  @JsonProperty("returnUrl")
  private String returnUrl;

  @JsonProperty("salesTax")
  private Integer salesTax;

  @JsonProperty("sandbox")
  private Boolean sandbox;

  @JsonProperty("sku")
  private String sku;

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusReason")
  private String statusReason;

  @JsonProperty("subscriptionId")
  private String subscriptionId;

  @JsonProperty("subtotalPrice")
  private Integer subtotalPrice;

  @JsonProperty("targetNamespace")
  private String targetNamespace;

  @JsonProperty("targetUserId")
  private String targetUserId;

  @JsonProperty("tax")
  private Integer tax;

  @JsonProperty("title")
  private String title;

  @JsonProperty("totalPrice")
  private Integer totalPrice;

  @JsonProperty("totalTax")
  private Integer totalTax;

  @JsonProperty("transactions")
  private List<Transaction> transactions;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("vat")
  private Integer vat;

  @JsonIgnore
  public String getChannel() {
    return this.channel;
  }

  @JsonIgnore
  public Channel getChannelAsEnum() {
    return Channel.valueOf(this.channel);
  }

  @JsonIgnore
  public void setChannel(final String channel) {
    this.channel = channel;
  }

  @JsonIgnore
  public void setChannelFromEnum(final Channel channel) {
    this.channel = channel.toString();
  }

  @JsonIgnore
  public String getItemType() {
    return this.itemType;
  }

  @JsonIgnore
  public ItemType getItemTypeAsEnum() {
    return ItemType.valueOf(this.itemType);
  }

  @JsonIgnore
  public void setItemType(final String itemType) {
    this.itemType = itemType;
  }

  @JsonIgnore
  public void setItemTypeFromEnum(final ItemType itemType) {
    this.itemType = itemType.toString();
  }

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
  public PaymentOrderInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentOrderInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderInfo>>() {});
  }

  public enum Channel {
    EXTERNAL("EXTERNAL"),
    INTERNAL("INTERNAL");

    private String value;

    Channel(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum ItemType {
    APP("APP"),
    BUNDLE("BUNDLE"),
    CODE("CODE"),
    COINS("COINS"),
    INGAMEITEM("INGAMEITEM"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
    SEASON("SEASON"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    ItemType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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

  public static class PaymentOrderInfoBuilder {
    private String channel;
    private String itemType;
    private String paymentProvider;
    private String status;

    public PaymentOrderInfoBuilder channel(final String channel) {
      this.channel = channel;
      return this;
    }

    public PaymentOrderInfoBuilder channelFromEnum(final Channel channel) {
      this.channel = channel.toString();
      return this;
    }

    public PaymentOrderInfoBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public PaymentOrderInfoBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public PaymentOrderInfoBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public PaymentOrderInfoBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }

    public PaymentOrderInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PaymentOrderInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

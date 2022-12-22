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
public class PaymentOrder extends Model {

  @JsonProperty("authorisedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String authorisedTime;

  @JsonProperty("channel")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String channel;

  @JsonProperty("chargebackReversedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackReversedTime;

  @JsonProperty("chargebackTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackTime;

  @JsonProperty("chargedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargedTime;

  @JsonProperty("charging")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean charging;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("createdTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdTime;

  @JsonProperty("currency")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CurrencySummary currency;

  @JsonProperty("customParameters")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customParameters;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("extOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extOrderNo;

  @JsonProperty("extUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extUserId;

  @JsonProperty("itemType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemType;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("metadata")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> metadata;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("notifyUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notifyUrl;

  @JsonProperty("omitNotification")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean omitNotification;

  @JsonProperty("paymentMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentMethod;

  @JsonProperty("paymentMethodFee")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentMethodFee;

  @JsonProperty("paymentOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentOrderNo;

  @JsonProperty("paymentProvider")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentProvider;

  @JsonProperty("paymentProviderFee")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentProviderFee;

  @JsonProperty("paymentStationUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentStationUrl;

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("price")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer price;

  @JsonProperty("recurringPaymentOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String recurringPaymentOrderNo;

  @JsonProperty("refundedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String refundedTime;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("returnUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String returnUrl;

  @JsonProperty("rvn")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer rvn;

  @JsonProperty("salesTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer salesTax;

  @JsonProperty("sandbox")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sandbox;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("state")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String state;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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

  @JsonProperty("title")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String title;

  @JsonProperty("totalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalPrice;

  @JsonProperty("totalTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalTax;

  @JsonProperty("transactions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Transaction> transactions;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonProperty("vat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer vat;

  @JsonProperty("zipCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String zipCode;

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
  public PaymentOrder createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentOrder> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrder>>() {});
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
    EXTENSION("EXTENSION"),
    INGAMEITEM("INGAMEITEM"),
    LOOTBOX("LOOTBOX"),
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

  public static class PaymentOrderBuilder {
    private String channel;
    private String itemType;
    private String paymentProvider;
    private String status;

    public PaymentOrderBuilder channel(final String channel) {
      this.channel = channel;
      return this;
    }

    public PaymentOrderBuilder channelFromEnum(final Channel channel) {
      this.channel = channel.toString();
      return this;
    }

    public PaymentOrderBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public PaymentOrderBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public PaymentOrderBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public PaymentOrderBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }

    public PaymentOrderBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PaymentOrderBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

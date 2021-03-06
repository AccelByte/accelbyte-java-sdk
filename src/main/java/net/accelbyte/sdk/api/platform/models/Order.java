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
public class Order extends Model {

  @JsonProperty("chargebackReversedTime")
  private String chargebackReversedTime;

  @JsonProperty("chargebackTime")
  private String chargebackTime;

  @JsonProperty("charged")
  private Boolean charged;

  @JsonProperty("chargedTime")
  private String chargedTime;

  @JsonProperty("countItemId")
  private String countItemId;

  @JsonProperty("countNamespace")
  private String countNamespace;

  @JsonProperty("countUserId")
  private String countUserId;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("creationOptions")
  private ADTOObjectForOrderCreationOptions creationOptions;

  @JsonProperty("currency")
  private CurrencySummary currency;

  @JsonProperty("discountedPrice")
  private Integer discountedPrice;

  @JsonProperty("expireTime")
  private String expireTime;

  @JsonProperty("ext")
  private Map<String, ?> ext;

  @JsonProperty("free")
  private Boolean free;

  @JsonProperty("fulfilledTime")
  private String fulfilledTime;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemSnapshot")
  private ItemSnapshot itemSnapshot;

  @JsonProperty("language")
  private String language;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("orderNo")
  private String orderNo;

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

  @JsonProperty("paymentRemainSeconds")
  private Integer paymentRemainSeconds;

  @JsonProperty("paymentStationUrl")
  private String paymentStationUrl;

  @JsonProperty("price")
  private Integer price;

  @JsonProperty("quantity")
  private Integer quantity;

  @JsonProperty("refundedTime")
  private String refundedTime;

  @JsonProperty("region")
  private String region;

  @JsonProperty("returnUrl")
  private String returnUrl;

  @JsonProperty("rvn")
  private Integer rvn;

  @JsonProperty("salesTax")
  private Integer salesTax;

  @JsonProperty("sandbox")
  private Boolean sandbox;

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusReason")
  private String statusReason;

  @JsonProperty("subtotalPrice")
  private Integer subtotalPrice;

  @JsonProperty("tax")
  private Integer tax;

  @JsonProperty("totalPrice")
  private Integer totalPrice;

  @JsonProperty("totalTax")
  private Integer totalTax;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("vat")
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
  public Order createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Order> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Order>>() {});
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
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGED("CHARGED"),
    CLOSED("CLOSED"),
    DELETED("DELETED"),
    FULFILLED("FULFILLED"),
    FULFILLFAILED("FULFILL_FAILED"),
    INIT("INIT"),
    REFUNDED("REFUNDED"),
    REFUNDING("REFUNDING"),
    REFUNDFAILED("REFUND_FAILED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class OrderBuilder {
    private String paymentProvider;
    private String status;

    public OrderBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public OrderBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }

    public OrderBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public OrderBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

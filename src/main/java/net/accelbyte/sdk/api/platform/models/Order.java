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
public class Order extends Model {

  @JsonProperty("chargebackReversedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackReversedTime;

  @JsonProperty("chargebackTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackTime;

  @JsonProperty("charged")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean charged;

  @JsonProperty("chargedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargedTime;

  @JsonProperty("countItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countItemId;

  @JsonProperty("countNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countNamespace;

  @JsonProperty("countUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countUserId;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("createdTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdTime;

  @JsonProperty("creationOptions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private OrderCreationOptions creationOptions;

  @JsonProperty("currency")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CurrencySummary currency;

  @JsonProperty("deduction")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer deduction;

  @JsonProperty("deductionDetails")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<DeductionDetail> deductionDetails;

  @JsonProperty("discountedPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountedPrice;

  @JsonProperty("expireTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String expireTime;

  @JsonProperty("ext")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> ext;

  @JsonProperty("finalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer finalPrice;

  @JsonProperty("free")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean free;

  @JsonProperty("fulfilledTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fulfilledTime;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemSnapshot")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ItemSnapshot itemSnapshot;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("orderBundleItemInfos")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<OrderBundleItemInfo> orderBundleItemInfos;

  @JsonProperty("orderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String orderNo;

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

  @JsonProperty("paymentRemainSeconds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer paymentRemainSeconds;

  @JsonProperty("paymentStationUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentStationUrl;

  @JsonProperty("price")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer price;

  @JsonProperty("quantity")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantity;

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

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("subtotalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer subtotalPrice;

  @JsonProperty("tax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer tax;

  @JsonProperty("totalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalPrice;

  @JsonProperty("totalTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalTax;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

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

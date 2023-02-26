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
public class OrderInfo extends Model {

  @JsonProperty("chargebackReversedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackReversedTime;

  @JsonProperty("chargebackTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargebackTime;

  @JsonProperty("chargedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String chargedTime;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("createdTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdTime;

  @JsonProperty("creationOptions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private OrderCreationOptions creationOptions;

  @JsonProperty("currency")
  private CurrencySummary currency;

  @JsonProperty("discountedPrice")
  private Integer discountedPrice;

  @JsonProperty("expireTime")
  private String expireTime;

  @JsonProperty("ext")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> ext;

  @JsonProperty("fulfilledTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fulfilledTime;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemSnapshot")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ItemSnapshot itemSnapshot;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("orderNo")
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
  private Integer paymentRemainSeconds;

  @JsonProperty("paymentStationUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentStationUrl;

  @JsonProperty("price")
  private Integer price;

  @JsonProperty("quantity")
  private Integer quantity;

  @JsonProperty("refundedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String refundedTime;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("salesTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer salesTax;

  @JsonProperty("sandbox")
  private Boolean sandbox;

  @JsonProperty("status")
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
  private String updatedAt;

  @JsonProperty("userId")
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
  public OrderInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OrderInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<OrderInfo>>() {});
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

  public static class OrderInfoBuilder {
    private String paymentProvider;
    private String status;

    public OrderInfoBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public OrderInfoBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }

    public OrderInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public OrderInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

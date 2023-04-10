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
public class PaymentOrderNotifySimulation extends Model {

  @JsonProperty("amount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer amount;

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("notifyType")
  private String notifyType;

  @JsonProperty("paymentProvider")
  private String paymentProvider;

  @JsonProperty("salesTax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer salesTax;

  @JsonProperty("vat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer vat;

  @JsonIgnore
  public String getNotifyType() {
    return this.notifyType;
  }

  @JsonIgnore
  public NotifyType getNotifyTypeAsEnum() {
    return NotifyType.valueOf(this.notifyType);
  }

  @JsonIgnore
  public void setNotifyType(final String notifyType) {
    this.notifyType = notifyType;
  }

  @JsonIgnore
  public void setNotifyTypeFromEnum(final NotifyType notifyType) {
    this.notifyType = notifyType.toString();
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
  public PaymentOrderNotifySimulation createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentOrderNotifySimulation> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PaymentOrderNotifySimulation>>() {});
  }

  public enum NotifyType {
    CHARGE("CHARGE"),
    REFUND("REFUND");

    private String value;

    NotifyType(String value) {
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

  public static class PaymentOrderNotifySimulationBuilder {
    private String notifyType;
    private String paymentProvider;

    public PaymentOrderNotifySimulationBuilder notifyType(final String notifyType) {
      this.notifyType = notifyType;
      return this;
    }

    public PaymentOrderNotifySimulationBuilder notifyTypeFromEnum(final NotifyType notifyType) {
      this.notifyType = notifyType.toString();
      return this;
    }

    public PaymentOrderNotifySimulationBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public PaymentOrderNotifySimulationBuilder paymentProviderFromEnum(
        final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }
  }
}

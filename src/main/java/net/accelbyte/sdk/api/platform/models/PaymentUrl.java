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
public class PaymentUrl extends Model {

  @JsonProperty("paymentProvider")
  private String paymentProvider;

  @JsonProperty("paymentType")
  private String paymentType;

  @JsonProperty("paymentUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentUrl;

  @JsonProperty("returnUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String returnUrl;

  @JsonProperty("sessionData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sessionData;

  @JsonProperty("sessionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sessionId;

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
  public String getPaymentType() {
    return this.paymentType;
  }

  @JsonIgnore
  public PaymentType getPaymentTypeAsEnum() {
    return PaymentType.valueOf(this.paymentType);
  }

  @JsonIgnore
  public void setPaymentType(final String paymentType) {
    this.paymentType = paymentType;
  }

  @JsonIgnore
  public void setPaymentTypeFromEnum(final PaymentType paymentType) {
    this.paymentType = paymentType.toString();
  }

  @JsonIgnore
  public PaymentUrl createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentUrl> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentUrl>>() {});
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

  public enum PaymentType {
    LINK("LINK"),
    QRCODE("QR_CODE");

    private String value;

    PaymentType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PaymentUrlBuilder {
    private String paymentProvider;
    private String paymentType;

    public PaymentUrlBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public PaymentUrlBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }

    public PaymentUrlBuilder paymentType(final String paymentType) {
      this.paymentType = paymentType;
      return this;
    }

    public PaymentUrlBuilder paymentTypeFromEnum(final PaymentType paymentType) {
      this.paymentType = paymentType.toString();
      return this;
    }
  }
}

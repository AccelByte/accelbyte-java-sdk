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
public class PaymentUrlCreate extends Model {

  @JsonProperty("paymentOrderNo")
  private String paymentOrderNo;

  @JsonProperty("paymentProvider")
  private String paymentProvider;

  @JsonProperty("returnUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String returnUrl;

  @JsonProperty("ui")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ui;

  @JsonProperty("zipCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String zipCode;

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
  public PaymentUrlCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentUrlCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentUrlCreate>>() {});
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

  public static class PaymentUrlCreateBuilder {
    private String paymentProvider;

    public PaymentUrlCreateBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public PaymentUrlCreateBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }
  }
}

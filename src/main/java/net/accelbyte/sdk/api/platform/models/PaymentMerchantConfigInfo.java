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
public class PaymentMerchantConfigInfo extends Model {

  @JsonProperty("adyenConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AdyenConfig adyenConfig;

  @JsonProperty("adyenSandboxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AdyenConfig adyenSandboxConfig;

  @JsonProperty("aliPayConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AliPayConfig aliPayConfig;

  @JsonProperty("aliPaySandboxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AliPayConfig aliPaySandboxConfig;

  @JsonProperty("checkoutConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CheckoutConfig checkoutConfig;

  @JsonProperty("checkoutSandboxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CheckoutConfig checkoutSandboxConfig;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("payPalConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private PayPalConfig payPalConfig;

  @JsonProperty("payPalSandboxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private PayPalConfig payPalSandboxConfig;

  @JsonProperty("stripeConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private StripeConfig stripeConfig;

  @JsonProperty("stripeSandboxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private StripeConfig stripeSandboxConfig;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("wxPayConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private WxPayConfigInfo wxPayConfig;

  @JsonProperty("xsollaConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private XsollaConfig xsollaConfig;

  @JsonProperty("xsollaPaywallConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private XsollaPaywallConfig xsollaPaywallConfig;

  @JsonIgnore
  public PaymentMerchantConfigInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentMerchantConfigInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PaymentMerchantConfigInfo>>() {});
  }
}

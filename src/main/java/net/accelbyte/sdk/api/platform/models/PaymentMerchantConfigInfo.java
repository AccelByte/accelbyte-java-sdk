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
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentMerchantConfigInfo extends Model {

    @JsonProperty("adyenConfig")
    private AdyenConfig adyenConfig;

    @JsonProperty("adyenSandboxConfig")
    private AdyenConfig adyenSandboxConfig;

    @JsonProperty("aliPayConfig")
    private AliPayConfig aliPayConfig;

    @JsonProperty("aliPaySandboxConfig")
    private AliPayConfig aliPaySandboxConfig;

    @JsonProperty("checkoutConfig")
    private CheckoutConfig checkoutConfig;

    @JsonProperty("checkoutSandboxConfig")
    private CheckoutConfig checkoutSandboxConfig;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("id")
    private String id;

    @JsonProperty("payPalConfig")
    private PayPalConfig payPalConfig;

    @JsonProperty("payPalSandboxConfig")
    private PayPalConfig payPalSandboxConfig;

    @JsonProperty("stripeConfig")
    private StripeConfig stripeConfig;

    @JsonProperty("stripeSandboxConfig")
    private StripeConfig stripeSandboxConfig;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("wxPayConfig")
    private WxPayConfigInfo wxPayConfig;

    @JsonProperty("xsollaConfig")
    private XsollaConfig xsollaConfig;

    @JsonProperty("xsollaPaywallConfig")
    private XsollaPaywallConfig xsollaPaywallConfig;



    @JsonIgnore
    public PaymentMerchantConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentMerchantConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentMerchantConfigInfo>>() {});
    }

    
}
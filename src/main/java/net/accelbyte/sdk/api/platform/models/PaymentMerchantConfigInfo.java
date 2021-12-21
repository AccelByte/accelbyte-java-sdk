package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class PaymentMerchantConfigInfo extends Model {

    @JsonProperty("adyenConfig")
    AdyenConfig adyenConfig;
    @JsonProperty("adyenSandboxConfig")
    AdyenConfig adyenSandboxConfig;
    @JsonProperty("aliPayConfig")
    AliPayConfig aliPayConfig;
    @JsonProperty("aliPaySandboxConfig")
    AliPayConfig aliPaySandboxConfig;
    @JsonProperty("checkoutConfig")
    CheckoutConfig checkoutConfig;
    @JsonProperty("checkoutSandboxConfig")
    CheckoutConfig checkoutSandboxConfig;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("id")
    String id;
    @JsonProperty("payPalConfig")
    PayPalConfig payPalConfig;
    @JsonProperty("payPalSandboxConfig")
    PayPalConfig payPalSandboxConfig;
    @JsonProperty("stripeConfig")
    StripeConfig stripeConfig;
    @JsonProperty("stripeSandboxConfig")
    StripeConfig stripeSandboxConfig;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("wxPayConfig")
    WxPayConfigInfo wxPayConfig;
    @JsonProperty("xsollaConfig")
    XsollaConfig xsollaConfig;
    @JsonProperty("xsollaPaywallConfig")
    XsollaPaywallConfig xsollaPaywallConfig;

    public PaymentMerchantConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("adyenConfig", "adyenConfig");
        result.put("adyenSandboxConfig", "adyenSandboxConfig");
        result.put("aliPayConfig", "aliPayConfig");
        result.put("aliPaySandboxConfig", "aliPaySandboxConfig");
        result.put("checkoutConfig", "checkoutConfig");
        result.put("checkoutSandboxConfig", "checkoutSandboxConfig");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("payPalConfig", "payPalConfig");
        result.put("payPalSandboxConfig", "payPalSandboxConfig");
        result.put("stripeConfig", "stripeConfig");
        result.put("stripeSandboxConfig", "stripeSandboxConfig");
        result.put("updatedAt", "updatedAt");
        result.put("wxPayConfig", "wxPayConfig");
        result.put("xsollaConfig", "xsollaConfig");
        result.put("xsollaPaywallConfig", "xsollaPaywallConfig");
        return result;
    }
}
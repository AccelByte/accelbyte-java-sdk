package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
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

    @JsonIgnore
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
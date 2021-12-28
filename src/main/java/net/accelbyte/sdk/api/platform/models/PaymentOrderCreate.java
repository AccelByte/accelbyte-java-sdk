package net.accelbyte.sdk.api.platform.models;

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
public class PaymentOrderCreate extends Model {

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencyNamespace")
    private String currencyNamespace;

    @JsonProperty("customParameters")
    private Map<String, ?> customParameters;

    @JsonProperty("description")
    private String description;

    @JsonProperty("extOrderNo")
    private String extOrderNo;

    @JsonProperty("extUserId")
    private String extUserId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("language")
    private String language;

    @JsonProperty("metadata")
    private Map<String, String> metadata;

    @JsonProperty("notifyUrl")
    private String notifyUrl;

    @JsonProperty("omitNotification")
    private Boolean omitNotification;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("recurringPaymentOrderNo")
    private String recurringPaymentOrderNo;

    @JsonProperty("region")
    private String region;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("subscriptionId")
    private String subscriptionId;

    @JsonProperty("title")
    private String title;

    public PaymentOrderCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentOrderCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderCreate>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currencyCode", "currencyCode");
        result.put("currencyNamespace", "currencyNamespace");
        result.put("customParameters", "customParameters");
        result.put("description", "description");
        result.put("extOrderNo", "extOrderNo");
        result.put("extUserId", "extUserId");
        result.put("itemType", "itemType");
        result.put("language", "language");
        result.put("metadata", "metadata");
        result.put("notifyUrl", "notifyUrl");
        result.put("omitNotification", "omitNotification");
        result.put("price", "price");
        result.put("recurringPaymentOrderNo", "recurringPaymentOrderNo");
        result.put("region", "region");
        result.put("returnUrl", "returnUrl");
        result.put("sandbox", "sandbox");
        result.put("sku", "sku");
        result.put("subscriptionId", "subscriptionId");
        result.put("title", "title");
        return result;
    }
}
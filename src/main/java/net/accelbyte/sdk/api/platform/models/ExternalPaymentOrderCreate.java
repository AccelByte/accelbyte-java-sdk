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
public class ExternalPaymentOrderCreate extends Model {

    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("currencyNamespace")
    String currencyNamespace;
    @JsonProperty("customParameters")
    Map<String, ?> customParameters;
    @JsonProperty("description")
    String description;
    @JsonProperty("extOrderNo")
    String extOrderNo;
    @JsonProperty("extUserId")
    String extUserId;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("language")
    String language;
    @JsonProperty("metadata")
    Map<String, String> metadata;
    @JsonProperty("notifyUrl")
    String notifyUrl;
    @JsonProperty("omitNotification")
    Boolean omitNotification;
    @JsonProperty("price")
    Integer price;
    @JsonProperty("recurringPaymentOrderNo")
    String recurringPaymentOrderNo;
    @JsonProperty("region")
    String region;
    @JsonProperty("returnUrl")
    String returnUrl;
    @JsonProperty("sandbox")
    Boolean sandbox;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("subscriptionId")
    String subscriptionId;
    @JsonProperty("targetNamespace")
    String targetNamespace;
    @JsonProperty("targetUserId")
    String targetUserId;
    @JsonProperty("title")
    String title;

    public ExternalPaymentOrderCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
        result.put("targetNamespace", "targetNamespace");
        result.put("targetUserId", "targetUserId");
        result.put("title", "title");
        return result;
    }
}
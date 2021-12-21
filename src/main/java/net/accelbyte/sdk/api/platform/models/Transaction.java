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
public class Transaction extends Model {

    @JsonProperty("additionalData")
    AdditionalData additionalData;
    @JsonProperty("amount")
    Integer amount;
    @JsonProperty("currency")
    CurrencySummary currency;
    @JsonProperty("extMessage")
    String extMessage;
    @JsonProperty("extStatusCode")
    String extStatusCode;
    @JsonProperty("extTxId")
    String extTxId;
    @JsonProperty("merchantId")
    String merchantId;
    @JsonProperty("notified")
    Boolean notified;
    @JsonProperty("paymentMethod")
    String paymentMethod;
    @JsonProperty("paymentMethodFee")
    Integer paymentMethodFee;
    @JsonProperty("paymentProviderFee")
    Integer paymentProviderFee;
    @JsonProperty("provider")
    String provider;
    @JsonProperty("salesTax")
    Integer salesTax;
    @JsonProperty("status")
    String status;
    @JsonProperty("tax")
    Integer tax;
    @JsonProperty("txEndTime")
    String txEndTime;
    @JsonProperty("txId")
    String txId;
    @JsonProperty("type")
    String type;
    @JsonProperty("vat")
    Integer vat;

    public Transaction createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("amount", "amount");
        result.put("currency", "currency");
        result.put("extMessage", "extMessage");
        result.put("extStatusCode", "extStatusCode");
        result.put("extTxId", "extTxId");
        result.put("merchantId", "merchantId");
        result.put("notified", "notified");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentMethodFee", "paymentMethodFee");
        result.put("paymentProviderFee", "paymentProviderFee");
        result.put("provider", "provider");
        result.put("salesTax", "salesTax");
        result.put("status", "status");
        result.put("tax", "tax");
        result.put("txEndTime", "txEndTime");
        result.put("txId", "txId");
        result.put("type", "type");
        result.put("vat", "vat");
        return result;
    }
}
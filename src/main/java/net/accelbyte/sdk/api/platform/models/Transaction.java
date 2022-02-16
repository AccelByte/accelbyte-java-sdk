/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

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
public class Transaction extends Model {

    @JsonProperty("additionalData")
    private AdditionalData additionalData;

    @JsonProperty("amount")
    private Integer amount;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("extMessage")
    private String extMessage;

    @JsonProperty("extStatusCode")
    private String extStatusCode;

    @JsonProperty("extTxId")
    private String extTxId;

    @JsonProperty("merchantId")
    private String merchantId;

    @JsonProperty("notified")
    private Boolean notified;

    @JsonProperty("paymentMethod")
    private String paymentMethod;

    @JsonProperty("paymentMethodFee")
    private Integer paymentMethodFee;

    @JsonProperty("paymentProviderFee")
    private Integer paymentProviderFee;

    @JsonProperty("provider")
    private String provider;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tax")
    private Integer tax;

    @JsonProperty("txEndTime")
    private String txEndTime;

    @JsonProperty("txId")
    private String txId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("vat")
    private Integer vat;

    @JsonIgnore
    public Transaction createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<Transaction> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Transaction>>() {});
    }

    @JsonIgnore
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
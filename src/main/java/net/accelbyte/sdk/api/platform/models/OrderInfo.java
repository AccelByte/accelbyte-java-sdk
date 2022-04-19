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
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfo extends Model {

    @JsonProperty("chargebackReversedTime")
    private String chargebackReversedTime;

    @JsonProperty("chargebackTime")
    private String chargebackTime;

    @JsonProperty("chargedTime")
    private String chargedTime;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("createdTime")
    private String createdTime;

    @JsonProperty("currency")
    private CurrencySummary currency;

    @JsonProperty("discountedPrice")
    private Integer discountedPrice;

    @JsonProperty("expireTime")
    private String expireTime;

    @JsonProperty("ext")
    private Map<String, ?> ext;

    @JsonProperty("fulfilledTime")
    private String fulfilledTime;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("orderNo")
    private String orderNo;

    @JsonProperty("paymentMethod")
    private String paymentMethod;

    @JsonProperty("paymentMethodFee")
    private Integer paymentMethodFee;

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("paymentProvider")
    private String paymentProvider;

    @JsonProperty("paymentProviderFee")
    private Integer paymentProviderFee;

    @JsonProperty("paymentRemainSeconds")
    private Integer paymentRemainSeconds;

    @JsonProperty("paymentStationUrl")
    private String paymentStationUrl;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("refundedTime")
    private String refundedTime;

    @JsonProperty("region")
    private String region;

    @JsonProperty("salesTax")
    private Integer salesTax;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("subtotalPrice")
    private Integer subtotalPrice;

    @JsonProperty("tax")
    private Integer tax;

    @JsonProperty("totalPrice")
    private Integer totalPrice;

    @JsonProperty("totalTax")
    private Integer totalTax;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("vat")
    private Integer vat;

    @JsonIgnore
    public OrderInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OrderInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OrderInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("chargebackReversedTime", "chargebackReversedTime");
        result.put("chargebackTime", "chargebackTime");
        result.put("chargedTime", "chargedTime");
        result.put("createdAt", "createdAt");
        result.put("createdTime", "createdTime");
        result.put("currency", "currency");
        result.put("discountedPrice", "discountedPrice");
        result.put("expireTime", "expireTime");
        result.put("ext", "ext");
        result.put("fulfilledTime", "fulfilledTime");
        result.put("itemId", "itemId");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("orderNo", "orderNo");
        result.put("paymentMethod", "paymentMethod");
        result.put("paymentMethodFee", "paymentMethodFee");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("paymentProvider", "paymentProvider");
        result.put("paymentProviderFee", "paymentProviderFee");
        result.put("paymentRemainSeconds", "paymentRemainSeconds");
        result.put("paymentStationUrl", "paymentStationUrl");
        result.put("price", "price");
        result.put("quantity", "quantity");
        result.put("refundedTime", "refundedTime");
        result.put("region", "region");
        result.put("salesTax", "salesTax");
        result.put("sandbox", "sandbox");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("subtotalPrice", "subtotalPrice");
        result.put("tax", "tax");
        result.put("totalPrice", "totalPrice");
        result.put("totalTax", "totalTax");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("vat", "vat");
        return result;
    }
}
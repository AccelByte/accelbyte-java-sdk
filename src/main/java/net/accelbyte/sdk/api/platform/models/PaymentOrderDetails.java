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
public class PaymentOrderDetails extends Model {

    @JsonProperty("charging")
    private Boolean charging;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencySymbol")
    private String currencySymbol;

    @JsonProperty("description")
    private String description;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("price")
    private String price;

    @JsonProperty("region")
    private String region;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("title")
    private String title;

    @JsonIgnore
    public PaymentOrderDetails createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentOrderDetails> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderDetails>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("charging", "charging");
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("description", "description");
        result.put("displayName", "displayName");
        result.put("price", "price");
        result.put("region", "region");
        result.put("sandbox", "sandbox");
        result.put("title", "title");
        return result;
    }
}
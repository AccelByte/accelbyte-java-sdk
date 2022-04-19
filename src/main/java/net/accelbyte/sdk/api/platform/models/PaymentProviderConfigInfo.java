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
public class PaymentProviderConfigInfo extends Model {

    @JsonProperty("aggregate")
    private String aggregate;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("paymentMerchantConfigId")
    private String paymentMerchantConfigId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("sandboxTaxJarApiToken")
    private String sandboxTaxJarApiToken;

    @JsonProperty("specials")
    private List<String> specials;

    @JsonProperty("taxJarApiToken")
    private String taxJarApiToken;

    @JsonProperty("taxJarEnabled")
    private Boolean taxJarEnabled;

    @JsonProperty("useGlobalTaxJarApiToken")
    private Boolean useGlobalTaxJarApiToken;

    @JsonIgnore
    public PaymentProviderConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentProviderConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentProviderConfigInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("aggregate", "aggregate");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("paymentMerchantConfigId", "paymentMerchantConfigId");
        result.put("region", "region");
        result.put("sandboxTaxJarApiToken", "sandboxTaxJarApiToken");
        result.put("specials", "specials");
        result.put("taxJarApiToken", "taxJarApiToken");
        result.put("taxJarEnabled", "taxJarEnabled");
        result.put("useGlobalTaxJarApiToken", "useGlobalTaxJarApiToken");
        return result;
    }
}
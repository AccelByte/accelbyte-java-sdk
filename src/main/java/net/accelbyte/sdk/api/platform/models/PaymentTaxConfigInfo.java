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
public class PaymentTaxConfigInfo extends Model {

    @JsonProperty("sandboxTaxJarApiToken")
    private String sandboxTaxJarApiToken;

    @JsonProperty("taxJarApiToken")
    private String taxJarApiToken;

    @JsonProperty("taxJarEnabled")
    private Boolean taxJarEnabled;

    @JsonProperty("taxJarProductCodesMapping")
    private Map<String, String> taxJarProductCodesMapping;

    @JsonIgnore
    public PaymentTaxConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentTaxConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentTaxConfigInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("sandboxTaxJarApiToken", "sandboxTaxJarApiToken");
        result.put("taxJarApiToken", "taxJarApiToken");
        result.put("taxJarEnabled", "taxJarEnabled");
        result.put("taxJarProductCodesMapping", "taxJarProductCodesMapping");
        return result;
    }
}
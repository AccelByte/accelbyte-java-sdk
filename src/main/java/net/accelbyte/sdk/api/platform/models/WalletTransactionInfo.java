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
public class WalletTransactionInfo extends Model {

    @JsonProperty("amount")
    private Integer amount;

    @JsonProperty("balanceSource")
    private String balanceSource;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("operator")
    private String operator;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("walletAction")
    private String walletAction;

    @JsonProperty("walletId")
    private String walletId;

    @JsonIgnore
    public WalletTransactionInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<WalletTransactionInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<WalletTransactionInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("amount", "amount");
        result.put("balanceSource", "balanceSource");
        result.put("createdAt", "createdAt");
        result.put("currencyCode", "currencyCode");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("reason", "reason");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("walletAction", "walletAction");
        result.put("walletId", "walletId");
        return result;
    }
}
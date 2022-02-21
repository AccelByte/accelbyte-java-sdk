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
public class AppleIAPReceipt extends Model {

    @JsonProperty("excludeOldTransactions")
    private Boolean excludeOldTransactions;

    @JsonProperty("language")
    private String language;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("receiptData")
    private String receiptData;

    @JsonProperty("region")
    private String region;

    @JsonProperty("transactionId")
    private String transactionId;

    @JsonIgnore
    public AppleIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AppleIAPReceipt> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AppleIAPReceipt>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("excludeOldTransactions", "excludeOldTransactions");
        result.put("language", "language");
        result.put("productId", "productId");
        result.put("receiptData", "receiptData");
        result.put("region", "region");
        result.put("transactionId", "transactionId");
        return result;
    }
}
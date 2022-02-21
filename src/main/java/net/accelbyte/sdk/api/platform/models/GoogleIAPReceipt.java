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
public class GoogleIAPReceipt extends Model {

    @JsonProperty("language")
    private String language;

    @JsonProperty("orderId")
    private String orderId;

    @JsonProperty("packageName")
    private String packageName;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("purchaseTime")
    private Integer purchaseTime;

    @JsonProperty("purchaseToken")
    private String purchaseToken;

    @JsonProperty("region")
    private String region;

    @JsonIgnore
    public GoogleIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<GoogleIAPReceipt> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<GoogleIAPReceipt>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("language", "language");
        result.put("orderId", "orderId");
        result.put("packageName", "packageName");
        result.put("productId", "productId");
        result.put("purchaseTime", "purchaseTime");
        result.put("purchaseToken", "purchaseToken");
        result.put("region", "region");
        return result;
    }
}
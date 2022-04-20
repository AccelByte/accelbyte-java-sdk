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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SteamSyncRequest extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("language")
    private String language;

    @JsonProperty("price")
    private Float price;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("steamId")
    private String steamId;



    @JsonIgnore
    public SteamSyncRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SteamSyncRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SteamSyncRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("currencyCode", "currencyCode");
        result.put("language", "language");
        result.put("price", "price");
        result.put("productId", "productId");
        result.put("region", "region");
        result.put("steamId", "steamId");
        return result;
    }
    
    public static class SteamSyncRequestBuilder {
        
    }
}
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
public class AdyenConfig extends Model {

    @JsonProperty("allowedPaymentMethods")
    private List<String> allowedPaymentMethods;

    @JsonProperty("apiKey")
    private String apiKey;

    @JsonProperty("authoriseAsCapture")
    private Boolean authoriseAsCapture;

    @JsonProperty("blockedPaymentMethods")
    private List<String> blockedPaymentMethods;

    @JsonProperty("liveEndpointUrlPrefix")
    private String liveEndpointUrlPrefix;

    @JsonProperty("merchantAccount")
    private String merchantAccount;

    @JsonProperty("notificationHmacKey")
    private String notificationHmacKey;

    @JsonProperty("notificationPassword")
    private String notificationPassword;

    @JsonProperty("notificationUsername")
    private String notificationUsername;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("settings")
    private String settings;

    @JsonIgnore
    public AdyenConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AdyenConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AdyenConfig>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allowedPaymentMethods", "allowedPaymentMethods");
        result.put("apiKey", "apiKey");
        result.put("authoriseAsCapture", "authoriseAsCapture");
        result.put("blockedPaymentMethods", "blockedPaymentMethods");
        result.put("liveEndpointUrlPrefix", "liveEndpointUrlPrefix");
        result.put("merchantAccount", "merchantAccount");
        result.put("notificationHmacKey", "notificationHmacKey");
        result.put("notificationPassword", "notificationPassword");
        result.put("notificationUsername", "notificationUsername");
        result.put("returnUrl", "returnUrl");
        result.put("settings", "settings");
        return result;
    }
}
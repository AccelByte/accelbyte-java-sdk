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
public class PaymentNotificationInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("externalId")
    private String externalId;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("notification")
    private Map<String, ?> notification;

    @JsonProperty("notificationSource")
    private String notificationSource;

    @JsonProperty("notificationType")
    private String notificationType;

    @JsonProperty("paymentOrderNo")
    private String paymentOrderNo;

    @JsonProperty("status")
    private String status;

    @JsonProperty("statusReason")
    private String statusReason;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public PaymentNotificationInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentNotificationInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentNotificationInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("externalId", "externalId");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("notification", "notification");
        result.put("notificationSource", "notificationSource");
        result.put("notificationType", "notificationType");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("status", "status");
        result.put("statusReason", "statusReason");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
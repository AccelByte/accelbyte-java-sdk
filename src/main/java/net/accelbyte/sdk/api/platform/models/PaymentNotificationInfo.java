package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class PaymentNotificationInfo extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("externalId")
    String externalId;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("notification")
    Map<String, ?> notification;
    @JsonProperty("notificationSource")
    String notificationSource;
    @JsonProperty("notificationType")
    String notificationType;
    @JsonProperty("paymentOrderNo")
    String paymentOrderNo;
    @JsonProperty("status")
    String status;
    @JsonProperty("statusReason")
    String statusReason;
    @JsonProperty("updatedAt")
    String updatedAt;

    public PaymentNotificationInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
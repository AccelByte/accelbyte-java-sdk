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
public class PaymentOrderRefundResult extends Model {

    @JsonProperty("createdTime")
    String createdTime;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("paymentOrderNo")
    String paymentOrderNo;
    @JsonProperty("refundedTime")
    String refundedTime;
    @JsonProperty("status")
    String status;
    @JsonProperty("targetNamespace")
    String targetNamespace;
    @JsonProperty("targetUserId")
    String targetUserId;

    public PaymentOrderRefundResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdTime", "createdTime");
        result.put("namespace", "namespace");
        result.put("paymentOrderNo", "paymentOrderNo");
        result.put("refundedTime", "refundedTime");
        result.put("status", "status");
        result.put("targetNamespace", "targetNamespace");
        result.put("targetUserId", "targetUserId");
        return result;
    }
}
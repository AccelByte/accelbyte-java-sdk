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
public class PaymentOrderChargeStatus extends Model {

    @JsonProperty("charging")
    private Boolean charging;

    @JsonProperty("status")
    private String status;


    
    @JsonIgnore
    public String getStatus() {
        return this.status;
    }
    
    @JsonIgnore
    public Status getStatusAsEnum() {
        return Status.valueOf(this.status);
    }
    
    @JsonIgnore
    public void setStatus(final String status) {
        this.status = status;
    }
    
    @JsonIgnore
    public void setStatusFromEnum(final Status status) {
        this.status = status.toString();
    }

    @JsonIgnore
    public PaymentOrderChargeStatus createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentOrderChargeStatus> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderChargeStatus>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("charging", "charging");
        result.put("status", "status");
        return result;
    }
    
    public enum Status {
        INIT("INIT"),
        AUTHORISED("AUTHORISED"),
        AUTHORISEFAILED("AUTHORISEFAILED"),
        CHARGED("CHARGED"),
        CHARGEFAILED("CHARGEFAILED"),
        NOTIFICATIONOFCHARGEBACK("NOTIFICATIONOFCHARGEBACK"),
        REQUESTFORINFORMATION("REQUESTFORINFORMATION"),
        CHARGEBACK("CHARGEBACK"),
        CHARGEBACKREVERSED("CHARGEBACKREVERSED"),
        REFUNDING("REFUNDING"),
        REFUNDED("REFUNDED"),
        REFUNDFAILED("REFUNDFAILED"),
        DELETED("DELETED");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class PaymentOrderChargeStatusBuilder {
        private String status;
        
        
        public PaymentOrderChargeStatusBuilder status(final String status) {
            this.status = status;
            return this;
        }
        
        public PaymentOrderChargeStatusBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
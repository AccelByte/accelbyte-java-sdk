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
public class XblReconcileResult extends Model {

    @JsonProperty("iapOrderStatus")
    private String iapOrderStatus;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("transactionId")
    private String transactionId;

    @JsonProperty("xboxProductId")
    private String xboxProductId;


    
    @JsonIgnore
    public String getIapOrderStatus() {
        return this.iapOrderStatus;
    }
    
    @JsonIgnore
    public IapOrderStatus getIapOrderStatusAsEnum() {
        return IapOrderStatus.valueOf(this.iapOrderStatus);
    }
    
    @JsonIgnore
    public void setIapOrderStatus(final String iapOrderStatus) {
        this.iapOrderStatus = iapOrderStatus;
    }
    
    @JsonIgnore
    public void setIapOrderStatusFromEnum(final IapOrderStatus iapOrderStatus) {
        this.iapOrderStatus = iapOrderStatus.toString();
    }

    @JsonIgnore
    public XblReconcileResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<XblReconcileResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XblReconcileResult>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("iapOrderStatus", "iapOrderStatus");
        result.put("itemId", "itemId");
        result.put("sku", "sku");
        result.put("transactionId", "transactionId");
        result.put("xboxProductId", "xboxProductId");
        return result;
    }
    
    public enum IapOrderStatus {
        VERIFIED("VERIFIED"),
        FULFILLED("FULFILLED"),
        FAILED("FAILED");

        private String value;

        IapOrderStatus(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class XblReconcileResultBuilder {
        private String iapOrderStatus;
        
        
        public XblReconcileResultBuilder iapOrderStatus(final String iapOrderStatus) {
            this.iapOrderStatus = iapOrderStatus;
            return this;
        }
        
        public XblReconcileResultBuilder iapOrderStatusFromEnum(final IapOrderStatus iapOrderStatus) {
            this.iapOrderStatus = iapOrderStatus.toString();
            return this;
        }
    }
}
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
public class ExternalPaymentOrderCreate extends Model {

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencyNamespace")
    private String currencyNamespace;

    @JsonProperty("customParameters")
    private Map<String, ?> customParameters;

    @JsonProperty("description")
    private String description;

    @JsonProperty("extOrderNo")
    private String extOrderNo;

    @JsonProperty("extUserId")
    private String extUserId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("language")
    private String language;

    @JsonProperty("metadata")
    private Map<String, String> metadata;

    @JsonProperty("notifyUrl")
    private String notifyUrl;

    @JsonProperty("omitNotification")
    private Boolean omitNotification;

    @JsonProperty("platform")
    private String platform;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("recurringPaymentOrderNo")
    private String recurringPaymentOrderNo;

    @JsonProperty("region")
    private String region;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("sandbox")
    private Boolean sandbox;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("subscriptionId")
    private String subscriptionId;

    @JsonProperty("targetNamespace")
    private String targetNamespace;

    @JsonProperty("targetUserId")
    private String targetUserId;

    @JsonProperty("title")
    private String title;


    
    @JsonIgnore
    public String getItemType() {
        return this.itemType;
    }
    
    @JsonIgnore
    public ItemType getItemTypeAsEnum() {
        return ItemType.valueOf(this.itemType);
    }
    
    @JsonIgnore
    public void setItemType(final String itemType) {
        this.itemType = itemType;
    }
    
    @JsonIgnore
    public void setItemTypeFromEnum(final ItemType itemType) {
        this.itemType = itemType.toString();
    }

    @JsonIgnore
    public ExternalPaymentOrderCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ExternalPaymentOrderCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ExternalPaymentOrderCreate>>() {});
    }

    
    public enum ItemType {
        APP("APP"),
        COINS("COINS"),
        INGAMEITEM("INGAMEITEM"),
        BUNDLE("BUNDLE"),
        CODE("CODE"),
        SUBSCRIPTION("SUBSCRIPTION"),
        SEASON("SEASON"),
        MEDIA("MEDIA");

        private String value;

        ItemType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class ExternalPaymentOrderCreateBuilder {
        private String itemType;
        
        
        public ExternalPaymentOrderCreateBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }
        
        public ExternalPaymentOrderCreateBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
    }
}
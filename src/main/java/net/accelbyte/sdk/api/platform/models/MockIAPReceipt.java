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
public class MockIAPReceipt extends Model {

    @JsonProperty("itemIdentityType")
    private String itemIdentityType;

    @JsonProperty("language")
    private String language;

    @JsonProperty("productId")
    private String productId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("type")
    private String type;


    
    @JsonIgnore
    public String getItemIdentityType() {
        return this.itemIdentityType;
    }
    
    @JsonIgnore
    public ItemIdentityType getItemIdentityTypeAsEnum() {
        return ItemIdentityType.valueOf(this.itemIdentityType);
    }
    
    @JsonIgnore
    public void setItemIdentityType(final String itemIdentityType) {
        this.itemIdentityType = itemIdentityType;
    }
    
    @JsonIgnore
    public void setItemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
        this.itemIdentityType = itemIdentityType.toString();
    }
    
    @JsonIgnore
    public String getType() {
        return this.type;
    }
    
    @JsonIgnore
    public Type getTypeAsEnum() {
        return Type.valueOf(this.type);
    }
    
    @JsonIgnore
    public void setType(final String type) {
        this.type = type;
    }
    
    @JsonIgnore
    public void setTypeFromEnum(final Type type) {
        this.type = type.toString();
    }

    @JsonIgnore
    public MockIAPReceipt createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<MockIAPReceipt> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<MockIAPReceipt>>() {});
    }

    
    public enum ItemIdentityType {
        ITEMID("ITEMID"),
        ITEMSKU("ITEMSKU");

        private String value;

        ItemIdentityType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Type {
        APPLE("APPLE"),
        GOOGLE("GOOGLE"),
        PLAYSTATION("PLAYSTATION"),
        STEAM("STEAM"),
        XBOX("XBOX"),
        STADIA("STADIA"),
        EPICGAMES("EPICGAMES"),
        TWITCH("TWITCH");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class MockIAPReceiptBuilder {
        private String itemIdentityType;
        private String type;
        
        
        public MockIAPReceiptBuilder itemIdentityType(final String itemIdentityType) {
            this.itemIdentityType = itemIdentityType;
            return this;
        }
        
        public MockIAPReceiptBuilder itemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
            this.itemIdentityType = itemIdentityType.toString();
            return this;
        }
        
        public MockIAPReceiptBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public MockIAPReceiptBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
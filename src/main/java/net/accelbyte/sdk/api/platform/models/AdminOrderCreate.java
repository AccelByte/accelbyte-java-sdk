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
public class AdminOrderCreate extends Model {

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("discountedPrice")
    private Integer discountedPrice;

    @JsonProperty("ext")
    private Map<String, ?> ext;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("language")
    private String language;

    @JsonProperty("platform")
    private String platform;

    @JsonProperty("price")
    private Integer price;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("region")
    private String region;

    @JsonProperty("returnUrl")
    private String returnUrl;

    @JsonProperty("sandbox")
    private Boolean sandbox;


    
    @JsonIgnore
    public String getPlatform() {
        return this.platform;
    }
    
    @JsonIgnore
    public Platform getPlatformAsEnum() {
        return Platform.valueOf(this.platform);
    }
    
    @JsonIgnore
    public void setPlatform(final String platform) {
        this.platform = platform;
    }
    
    @JsonIgnore
    public void setPlatformFromEnum(final Platform platform) {
        this.platform = platform.toString();
    }

    @JsonIgnore
    public AdminOrderCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AdminOrderCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AdminOrderCreate>>() {});
    }

    
    public enum Platform {
        Epic("Epic"),
        GooglePlay("GooglePlay"),
        IOS("IOS"),
        Nintendo("Nintendo"),
        Other("Other"),
        Playstation("Playstation"),
        Steam("Steam"),
        Xbox("Xbox");

        private String value;

        Platform(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class AdminOrderCreateBuilder {
        private String platform;
        
        
        public AdminOrderCreateBuilder platform(final String platform) {
            this.platform = platform;
            return this;
        }
        
        public AdminOrderCreateBuilder platformFromEnum(final Platform platform) {
            this.platform = platform.toString();
            return this;
        }
    }
}
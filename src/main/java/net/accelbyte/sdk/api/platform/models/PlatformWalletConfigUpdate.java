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
public class PlatformWalletConfigUpdate extends Model {

    @JsonProperty("allowedBalanceOrigins")
    private List<String> allowedBalanceOrigins;


    
    @JsonIgnore
    public List<String> getAllowedBalanceOrigins() {
        return this.allowedBalanceOrigins;
    }
    
    @JsonIgnore
    public List<AllowedBalanceOrigins> getAllowedBalanceOriginsAsEnum() {
        ArrayList<AllowedBalanceOrigins> en = new ArrayList<AllowedBalanceOrigins>();
        for(String e : this.allowedBalanceOrigins) en.add(AllowedBalanceOrigins.valueOf(e));
        return en;
    }
    
    @JsonIgnore
    public void setAllowedBalanceOrigins(final List<String> allowedBalanceOrigins) {
        this.allowedBalanceOrigins = allowedBalanceOrigins;
    }
    
    @JsonIgnore
    public void setAllowedBalanceOriginsFromEnum(final List<AllowedBalanceOrigins> allowedBalanceOrigins) {
        ArrayList<String> en = new ArrayList<String>();
        for(AllowedBalanceOrigins e : allowedBalanceOrigins) en.add(e.toString());
        this.allowedBalanceOrigins = en;
    }

    @JsonIgnore
    public PlatformWalletConfigUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PlatformWalletConfigUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PlatformWalletConfigUpdate>>() {});
    }

    
    public enum AllowedBalanceOrigins {
        Epic("Epic"),
        GooglePlay("GooglePlay"),
        IOS("IOS"),
        Nintendo("Nintendo"),
        Other("Other"),
        Playstation("Playstation"),
        Stadia("Stadia"),
        Steam("Steam"),
        System("System"),
        Twitch("Twitch"),
        Xbox("Xbox");

        private String value;

        AllowedBalanceOrigins(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class PlatformWalletConfigUpdateBuilder {
        private List<String> allowedBalanceOrigins;
        
        
        public PlatformWalletConfigUpdateBuilder allowedBalanceOrigins(final List<String> allowedBalanceOrigins) {
            this.allowedBalanceOrigins = allowedBalanceOrigins;
            return this;
        }
        
        public PlatformWalletConfigUpdateBuilder allowedBalanceOriginsFromEnum(final List<AllowedBalanceOrigins> allowedBalanceOrigins) {
            ArrayList<String> en = new ArrayList<String>();
            for(AllowedBalanceOrigins e : allowedBalanceOrigins) en.add(e.toString());
            this.allowedBalanceOrigins = en;
            return this;
        }
    }
}
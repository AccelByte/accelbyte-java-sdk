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
public class PlatformReward extends Model {

    @JsonProperty("currency")
    private PlatformRewardCurrency currency;

    @JsonProperty("item")
    private PlatformRewardItem item;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("type")
    private String type;


    
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
    public PlatformReward createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PlatformReward> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PlatformReward>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currency", "currency");
        result.put("item", "item");
        result.put("quantity", "quantity");
        result.put("type", "type");
        return result;
    }
    
    public enum Type {
        ITEM("ITEM"),
        CURRENCY("CURRENCY");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class PlatformRewardBuilder {
        private String type;
        
        
        public PlatformRewardBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public PlatformRewardBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
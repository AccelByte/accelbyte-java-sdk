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
public class PaymentAccount extends Model {

    @JsonProperty("id")
    private String id;

    @JsonProperty("name")
    private String name;

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
    public PaymentAccount createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PaymentAccount> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentAccount>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("name", "name");
        result.put("type", "type");
        return result;
    }
    
    public enum Type {
        Card("Card"),
        Paypal("Paypal");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class PaymentAccountBuilder {
        private String type;
        
        
        public PaymentAccountBuilder type(final String type) {
            this.type = type;
            return this;
        }
        
        public PaymentAccountBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
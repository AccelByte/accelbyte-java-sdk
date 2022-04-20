/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class ExcessStrategy extends Model {

    @JsonProperty("currency")
    private String currency;

    @JsonProperty("method")
    private String method;

    @JsonProperty("percentPerExp")
    private Integer percentPerExp;


    
    public String getMethod() {
        return this.method;
    }
    
    public Method getMethodAsEnum() {
        return Method.valueOf(this.method);
    }
    
    public void setMethod(final String method) {
        this.method = method;
    }
    
    public void setMethodFromEnum(final Method method) {
        this.method = method.toString();
    }

    @JsonIgnore
    public ExcessStrategy createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ExcessStrategy> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ExcessStrategy>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("currency", "currency");
        result.put("method", "method");
        result.put("percentPerExp", "percentPerExp");
        return result;
    }
    
    public enum Method {
        NONE("NONE"),
        CURRENCY("CURRENCY");

        private String value;

        Method(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class ExcessStrategyBuilder {
        private String method;
        
        
        public ExcessStrategyBuilder method(final String method) {
            this.method = method;
            return this;
        }
        
        public ExcessStrategyBuilder methodFromEnum(final Method method) {
            this.method = method.toString();
            return this;
        }
    }
}
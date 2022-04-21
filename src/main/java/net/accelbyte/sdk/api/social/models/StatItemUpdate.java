/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class StatItemUpdate extends Model {

    @JsonProperty("additionalData")
    private Map<String, ?> additionalData;

    @JsonProperty("updateStrategy")
    private String updateStrategy;

    @JsonProperty("value")
    private Float value;


    
    @JsonIgnore
    public String getUpdateStrategy() {
        return this.updateStrategy;
    }
    
    @JsonIgnore
    public UpdateStrategy getUpdateStrategyAsEnum() {
        return UpdateStrategy.valueOf(this.updateStrategy);
    }
    
    @JsonIgnore
    public void setUpdateStrategy(final String updateStrategy) {
        this.updateStrategy = updateStrategy;
    }
    
    @JsonIgnore
    public void setUpdateStrategyFromEnum(final UpdateStrategy updateStrategy) {
        this.updateStrategy = updateStrategy.toString();
    }

    @JsonIgnore
    public StatItemUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<StatItemUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StatItemUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("updateStrategy", "updateStrategy");
        result.put("value", "value");
        return result;
    }
    
    public enum UpdateStrategy {
        OVERRIDE("OVERRIDE"),
        INCREMENT("INCREMENT"),
        MAX("MAX"),
        MIN("MIN");

        private String value;

        UpdateStrategy(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class StatItemUpdateBuilder {
        private String updateStrategy;
        
        
        public StatItemUpdateBuilder updateStrategy(final String updateStrategy) {
            this.updateStrategy = updateStrategy;
            return this;
        }
        
        public StatItemUpdateBuilder updateStrategyFromEnum(final UpdateStrategy updateStrategy) {
            this.updateStrategy = updateStrategy.toString();
            return this;
        }
    }
}
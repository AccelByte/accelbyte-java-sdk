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
public class BulkUserStatItemUpdate extends Model {

    @JsonProperty("additionalData")
    private Map<String, ?> additionalData;

    @JsonProperty("additionalKey")
    private String additionalKey;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("updateStrategy")
    private String updateStrategy;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("value")
    private Float value;


    
    public String getUpdateStrategy() {
        return this.updateStrategy;
    }
    
    public UpdateStrategy getUpdateStrategyAsEnum() {
        return UpdateStrategy.valueOf(this.updateStrategy);
    }
    
    public void setUpdateStrategy(final String updateStrategy) {
        this.updateStrategy = updateStrategy;
    }
    
    public void setUpdateStrategyFromEnum(final UpdateStrategy updateStrategy) {
        this.updateStrategy = updateStrategy.toString();
    }

    @JsonIgnore
    public BulkUserStatItemUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<BulkUserStatItemUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BulkUserStatItemUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalData", "additionalData");
        result.put("additionalKey", "additionalKey");
        result.put("statCode", "statCode");
        result.put("updateStrategy", "updateStrategy");
        result.put("userId", "userId");
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
    
    public static class BulkUserStatItemUpdateBuilder {
        private String updateStrategy;
        
        
        public BulkUserStatItemUpdateBuilder updateStrategy(final String updateStrategy) {
            this.updateStrategy = updateStrategy;
            return this;
        }
        
        public BulkUserStatItemUpdateBuilder updateStrategyFromEnum(final UpdateStrategy updateStrategy) {
            this.updateStrategy = updateStrategy.toString();
            return this;
        }
    }
}
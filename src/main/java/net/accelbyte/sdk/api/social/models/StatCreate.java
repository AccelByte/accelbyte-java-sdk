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
public class StatCreate extends Model {

    @JsonProperty("defaultValue")
    private Float defaultValue;

    @JsonProperty("description")
    private String description;

    @JsonProperty("incrementOnly")
    private Boolean incrementOnly;

    @JsonProperty("maximum")
    private Float maximum;

    @JsonProperty("minimum")
    private Float minimum;

    @JsonProperty("name")
    private String name;

    @JsonProperty("setAsGlobal")
    private Boolean setAsGlobal;

    @JsonProperty("setBy")
    private String setBy;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("tags")
    private List<String> tags;


    
    public String getSetBy() {
        return this.setBy;
    }
    
    public SetBy getSetByAsEnum() {
        return SetBy.valueOf(this.setBy);
    }
    
    public void setSetBy(final String setBy) {
        this.setBy = setBy;
    }
    
    public void setSetByFromEnum(final SetBy setBy) {
        this.setBy = setBy.toString();
    }

    @JsonIgnore
    public StatCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<StatCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StatCreate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("defaultValue", "defaultValue");
        result.put("description", "description");
        result.put("incrementOnly", "incrementOnly");
        result.put("maximum", "maximum");
        result.put("minimum", "minimum");
        result.put("name", "name");
        result.put("setAsGlobal", "setAsGlobal");
        result.put("setBy", "setBy");
        result.put("statCode", "statCode");
        result.put("tags", "tags");
        return result;
    }
    
    public enum SetBy {
        CLIENT("CLIENT"),
        SERVER("SERVER");

        private String value;

        SetBy(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class StatCreateBuilder {
        private String setBy;
        
        
        public StatCreateBuilder setBy(final String setBy) {
            this.setBy = setBy;
            return this;
        }
        
        public StatCreateBuilder setByFromEnum(final SetBy setBy) {
            this.setBy = setBy.toString();
            return this;
        }
    }
}
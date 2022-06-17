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
public class UserExpGrant extends Model {

    @JsonProperty("exp")
    private Integer exp;

    @JsonProperty("source")
    private String source;

    @JsonProperty("tags")
    private List<String> tags;


    
    @JsonIgnore
    public String getSource() {
        return this.source;
    }
    
    @JsonIgnore
    public Source getSourceAsEnum() {
        return Source.valueOf(this.source);
    }
    
    @JsonIgnore
    public void setSource(final String source) {
        this.source = source;
    }
    
    @JsonIgnore
    public void setSourceFromEnum(final Source source) {
        this.source = source.toString();
    }

    @JsonIgnore
    public UserExpGrant createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserExpGrant> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserExpGrant>>() {});
    }

    
    public enum Source {
        PAIDFOR("PAID_FOR"),
        SWEAT("SWEAT");

        private String value;

        Source(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class UserExpGrantBuilder {
        private String source;
        
        
        public UserExpGrantBuilder source(final String source) {
            this.source = source;
            return this;
        }
        
        public UserExpGrantBuilder sourceFromEnum(final Source source) {
            this.source = source.toString();
            return this;
        }
    }
}
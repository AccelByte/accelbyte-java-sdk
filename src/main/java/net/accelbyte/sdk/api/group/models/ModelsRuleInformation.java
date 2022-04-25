/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.models;

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
public class ModelsRuleInformation extends Model {

    @JsonProperty("ruleAttribute")
    private String ruleAttribute;

    @JsonProperty("ruleCriteria")
    private String ruleCriteria;

    @JsonProperty("ruleValue")
    private Float ruleValue;


    
    @JsonIgnore
    public String getRuleCriteria() {
        return this.ruleCriteria;
    }
    
    @JsonIgnore
    public RuleCriteria getRuleCriteriaAsEnum() {
        return RuleCriteria.valueOf(this.ruleCriteria);
    }
    
    @JsonIgnore
    public void setRuleCriteria(final String ruleCriteria) {
        this.ruleCriteria = ruleCriteria;
    }
    
    @JsonIgnore
    public void setRuleCriteriaFromEnum(final RuleCriteria ruleCriteria) {
        this.ruleCriteria = ruleCriteria.toString();
    }

    @JsonIgnore
    public ModelsRuleInformation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsRuleInformation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleInformation>>() {});
    }

    
    public enum RuleCriteria {
        EQUAL("EQUAL"),
        MINIMUM("MINIMUM"),
        MAXIMUM("MAXIMUM");

        private String value;

        RuleCriteria(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class ModelsRuleInformationBuilder {
        private String ruleCriteria;
        
        
        public ModelsRuleInformationBuilder ruleCriteria(final String ruleCriteria) {
            this.ruleCriteria = ruleCriteria;
            return this;
        }
        
        public ModelsRuleInformationBuilder ruleCriteriaFromEnum(final RuleCriteria ruleCriteria) {
            this.ruleCriteria = ruleCriteria.toString();
            return this;
        }
    }
}
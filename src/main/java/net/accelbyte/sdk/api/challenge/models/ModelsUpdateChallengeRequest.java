/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.models;

import java.util.*;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;

import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor=@__(@Deprecated))     
@NoArgsConstructor
public class ModelsUpdateChallengeRequest extends Model {

    @JsonProperty("activeGoalsPerRotation")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer activeGoalsPerRotation;

    @JsonProperty("assignmentRule")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String assignmentRule;

    @JsonProperty("description")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String description;

    @JsonProperty("endDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String endDate;

    @JsonProperty("goalsVisibility")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String goalsVisibility;

    @JsonProperty("name")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String name;

    @JsonProperty("rotation")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String rotation;

    @JsonProperty("startDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String startDate;


    
    @JsonIgnore
    public String getAssignmentRule() {
        return this.assignmentRule;
    }
    
    @JsonIgnore
    public AssignmentRule getAssignmentRuleAsEnum() {
        return AssignmentRule.valueOf(this.assignmentRule);
    }
    
    @JsonIgnore
    public void setAssignmentRule(final String assignmentRule) {
        this.assignmentRule = assignmentRule;
    }
    
    @JsonIgnore
    public void setAssignmentRuleFromEnum(final AssignmentRule assignmentRule) {
        this.assignmentRule = assignmentRule.toString();
    }
    
    @JsonIgnore
    public String getGoalsVisibility() {
        return this.goalsVisibility;
    }
    
    @JsonIgnore
    public GoalsVisibility getGoalsVisibilityAsEnum() {
        return GoalsVisibility.valueOf(this.goalsVisibility);
    }
    
    @JsonIgnore
    public void setGoalsVisibility(final String goalsVisibility) {
        this.goalsVisibility = goalsVisibility;
    }
    
    @JsonIgnore
    public void setGoalsVisibilityFromEnum(final GoalsVisibility goalsVisibility) {
        this.goalsVisibility = goalsVisibility.toString();
    }
    
    @JsonIgnore
    public String getRotation() {
        return this.rotation;
    }
    
    @JsonIgnore
    public Rotation getRotationAsEnum() {
        return Rotation.valueOf(this.rotation);
    }
    
    @JsonIgnore
    public void setRotation(final String rotation) {
        this.rotation = rotation;
    }
    
    @JsonIgnore
    public void setRotationFromEnum(final Rotation rotation) {
        this.rotation = rotation.toString();
    }

    @JsonIgnore
    public ModelsUpdateChallengeRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsUpdateChallengeRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdateChallengeRequest>>() {});
    }

    
    public enum AssignmentRule {
        FIXED("FIXED"),
        RANDOMIZED("RANDOMIZED"),
        UNSCHEDULED("UNSCHEDULED");

        private String value;

        AssignmentRule(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum GoalsVisibility {
        PERIODONLY("PERIODONLY"),
        SHOWALL("SHOWALL");

        private String value;

        GoalsVisibility(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Rotation {
        DAILY("DAILY"),
        MONTHLY("MONTHLY"),
        NONE("NONE"),
        WEEKLY("WEEKLY");

        private String value;

        Rotation(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class ModelsUpdateChallengeRequestBuilder {
        private String assignmentRule;
        private String goalsVisibility;
        private String rotation;
        
        
        public ModelsUpdateChallengeRequestBuilder assignmentRule(final String assignmentRule) {
            this.assignmentRule = assignmentRule;
            return this;
        }
        
        public ModelsUpdateChallengeRequestBuilder assignmentRuleFromEnum(final AssignmentRule assignmentRule) {
            this.assignmentRule = assignmentRule.toString();
            return this;
        }
        
        public ModelsUpdateChallengeRequestBuilder goalsVisibility(final String goalsVisibility) {
            this.goalsVisibility = goalsVisibility;
            return this;
        }
        
        public ModelsUpdateChallengeRequestBuilder goalsVisibilityFromEnum(final GoalsVisibility goalsVisibility) {
            this.goalsVisibility = goalsVisibility.toString();
            return this;
        }
        
        public ModelsUpdateChallengeRequestBuilder rotation(final String rotation) {
            this.rotation = rotation;
            return this;
        }
        
        public ModelsUpdateChallengeRequestBuilder rotationFromEnum(final Rotation rotation) {
            this.rotation = rotation.toString();
            return this;
        }
    }
}
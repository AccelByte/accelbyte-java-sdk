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
public class ModelsGroupResponseV1 extends Model {

    @JsonProperty("configurationCode")
    private String configurationCode;

    @JsonProperty("customAttributes")
    private Map<String, ?> customAttributes;

    @JsonProperty("groupDescription")
    private String groupDescription;

    @JsonProperty("groupIcon")
    private String groupIcon;

    @JsonProperty("groupId")
    private String groupId;

    @JsonProperty("groupMaxMember")
    private Integer groupMaxMember;

    @JsonProperty("groupMembers")
    private List<ModelsGroupMember> groupMembers;

    @JsonProperty("groupName")
    private String groupName;

    @JsonProperty("groupRegion")
    private String groupRegion;

    @JsonProperty("groupRules")
    private ModelsGroupRule groupRules;

    @JsonProperty("groupType")
    private String groupType;



    @JsonIgnore
    public ModelsGroupResponseV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsGroupResponseV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGroupResponseV1>>() {});
    }

    
}
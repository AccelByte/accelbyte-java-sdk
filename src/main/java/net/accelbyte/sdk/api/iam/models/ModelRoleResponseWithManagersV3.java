/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelRoleResponseWithManagersV3 extends Model {

    @JsonProperty("adminRole")
    private Boolean adminRole;

    @JsonProperty("isWildcard")
    private Boolean isWildcard;

    @JsonProperty("managers")
    private List<AccountcommonRoleManagerV3> managers;

    @JsonProperty("permissions")
    private List<AccountcommonPermissionV3> permissions;

    @JsonProperty("roleId")
    private String roleId;

    @JsonProperty("roleName")
    private String roleName;



    @JsonIgnore
    public ModelRoleResponseWithManagersV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelRoleResponseWithManagersV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelRoleResponseWithManagersV3>>() {});
    }

    
}
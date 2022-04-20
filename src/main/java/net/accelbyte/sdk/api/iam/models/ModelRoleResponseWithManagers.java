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
public class ModelRoleResponseWithManagers extends Model {

    @JsonProperty("IsWildcard")
    private Boolean isWildcard;

    @JsonProperty("Managers")
    private List<AccountcommonRoleManager> managers;

    @JsonProperty("Permissions")
    private List<AccountcommonPermission> permissions;

    @JsonProperty("RoleId")
    private String roleId;

    @JsonProperty("RoleName")
    private String roleName;



    @JsonIgnore
    public ModelRoleResponseWithManagers createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelRoleResponseWithManagers> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelRoleResponseWithManagers>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("IsWildcard", "isWildcard");
        result.put("Managers", "managers");
        result.put("Permissions", "permissions");
        result.put("RoleId", "roleId");
        result.put("RoleName", "roleName");
        return result;
    }
    
    public static class ModelRoleResponseWithManagersBuilder {
        
    }
}
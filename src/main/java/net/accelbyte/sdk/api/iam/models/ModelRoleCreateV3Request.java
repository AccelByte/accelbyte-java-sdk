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
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelRoleCreateV3Request extends Model {

    @JsonProperty("adminRole")
    private Boolean adminRole;

    @JsonProperty("deletable")
    private Boolean deletable;

    @JsonProperty("isWildcard")
    private Boolean isWildcard;

    @JsonProperty("managers")
    private List<AccountcommonRoleManagerV3> managers;

    @JsonProperty("members")
    private List<AccountcommonRoleMemberV3> members;

    @JsonProperty("permissions")
    private List<AccountcommonPermissionV3> permissions;

    @JsonProperty("roleName")
    private String roleName;

    @JsonIgnore
    public ModelRoleCreateV3Request createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelRoleCreateV3Request> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelRoleCreateV3Request>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("adminRole", "adminRole");
        result.put("deletable", "deletable");
        result.put("isWildcard", "isWildcard");
        result.put("managers", "managers");
        result.put("members", "members");
        result.put("permissions", "permissions");
        result.put("roleName", "roleName");
        return result;
    }
}
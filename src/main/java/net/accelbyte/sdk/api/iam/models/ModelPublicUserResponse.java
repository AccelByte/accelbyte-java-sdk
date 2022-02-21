/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
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
public class ModelPublicUserResponse extends Model {

    @JsonProperty("AuthType")
    private String authType;

    @JsonProperty("Bans")
    private List<ModelUserActiveBanResponse> bans;

    @JsonProperty("CreatedAt")
    private String createdAt;

    @JsonProperty("DeletionStatus")
    private Boolean deletionStatus;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("EmailVerified")
    private Boolean emailVerified;

    @JsonProperty("Enabled")
    private Boolean enabled;

    @JsonProperty("LastEnabledChangedTime")
    private String lastEnabledChangedTime;

    @JsonProperty("LoginId")
    private String loginId;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("NamespaceRoles")
    private List<AccountcommonNamespaceRole> namespaceRoles;

    @JsonProperty("Permissions")
    private List<AccountcommonPermission> permissions;

    @JsonProperty("PhoneVerified")
    private Boolean phoneVerified;

    @JsonProperty("PlatformId")
    private String platformId;

    @JsonProperty("PlatformUserId")
    private String platformUserId;

    @JsonProperty("Roles")
    private List<String> roles;

    @JsonProperty("UserId")
    private String userId;

    @JsonProperty("Username")
    private String username;

    @JsonProperty("XUID")
    private String xuid;

    @JsonIgnore
    public ModelPublicUserResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelPublicUserResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelPublicUserResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AuthType", "authType");
        result.put("Bans", "bans");
        result.put("CreatedAt", "createdAt");
        result.put("DeletionStatus", "deletionStatus");
        result.put("DisplayName", "displayName");
        result.put("EmailVerified", "emailVerified");
        result.put("Enabled", "enabled");
        result.put("LastEnabledChangedTime", "lastEnabledChangedTime");
        result.put("LoginId", "loginId");
        result.put("Namespace", "namespace");
        result.put("NamespaceRoles", "namespaceRoles");
        result.put("Permissions", "permissions");
        result.put("PhoneVerified", "phoneVerified");
        result.put("PlatformId", "platformId");
        result.put("PlatformUserId", "platformUserId");
        result.put("Roles", "roles");
        result.put("UserId", "userId");
        result.put("Username", "username");
        result.put("XUID", "xuid");
        return result;
    }
}
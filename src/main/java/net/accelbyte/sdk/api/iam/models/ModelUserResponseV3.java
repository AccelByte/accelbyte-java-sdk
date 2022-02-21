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
public class ModelUserResponseV3 extends Model {

    @JsonProperty("authType")
    private String authType;

    @JsonProperty("bans")
    private List<ModelUserActiveBanResponseV3> bans;

    @JsonProperty("country")
    private String country;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("dateOfBirth")
    private String dateOfBirth;

    @JsonProperty("deletionStatus")
    private Boolean deletionStatus;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("emailAddress")
    private String emailAddress;

    @JsonProperty("emailVerified")
    private Boolean emailVerified;

    @JsonProperty("enabled")
    private Boolean enabled;

    @JsonProperty("lastDateOfBirthChangedTime")
    private String lastDateOfBirthChangedTime;

    @JsonProperty("lastEnabledChangedTime")
    private String lastEnabledChangedTime;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("namespaceRoles")
    private List<AccountcommonNamespaceRole> namespaceRoles;

    @JsonProperty("newEmailAddress")
    private String newEmailAddress;

    @JsonProperty("oldEmailAddress")
    private String oldEmailAddress;

    @JsonProperty("permissions")
    private List<ModelUserPermissionsResponseV3> permissions;

    @JsonProperty("phoneNumber")
    private String phoneNumber;

    @JsonProperty("phoneVerified")
    private Boolean phoneVerified;

    @JsonProperty("platformAvatarUrl")
    private String platformAvatarUrl;

    @JsonProperty("platformDisplayName")
    private String platformDisplayName;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("platformUserId")
    private String platformUserId;

    @JsonProperty("roles")
    private List<String> roles;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("userName")
    private String userName;

    @JsonIgnore
    public ModelUserResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserResponseV3>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("authType", "authType");
        result.put("bans", "bans");
        result.put("country", "country");
        result.put("createdAt", "createdAt");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("deletionStatus", "deletionStatus");
        result.put("displayName", "displayName");
        result.put("emailAddress", "emailAddress");
        result.put("emailVerified", "emailVerified");
        result.put("enabled", "enabled");
        result.put("lastDateOfBirthChangedTime", "lastDateOfBirthChangedTime");
        result.put("lastEnabledChangedTime", "lastEnabledChangedTime");
        result.put("namespace", "namespace");
        result.put("namespaceRoles", "namespaceRoles");
        result.put("newEmailAddress", "newEmailAddress");
        result.put("oldEmailAddress", "oldEmailAddress");
        result.put("permissions", "permissions");
        result.put("phoneNumber", "phoneNumber");
        result.put("phoneVerified", "phoneVerified");
        result.put("platformAvatarUrl", "platformAvatarUrl");
        result.put("platformDisplayName", "platformDisplayName");
        result.put("platformId", "platformId");
        result.put("platformUserId", "platformUserId");
        result.put("roles", "roles");
        result.put("userId", "userId");
        result.put("userName", "userName");
        return result;
    }
}
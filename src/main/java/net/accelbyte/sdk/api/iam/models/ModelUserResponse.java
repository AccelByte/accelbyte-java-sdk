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
public class ModelUserResponse extends Model {

    @JsonProperty("AuthType")
    private String authType;

    @JsonProperty("Bans")
    private List<ModelUserActiveBanResponse> bans;

    @JsonProperty("Country")
    private String country;

    @JsonProperty("CreatedAt")
    private String createdAt;

    @JsonProperty("DateOfBirth")
    private String dateOfBirth;

    @JsonProperty("DeletionStatus")
    private Boolean deletionStatus;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("EmailAddress")
    private String emailAddress;

    @JsonProperty("EmailVerified")
    private Boolean emailVerified;

    @JsonProperty("Enabled")
    private Boolean enabled;

    @JsonProperty("LastDateOfBirthChangedTime")
    private String lastDateOfBirthChangedTime;

    @JsonProperty("LastEnabledChangedTime")
    private String lastEnabledChangedTime;

    @JsonProperty("LoginId")
    private String loginId;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("NamespaceRoles")
    private List<AccountcommonNamespaceRole> namespaceRoles;

    @JsonProperty("NewEmailAddress")
    private String newEmailAddress;

    @JsonProperty("OldEmailAddress")
    private String oldEmailAddress;

    @JsonProperty("Permissions")
    private List<AccountcommonPermission> permissions;

    @JsonProperty("PhoneNumber")
    private String phoneNumber;

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
    public ModelUserResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserResponse>>() {});
    }

    
}
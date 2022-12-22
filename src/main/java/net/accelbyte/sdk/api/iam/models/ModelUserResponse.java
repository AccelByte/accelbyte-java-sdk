/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelUserResponse extends Model {

  @JsonProperty("AuthType")
  private String authType;

  @JsonProperty("AvatarUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String avatarUrl;

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
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String newEmailAddress;

  @JsonProperty("OldEmailAddress")
  private String oldEmailAddress;

  @JsonProperty("Permissions")
  private List<AccountcommonPermission> permissions;

  @JsonProperty("PhoneNumber")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String phoneNumber;

  @JsonProperty("PhoneVerified")
  private Boolean phoneVerified;

  @JsonProperty("PlatformId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformId;

  @JsonProperty("PlatformUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonProperty("Roles")
  private List<String> roles;

  @JsonProperty("UserId")
  private String userId;

  @JsonProperty("Username")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String username;

  @JsonProperty("XUID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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

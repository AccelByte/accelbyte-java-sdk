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
public class ModelUserResponseV3 extends Model {

  @JsonProperty("authType")
  private String authType;

  @JsonProperty("avatarUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String avatarUrl;

  @JsonProperty("bans")
  private List<ModelUserActiveBanResponseV3> bans;

  @JsonProperty("country")
  private String country;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("dateOfBirth")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String newEmailAddress;

  @JsonProperty("oldEmailAddress")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String oldEmailAddress;

  @JsonProperty("permissions")
  private List<ModelUserPermissionsResponseV3> permissions;

  @JsonProperty("phoneNumber")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String phoneNumber;

  @JsonProperty("phoneVerified")
  private Boolean phoneVerified;

  @JsonProperty("platformAvatarUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformAvatarUrl;

  @JsonProperty("platformDisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformDisplayName;

  @JsonProperty("platformId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformId;

  @JsonProperty("platformUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonProperty("roles")
  private List<String> roles;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("userName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userName;

  @JsonIgnore
  public ModelUserResponseV3 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserResponseV3> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserResponseV3>>() {});
  }
}

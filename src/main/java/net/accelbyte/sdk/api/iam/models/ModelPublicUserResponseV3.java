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
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelPublicUserResponseV3 extends Model {

  @JsonProperty("authType")
  private String authType;

  @JsonProperty("avatarUrl")
  private String avatarUrl;

  @JsonProperty("bans")
  private List<ModelUserActiveBanResponseV3> bans;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("deletionStatus")
  private Boolean deletionStatus;

  @JsonProperty("displayName")
  private String displayName;

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

  @JsonProperty("permissions")
  private List<ModelUserPermissionsResponseV3> permissions;

  @JsonProperty("phoneVerified")
  private Boolean phoneVerified;

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
  public ModelPublicUserResponseV3 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelPublicUserResponseV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelPublicUserResponseV3>>() {});
  }
}

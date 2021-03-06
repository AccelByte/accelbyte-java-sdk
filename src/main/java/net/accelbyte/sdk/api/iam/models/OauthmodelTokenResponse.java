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
public class OauthmodelTokenResponse extends Model {

  @JsonProperty("access_token")
  private String accessToken;

  @JsonProperty("bans")
  private List<AccountcommonJWTBanV3> bans;

  @JsonProperty("display_name")
  private String displayName;

  @JsonProperty("expires_in")
  private Integer expiresIn;

  @JsonProperty("is_comply")
  private Boolean isComply;

  @JsonProperty("jflgs")
  private Integer jflgs;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("namespace_roles")
  private List<AccountcommonNamespaceRole> namespaceRoles;

  @JsonProperty("permissions")
  private List<AccountcommonPermission> permissions;

  @JsonProperty("platform_id")
  private String platformId;

  @JsonProperty("platform_user_id")
  private String platformUserId;

  @JsonProperty("refresh_expires_in")
  private Integer refreshExpiresIn;

  @JsonProperty("refresh_token")
  private String refreshToken;

  @JsonProperty("roles")
  private List<String> roles;

  @JsonProperty("token_type")
  private String tokenType;

  @JsonProperty("user_id")
  private String userId;

  @JsonIgnore
  public OauthmodelTokenResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthmodelTokenResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthmodelTokenResponse>>() {});
  }
}

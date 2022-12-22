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
public class OauthmodelTokenResponseV3 extends Model {

  @JsonProperty("access_token")
  private String accessToken;

  @JsonProperty("bans")
  private List<AccountcommonJWTBanV3> bans;

  @JsonProperty("display_name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  @JsonProperty("expires_in")
  private Integer expiresIn;

  @JsonProperty("is_comply")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isComply;

  @JsonProperty("jflgs")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer jflgs;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("namespace_roles")
  private List<AccountcommonNamespaceRole> namespaceRoles;

  @JsonProperty("permissions")
  private List<AccountcommonPermissionV3> permissions;

  @JsonProperty("platform_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformId;

  @JsonProperty("platform_user_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonProperty("refresh_expires_in")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer refreshExpiresIn;

  @JsonProperty("refresh_token")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String refreshToken;

  @JsonProperty("roles")
  private List<String> roles;

  @JsonProperty("scope")
  private String scope;

  @JsonProperty("token_type")
  private String tokenType;

  @JsonProperty("user_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonProperty("xuid")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String xuid;

  @JsonIgnore
  public OauthmodelTokenResponseV3 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthmodelTokenResponseV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthmodelTokenResponseV3>>() {});
  }
}

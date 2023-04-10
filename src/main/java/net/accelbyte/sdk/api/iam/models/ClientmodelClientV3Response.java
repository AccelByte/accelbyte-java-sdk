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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ClientmodelClientV3Response extends Model {

  @JsonProperty("audiences")
  private List<String> audiences;

  @JsonProperty("baseUri")
  private String baseUri;

  @JsonProperty("clientId")
  private String clientId;

  @JsonProperty("clientName")
  private String clientName;

  @JsonProperty("clientPermissions")
  private List<AccountcommonPermissionV3> clientPermissions;

  @JsonProperty("clientPlatform")
  private String clientPlatform;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("modifiedAt")
  private String modifiedAt;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("oauthAccessTokenExpiration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer oauthAccessTokenExpiration;

  @JsonProperty("oauthAccessTokenExpirationTimeUnit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String oauthAccessTokenExpirationTimeUnit;

  @JsonProperty("oauthClientType")
  private String oauthClientType;

  @JsonProperty("oauthRefreshTokenExpiration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer oauthRefreshTokenExpiration;

  @JsonProperty("oauthRefreshTokenExpirationTimeUnit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String oauthRefreshTokenExpirationTimeUnit;

  @JsonProperty("parentNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String parentNamespace;

  @JsonProperty("redirectUri")
  private String redirectUri;

  @JsonProperty("roles")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> roles;

  @JsonProperty("scopes")
  private List<String> scopes;

  @JsonProperty("twoFactorEnabled")
  private Boolean twoFactorEnabled;

  @JsonIgnore
  public ClientmodelClientV3Response createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ClientmodelClientV3Response> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ClientmodelClientV3Response>>() {});
  }
}

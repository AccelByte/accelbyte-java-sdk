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
public class ClientmodelClientCreationV3Request extends Model {

  @JsonProperty("audiences")
  private List<String> audiences;

  @JsonProperty("baseUri")
  private String baseUri;

  @JsonProperty("clientId")
  private String clientId;

  @JsonProperty("clientName")
  private String clientName;

  @JsonProperty("clientPermissions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<AccountcommonPermissionV3> clientPermissions;

  @JsonProperty("clientPlatform")
  private String clientPlatform;

  @JsonProperty("deletable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean deletable;

  @JsonProperty("description")
  private String description;

  @JsonProperty("modulePermissions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<AccountcommonClientModulePermission> modulePermissions;

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

  @JsonProperty("scopes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> scopes;

  @JsonProperty("secret")
  private String secret;

  @JsonProperty("skipLoginQueue")
  private Boolean skipLoginQueue;

  @JsonProperty("twoFactorEnabled")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean twoFactorEnabled;

  @JsonIgnore
  public ClientmodelClientCreationV3Request createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ClientmodelClientCreationV3Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ClientmodelClientCreationV3Request>>() {});
  }
}

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
public class ModelThirdPartyLoginPlatformCredentialResponse extends Model {

  @JsonProperty("ACSURL")
  private String acsurl;

  @JsonProperty("AWSCognitoRegion")
  private String awsCognitoRegion;

  @JsonProperty("AWSCognitoUserPool")
  private String awsCognitoUserPool;

  @JsonProperty("AllowedClients")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> allowedClients;

  @JsonProperty("AppId")
  private String appId;

  @JsonProperty("AuthorizationEndpoint")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String authorizationEndpoint;

  @JsonProperty("ClientId")
  private String clientId;

  @JsonProperty("Environment")
  private String environment;

  @JsonProperty("FederationMetadataURL")
  private String federationMetadataURL;

  @JsonProperty("GenericOauthFlow")
  private Boolean genericOauthFlow;

  @JsonProperty("IsActive")
  private Boolean isActive;

  @JsonProperty("Issuer")
  private String issuer;

  @JsonProperty("JWKSEndpoint")
  private String jwksEndpoint;

  @JsonProperty("KeyID")
  private String keyID;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("NetflixCertificates")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AccountcommonNetflixCertificates netflixCertificates;

  @JsonProperty("OrganizationId")
  private String organizationId;

  @JsonProperty("PlatformId")
  private String platformId;

  @JsonProperty("PlatformName")
  private String platformName;

  @JsonProperty("RedirectUri")
  private String redirectUri;

  @JsonProperty("Secret")
  private String secret;

  @JsonProperty("TeamID")
  private String teamID;

  @JsonProperty("TokenAuthenticationType")
  private String tokenAuthenticationType;

  @JsonProperty("TokenClaimsMapping")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> tokenClaimsMapping;

  @JsonProperty("TokenEndpoint")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String tokenEndpoint;

  @JsonProperty("UserInfoEndpoint")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userInfoEndpoint;

  @JsonProperty("UserInfoHTTPMethod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userInfoHTTPMethod;

  @JsonProperty("registeredDomains")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<AccountcommonRegisteredDomain> registeredDomains;

  @JsonProperty("scopes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> scopes;

  @JsonIgnore
  public ModelThirdPartyLoginPlatformCredentialResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelThirdPartyLoginPlatformCredentialResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json, new TypeReference<List<ModelThirdPartyLoginPlatformCredentialResponse>>() {});
  }
}

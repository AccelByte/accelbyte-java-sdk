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
public class ModelThirdPartyLoginPlatformCredentialRequest extends Model {

  @JsonProperty("ACSURL")
  private String acsurl;

  @JsonProperty("AWSCognitoRegion")
  private String awsCognitoRegion;

  @JsonProperty("AWSCognitoUserPool")
  private String awsCognitoUserPool;

  @JsonProperty("AppId")
  private String appId;

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

  @JsonProperty("NetflixCertificates")
  private AccountcommonNetflixCertificates netflixCertificates;

  @JsonProperty("OrganizationId")
  private String organizationId;

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
  private Map<String, String> tokenClaimsMapping;

  @JsonIgnore
  public ModelThirdPartyLoginPlatformCredentialRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelThirdPartyLoginPlatformCredentialRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json, new TypeReference<List<ModelThirdPartyLoginPlatformCredentialRequest>>() {});
  }
}

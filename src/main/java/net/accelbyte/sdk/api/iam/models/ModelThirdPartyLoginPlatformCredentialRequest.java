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
import java.util.List;
import java.util.Map;

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
    public ModelThirdPartyLoginPlatformCredentialRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelThirdPartyLoginPlatformCredentialRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelThirdPartyLoginPlatformCredentialRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ACSURL", "acsurl");
        result.put("AWSCognitoRegion", "awsCognitoRegion");
        result.put("AWSCognitoUserPool", "awsCognitoUserPool");
        result.put("AppId", "appId");
        result.put("ClientId", "clientId");
        result.put("Environment", "environment");
        result.put("FederationMetadataURL", "federationMetadataURL");
        result.put("GenericOauthFlow", "genericOauthFlow");
        result.put("IsActive", "isActive");
        result.put("Issuer", "issuer");
        result.put("JWKSEndpoint", "jwksEndpoint");
        result.put("KeyID", "keyID");
        result.put("OrganizationId", "organizationId");
        result.put("PlatformName", "platformName");
        result.put("RedirectUri", "redirectUri");
        result.put("Secret", "secret");
        result.put("TeamID", "teamID");
        result.put("TokenAuthenticationType", "tokenAuthenticationType");
        result.put("TokenClaimsMapping", "tokenClaimsMapping");
        return result;
    }
}
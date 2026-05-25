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
public class OauthcommonASMetadataResponse extends Model {

  @JsonProperty("authorization_endpoint")
  private String authorizationEndpoint;

  @JsonProperty("code_challenge_methods_supported")
  private List<String> codeChallengeMethodsSupported;

  @JsonProperty("grant_types_supported")
  private List<String> grantTypesSupported;

  @JsonProperty("issuer")
  private String issuer;

  @JsonProperty("jwks_uri")
  private String jwksUri;

  @JsonProperty("registration_endpoint")
  private String registrationEndpoint;

  @JsonProperty("response_types_supported")
  private List<String> responseTypesSupported;

  @JsonProperty("scopes_supported")
  private List<String> scopesSupported;

  @JsonProperty("token_endpoint")
  private String tokenEndpoint;

  @JsonProperty("token_endpoint_auth_methods_supported")
  private List<String> tokenEndpointAuthMethodsSupported;

  @JsonIgnore
  public OauthcommonASMetadataResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthcommonASMetadataResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthcommonASMetadataResponse>>() {});
  }
}

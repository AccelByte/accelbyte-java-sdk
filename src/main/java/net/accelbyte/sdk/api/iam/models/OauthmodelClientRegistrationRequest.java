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
public class OauthmodelClientRegistrationRequest extends Model {

  @JsonProperty("client_name")
  private String clientName;

  @JsonProperty("client_uri")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientUri;

  @JsonProperty("grant_types")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> grantTypes;

  @JsonProperty("redirect_uris")
  private List<String> redirectUris;

  @JsonProperty("response_types")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> responseTypes;

  @JsonProperty("scopes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> scopes;

  @JsonProperty("token_endpoint_auth_method")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String tokenEndpointAuthMethod;

  @JsonIgnore
  public OauthmodelClientRegistrationRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthmodelClientRegistrationRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthmodelClientRegistrationRequest>>() {});
  }
}

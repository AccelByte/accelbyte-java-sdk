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
  private List<AccountcommonPermissionV3> clientPermissions;

  @JsonProperty("clientPlatform")
  private String clientPlatform;

  @JsonProperty("deletable")
  private Boolean deletable;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("oauthClientType")
  private String oauthClientType;

  @JsonProperty("redirectUri")
  private String redirectUri;

  @JsonProperty("secret")
  private String secret;

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

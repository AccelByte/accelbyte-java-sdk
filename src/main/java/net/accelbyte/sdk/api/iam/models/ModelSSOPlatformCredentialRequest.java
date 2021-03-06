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
public class ModelSSOPlatformCredentialRequest extends Model {

  @JsonProperty("acsUrl")
  private String acsUrl;

  @JsonProperty("apiKey")
  private String apiKey;

  @JsonProperty("appId")
  private String appId;

  @JsonProperty("federationMetadataUrl")
  private String federationMetadataUrl;

  @JsonProperty("isActive")
  private Boolean isActive;

  @JsonProperty("redirectUri")
  private String redirectUri;

  @JsonProperty("secret")
  private String secret;

  @JsonProperty("ssoUrl")
  private String ssoUrl;

  @JsonIgnore
  public ModelSSOPlatformCredentialRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelSSOPlatformCredentialRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelSSOPlatformCredentialRequest>>() {});
  }
}

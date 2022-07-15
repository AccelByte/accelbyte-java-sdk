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
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OauthmodelErrorResponse extends Model {

  @JsonProperty("clientId")
  private String clientId;

  @JsonProperty("default_factor")
  private String defaultFactor;

  @JsonProperty("error")
  private String error;

  @JsonProperty("error_description")
  private String errorDescription;

  @JsonProperty("error_uri")
  private String errorUri;

  @JsonProperty("factors")
  private List<String> factors;

  @JsonProperty("linkingToken")
  private String linkingToken;

  @JsonProperty("mfa_token")
  private String mfaToken;

  @JsonProperty("platformId")
  private String platformId;

  @JsonIgnore
  public OauthmodelErrorResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OauthmodelErrorResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OauthmodelErrorResponse>>() {});
  }
}

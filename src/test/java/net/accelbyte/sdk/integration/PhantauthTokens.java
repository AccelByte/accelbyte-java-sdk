/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
class PhantauthTokens extends Model {
  @JsonProperty("access_token")
  public String accessToken;

  @JsonProperty("refresh_token")
  public String refreshToken;

  @JsonProperty("id_token")
  public String idToken;

  @JsonProperty("token_type")
  public String tokenType;
}

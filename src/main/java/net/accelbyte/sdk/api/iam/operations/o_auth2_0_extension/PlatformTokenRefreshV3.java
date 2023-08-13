/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PlatformTokenRefreshV3
 *
 * <p>This endpoint will validate the third party platform token, for some platforms will also
 * refresh the token stored in IAM, it will not generate any event or AB access/refresh token.
 *
 * <p>This endpoint can be used by game client to refresh third party token if game client got
 * platform token not found error, for example got 404 platform token not found from IAP/DLC.
 *
 * <p>## Platforms will refresh stored token:
 *
 * <p>* twitch : The platform_tokenâs value is the authorization code returned by Twitch OAuth.
 *
 * <p>* epicgames : The platform_tokenâs value is an access-token or authorization code obtained
 * from Epicgames EOS Account Service.
 *
 * <p>* ps4 : The platform_tokenâs value is the authorization code returned by Sony OAuth.
 *
 * <p>* ps5 : The platform_tokenâs value is the authorization code returned by Sony OAuth.
 *
 * <p>* amazon : The platform_tokenâs value is authorization code.
 *
 * <p>* awscognito : The platform_tokenâs value is the aws cognito access token or id token (JWT).
 *
 * <p>* live : The platform_tokenâs value is xbox XSTS token
 *
 * <p>* snapchat : The platform_tokenâs value is the authorization code returned by Snapchat
 * OAuth.
 *
 * <p>* for specific generic oauth (OIDC) : The platform_tokenâs value should be the same type as
 * created OIDC auth type whether it is auth code, idToken or bearerToken.
 */
@Getter
@Setter
public class PlatformTokenRefreshV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/v3/platforms/{platformId}/token/verify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String platformId;

  private String platformToken;

  /**
   * @param platformId required
   * @param platformToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PlatformTokenRefreshV3(String platformId, String platformToken) {
    this.platformId = platformId;
    this.platformToken = platformToken;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    return pathParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.platformToken != null) {
      formDataParams.put("platform_token", this.platformToken);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.platformId == null) {
      return false;
    }
    if (this.platformToken == null) {
      return false;
    }
    return true;
  }

  public OauthmodelPlatformTokenRefreshResponseV3 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelPlatformTokenRefreshResponseV3().createFromJson(json);
  }
}

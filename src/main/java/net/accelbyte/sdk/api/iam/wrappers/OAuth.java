/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class OAuth {

  private AccelByteSDK sdk;

  public OAuth(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see Authorization
   * @deprecated
   */
  @Deprecated
  public String authorization(Authorization input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetJWKS
   * @deprecated
   */
  @Deprecated
  public OauthcommonJWKSet getJWKS(GetJWKS input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformTokenRequestHandler
   * @deprecated
   */
  @Deprecated
  public OauthmodelTokenResponse platformTokenRequestHandler(PlatformTokenRequestHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUser
   * @deprecated
   */
  @Deprecated
  public void revokeUser(RevokeUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRevocationList
   * @deprecated
   */
  @Deprecated
  public OauthapiRevocationList getRevocationList(GetRevocationList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeToken
   * @deprecated
   */
  @Deprecated
  public void revokeToken(RevokeToken input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeAUser
   * @deprecated
   */
  @Deprecated
  public void revokeAUser(RevokeAUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TokenGrant
   * @deprecated
   */
  @Deprecated
  public OauthmodelTokenResponse tokenGrant(TokenGrant input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see VerifyToken
   * @deprecated
   */
  @Deprecated
  public OauthmodelTokenResponse verifyToken(VerifyToken input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

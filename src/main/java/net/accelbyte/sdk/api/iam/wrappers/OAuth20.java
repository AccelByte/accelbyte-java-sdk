/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class OAuth20 {

  private AccelByteSDK sdk;

  public OAuth20(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminRetrieveUserThirdPartyPlatformTokenV3
   */
  public OauthmodelTokenThirdPartyResponse adminRetrieveUserThirdPartyPlatformTokenV3(
      AdminRetrieveUserThirdPartyPlatformTokenV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUserV3
   */
  public void revokeUserV3(RevokeUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AuthorizeV3
   */
  public String authorizeV3(AuthorizeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TokenIntrospectionV3
   */
  public OauthmodelTokenIntrospectResponse tokenIntrospectionV3(TokenIntrospectionV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetJWKSV3
   */
  public OauthcommonJWKSet getJWKSV3(GetJWKSV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendMFAAuthenticationCode
   */
  public void sendMFAAuthenticationCode(SendMFAAuthenticationCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see Change2faMethod
   */
  public void change2faMethod(Change2faMethod input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see Verify2faCode
   */
  public OauthmodelTokenResponseV3 verify2faCode(Verify2faCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveUserThirdPartyPlatformTokenV3
   */
  public OauthmodelTokenThirdPartyResponse retrieveUserThirdPartyPlatformTokenV3(
      RetrieveUserThirdPartyPlatformTokenV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AuthCodeRequestV3
   */
  public String authCodeRequestV3(AuthCodeRequestV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformTokenGrantV3
   */
  public OauthmodelTokenResponse platformTokenGrantV3(PlatformTokenGrantV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRevocationListV3
   */
  public OauthapiRevocationList getRevocationListV3(GetRevocationListV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TokenRevocationV3
   */
  public void tokenRevocationV3(TokenRevocationV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SimultaneousLoginV3
   */
  public OauthmodelTokenResponseV3 simultaneousLoginV3(SimultaneousLoginV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TokenGrantV3
   */
  public OauthmodelTokenWithDeviceCookieResponseV3 tokenGrantV3(TokenGrantV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see VerifyTokenV3
   */
  public OauthmodelTokenResponseV3 verifyTokenV3(VerifyTokenV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

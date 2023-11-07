/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class OAuth20Extension {

  private AccelByteSDK sdk;

  public OAuth20Extension(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see UserAuthenticationV3
   */
  public String userAuthenticationV3(UserAuthenticationV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AuthenticationWithPlatformLinkV3
   */
  public OauthmodelTokenResponseV3 authenticationWithPlatformLinkV3(
      AuthenticationWithPlatformLinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GenerateTokenByNewHeadlessAccountV3
   */
  public OauthmodelTokenResponseV3 generateTokenByNewHeadlessAccountV3(
      GenerateTokenByNewHeadlessAccountV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestOneTimeLinkingCodeV3
   */
  public OauthmodelOneTimeLinkingCodeResponse requestOneTimeLinkingCodeV3(
      RequestOneTimeLinkingCodeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ValidateOneTimeLinkingCodeV3
   */
  public OauthmodelOneTimeLinkingCodeValidationResponse validateOneTimeLinkingCodeV3(
      ValidateOneTimeLinkingCodeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestTokenByOneTimeLinkCodeResponseV3
   */
  public OauthmodelTokenResponseV3 requestTokenByOneTimeLinkCodeResponseV3(
      RequestTokenByOneTimeLinkCodeResponseV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCountryLocationV3
   */
  public OauthmodelCountryLocationResponse getCountryLocationV3(GetCountryLocationV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see Logout
   */
  public void logout(Logout input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestTokenExchangeCodeV3
   */
  public OauthmodelTargetTokenCodeResponse requestTokenExchangeCodeV3(
      RequestTokenExchangeCodeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformAuthenticationV3
   */
  public String platformAuthenticationV3(PlatformAuthenticationV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformTokenRefreshV3
   */
  public OauthmodelPlatformTokenRefreshResponseV3 platformTokenRefreshV3(
      PlatformTokenRefreshV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestTargetTokenResponseV3
   */
  public OauthmodelTokenResponseV3 requestTargetTokenResponseV3(RequestTargetTokenResponseV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformTokenRefreshV3Deprecate
   * @deprecated
   */
  @Deprecated
  public OauthmodelPlatformTokenRefreshResponseV3 platformTokenRefreshV3Deprecate(
      PlatformTokenRefreshV3Deprecate input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

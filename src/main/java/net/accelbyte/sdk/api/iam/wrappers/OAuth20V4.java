/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class OAuth20V4 {

  private AccelByteSDK sdk;

  public OAuth20V4(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AuthenticationWithPlatformLinkV4
   */
  public OauthmodelTokenResponseV3 authenticationWithPlatformLinkV4(
      AuthenticationWithPlatformLinkV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GenerateTokenByNewHeadlessAccountV4
   */
  public OauthmodelTokenResponseV3 generateTokenByNewHeadlessAccountV4(
      GenerateTokenByNewHeadlessAccountV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see Verify2faCodeV4
   */
  public OauthmodelTokenResponseV3 verify2faCodeV4(Verify2faCodeV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformTokenGrantV4
   */
  public OauthmodelTokenResponseV3 platformTokenGrantV4(PlatformTokenGrantV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SimultaneousLoginV4
   */
  public OauthmodelTokenResponseV3 simultaneousLoginV4(SimultaneousLoginV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TokenGrantV4
   */
  public OauthmodelTokenWithDeviceCookieResponseV3 tokenGrantV4(TokenGrantV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestTargetTokenResponseV4
   */
  public OauthmodelTokenResponseV3 requestTargetTokenResponseV4(RequestTargetTokenResponseV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

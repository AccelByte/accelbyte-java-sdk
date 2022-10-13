/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.third_party.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ThirdParty {

  private AccelByteSDK sdk;

  public ThirdParty(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetThirdPartyConfig
   */
  public ModelsGetConfigResponse adminGetThirdPartyConfig(AdminGetThirdPartyConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateThirdPartyConfig
   */
  public ModelsUpdateConfigResponse adminUpdateThirdPartyConfig(AdminUpdateThirdPartyConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateThirdPartyConfig
   */
  public ModelsCreateConfigResponse adminCreateThirdPartyConfig(AdminCreateThirdPartyConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteThirdPartyConfig
   */
  public void adminDeleteThirdPartyConfig(AdminDeleteThirdPartyConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

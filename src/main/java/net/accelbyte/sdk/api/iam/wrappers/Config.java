/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Config {

  private AccelByteSDK sdk;

  public Config(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetConfigValueV3
   */
  public ModelConfigValueResponseV3 adminGetConfigValueV3(AdminGetConfigValueV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetSystemConfigV3
   */
  public ModelInternalConfigResponseV3 publicGetSystemConfigV3(PublicGetSystemConfigV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetConfigValueV3
   */
  public ModelConfigValueResponseV3 publicGetConfigValueV3(PublicGetConfigValueV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

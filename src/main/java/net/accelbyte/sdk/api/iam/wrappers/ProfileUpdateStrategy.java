/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.profile_update_strategy.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ProfileUpdateStrategy {

  private AccelByteSDK sdk;

  public ProfileUpdateStrategy(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetProfileUpdateStrategyV3
   */
  public ModelGetProfileUpdateStrategyConfigResponse adminGetProfileUpdateStrategyV3(
      AdminGetProfileUpdateStrategyV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateProfileUpdateStrategyV3
   */
  public ModelSimpleProfileUpdateStrategyConfigs adminUpdateProfileUpdateStrategyV3(
      AdminUpdateProfileUpdateStrategyV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetProfileUpdateStrategyV3
   */
  public ModelGetProfileUpdateStrategyConfigResponse publicGetProfileUpdateStrategyV3(
      PublicGetProfileUpdateStrategyV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

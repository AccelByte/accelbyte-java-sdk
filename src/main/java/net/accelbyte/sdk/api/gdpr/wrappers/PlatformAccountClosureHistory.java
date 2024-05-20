/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.platform_account_closure_history.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PlatformAccountClosureHistory {

  private AccelByteSDK sdk;

  public PlatformAccountClosureHistory(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetUserPlatformAccountClosureHistories
   */
  public DtoUserPlatformAccountClosureHistoriesResponse adminGetUserPlatformAccountClosureHistories(
      AdminGetUserPlatformAccountClosureHistories input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

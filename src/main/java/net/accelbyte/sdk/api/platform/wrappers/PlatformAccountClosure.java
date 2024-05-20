/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.platform_account_closure.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PlatformAccountClosure {

  private AccelByteSDK sdk;

  public PlatformAccountClosure(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserPlatformAccountClosureHistories
   */
  public List<PlatformAccountClosureHistoryInfo> getUserPlatformAccountClosureHistories(
      GetUserPlatformAccountClosureHistories input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

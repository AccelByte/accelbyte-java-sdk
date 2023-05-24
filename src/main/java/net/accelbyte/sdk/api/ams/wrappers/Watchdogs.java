/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.wrappers;

import net.accelbyte.sdk.api.ams.operations.watchdogs.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Watchdogs {

  private AccelByteSDK sdk;

  public Watchdogs(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see WatchdogConnect
   */
  public void watchdogConnect(WatchdogConnect input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

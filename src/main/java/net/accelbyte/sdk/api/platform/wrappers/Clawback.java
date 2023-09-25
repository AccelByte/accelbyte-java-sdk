/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.clawback.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Clawback {

  private AccelByteSDK sdk;

  public Clawback(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryIAPClawbackHistory
   */
  public IAPClawbackPagingSlicedResult queryIAPClawbackHistory(QueryIAPClawbackHistory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see MockPlayStationStreamEvent
   */
  public void mockPlayStationStreamEvent(MockPlayStationStreamEvent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

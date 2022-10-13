/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.wrappers;

import net.accelbyte.sdk.api.qosm.operations.server.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Server {

  private AccelByteSDK sdk;

  public Server(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see Heartbeat
   */
  public void heartbeat(Heartbeat input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

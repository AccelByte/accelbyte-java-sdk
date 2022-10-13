/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.wrappers;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.operations.public_.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Public {

  private AccelByteSDK sdk;

  public Public(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ListServerPerNamespace
   */
  public ModelsListServerResponse listServerPerNamespace(ListServerPerNamespace input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListServer
   */
  public ModelsListServerResponse listServer(ListServer input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

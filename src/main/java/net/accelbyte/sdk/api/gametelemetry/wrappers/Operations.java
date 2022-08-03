/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.wrappers;

import net.accelbyte.sdk.api.gametelemetry.operations.operations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Operations {

  private AccelByteSDK sdk;

  public Operations(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
   */
  public void getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet(
      GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.wrappers;

import net.accelbyte.sdk.api.gametelemetry.operations.telemetry.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Telemetry {

  private AccelByteSDK sdk;

  public Telemetry(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
   */
  public void getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet(
      GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

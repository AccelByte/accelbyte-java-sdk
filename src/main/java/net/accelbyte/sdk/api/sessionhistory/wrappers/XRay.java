/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.wrappers;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.api.sessionhistory.operations.x_ray.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class XRay {

  private AccelByteSDK sdk;

  public XRay(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateXrayTicketObservability
   */
  public ApimodelsXRayTicketObservabilityResponse createXrayTicketObservability(
      CreateXrayTicketObservability input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateXrayBulkTicketObservability
   */
  public ApimodelsXRayBulkTicketObservabilityResponse createXrayBulkTicketObservability(
      CreateXrayBulkTicketObservability input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

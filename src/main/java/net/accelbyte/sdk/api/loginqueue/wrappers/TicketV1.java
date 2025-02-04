/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.loginqueue.wrappers;

import net.accelbyte.sdk.api.loginqueue.models.*;
import net.accelbyte.sdk.api.loginqueue.operations.ticket_v1.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class TicketV1 {

  private AccelByteSDK sdk;

  public TicketV1(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RefreshTicket
   */
  public ApimodelsRefreshTicketResponse refreshTicket(RefreshTicket input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CancelTicket
   */
  public void cancelTicket(CancelTicket input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

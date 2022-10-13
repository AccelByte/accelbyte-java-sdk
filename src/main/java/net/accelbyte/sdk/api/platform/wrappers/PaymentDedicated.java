/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment_dedicated.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PaymentDedicated {

  private AccelByteSDK sdk;

  public PaymentDedicated(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreatePaymentOrderByDedicated
   */
  public PaymentOrderCreateResult createPaymentOrderByDedicated(CreatePaymentOrderByDedicated input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RefundPaymentOrderByDedicated
   */
  public PaymentOrderRefundResult refundPaymentOrderByDedicated(RefundPaymentOrderByDedicated input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncPaymentOrders
   */
  public PaymentOrderSyncResult syncPaymentOrders(SyncPaymentOrders input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

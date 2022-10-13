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
import net.accelbyte.sdk.api.platform.operations.payment.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Payment {

  private AccelByteSDK sdk;

  public Payment(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryPaymentNotifications
   */
  public PaymentNotificationPagingSlicedResult queryPaymentNotifications(
      QueryPaymentNotifications input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryPaymentOrders
   */
  public PaymentOrderPagingSlicedResult queryPaymentOrders(QueryPaymentOrders input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListExtOrderNoByExtTxId
   */
  public List<String> listExtOrderNoByExtTxId(ListExtOrderNoByExtTxId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPaymentOrder
   */
  public PaymentOrderInfo getPaymentOrder(GetPaymentOrder input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ChargePaymentOrder
   */
  public PaymentOrderInfo chargePaymentOrder(ChargePaymentOrder input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SimulatePaymentOrderNotification
   */
  public NotificationProcessResult simulatePaymentOrderNotification(
      SimulatePaymentOrderNotification input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPaymentOrderChargeStatus
   */
  public PaymentOrderChargeStatus getPaymentOrderChargeStatus(GetPaymentOrderChargeStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateUserPaymentOrder
   */
  public PaymentOrderInfo createUserPaymentOrder(CreateUserPaymentOrder input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RefundUserPaymentOrder
   */
  public PaymentOrderInfo refundUserPaymentOrder(RefundUserPaymentOrder input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

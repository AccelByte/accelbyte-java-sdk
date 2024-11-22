/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.notification_subscription.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class NotificationSubscription {

  private AccelByteSDK sdk;

  public NotificationSubscription(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetNotificationSubscriberListV2
   */
  public ApimodelGetNotificationSubscriberListResponse getNotificationSubscriberListV2(
      GetNotificationSubscriberListV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkSaveSubscriptionAppNotificationV2
   */
  public ApimodelGetNotificationSubscriberListResponse bulkSaveSubscriptionAppNotificationV2(
      BulkSaveSubscriptionAppNotificationV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SubscribeAppNotificationV2
   */
  public ApimodelSubscribeNotificationResponse subscribeAppNotificationV2(
      SubscribeAppNotificationV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSubscriptionV2Handler
   */
  public ApimodelGetNotificationSubscriberStatusResponse getSubscriptionV2Handler(
      GetSubscriptionV2Handler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SubscribeV2Handler
   */
  public void subscribeV2Handler(SubscribeV2Handler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UnsubscribeV2Handler
   */
  public void unsubscribeV2Handler(UnsubscribeV2Handler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSubscriptionAppNotificationByUserIDV2
   */
  public void deleteSubscriptionAppNotificationByUserIDV2(
      DeleteSubscriptionAppNotificationByUserIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSubscriptionAppNotificationV2
   * @deprecated
   */
  @Deprecated
  public void deleteSubscriptionAppNotificationV2(DeleteSubscriptionAppNotificationV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

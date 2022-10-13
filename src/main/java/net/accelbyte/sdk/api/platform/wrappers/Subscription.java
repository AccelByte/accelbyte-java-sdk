/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.subscription.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Subscription {

  private AccelByteSDK sdk;

  public Subscription(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QuerySubscriptions
   */
  public SubscriptionPagingSlicedResult querySubscriptions(QuerySubscriptions input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RecurringChargeSubscription
   */
  public RecurringChargeResult recurringChargeSubscription(RecurringChargeSubscription input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserSubscriptions
   */
  public SubscriptionPagingSlicedResult queryUserSubscriptions(QueryUserSubscriptions input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserSubscriptionActivities
   */
  public SubscriptionActivityPagingSlicedResult getUserSubscriptionActivities(
      GetUserSubscriptionActivities input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformSubscribeSubscription
   */
  public SubscriptionInfo platformSubscribeSubscription(PlatformSubscribeSubscription input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CheckUserSubscriptionSubscribableByItemId
   */
  public Subscribable checkUserSubscriptionSubscribableByItemId(
      CheckUserSubscriptionSubscribableByItemId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserSubscription
   */
  public SubscriptionInfo getUserSubscription(GetUserSubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserSubscription
   */
  public void deleteUserSubscription(DeleteUserSubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CancelSubscription
   */
  public SubscriptionInfo cancelSubscription(CancelSubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GrantDaysToSubscription
   */
  public SubscriptionInfo grantDaysToSubscription(GrantDaysToSubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserSubscriptionBillingHistories
   */
  public BillingHistoryPagingSlicedResult getUserSubscriptionBillingHistories(
      GetUserSubscriptionBillingHistories input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ProcessUserSubscriptionNotification
   */
  public void processUserSubscriptionNotification(ProcessUserSubscriptionNotification input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserSubscriptions
   */
  public SubscriptionPagingSlicedResult publicQueryUserSubscriptions(
      PublicQueryUserSubscriptions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSubscribeSubscription
   */
  public void publicSubscribeSubscription(PublicSubscribeSubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCheckUserSubscriptionSubscribableByItemId
   */
  public Subscribable publicCheckUserSubscriptionSubscribableByItemId(
      PublicCheckUserSubscriptionSubscribableByItemId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserSubscription
   */
  public SubscriptionInfo publicGetUserSubscription(PublicGetUserSubscription input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicChangeSubscriptionBillingAccount
   */
  public SubscriptionInfo publicChangeSubscriptionBillingAccount(
      PublicChangeSubscriptionBillingAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCancelSubscription
   */
  public SubscriptionInfo publicCancelSubscription(PublicCancelSubscription input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserSubscriptionBillingHistories
   */
  public BillingHistoryPagingSlicedResult publicGetUserSubscriptionBillingHistories(
      PublicGetUserSubscriptionBillingHistories input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

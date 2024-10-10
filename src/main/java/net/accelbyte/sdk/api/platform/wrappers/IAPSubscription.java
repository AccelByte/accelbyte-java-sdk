/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.iap_subscription.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class IAPSubscription {

  private AccelByteSDK sdk;

  public IAPSubscription(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryThirdPartySubscription
   */
  public ThirdPartyUserSubscriptionPagingSlicedResult queryThirdPartySubscription(
      QueryThirdPartySubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserThirdPartySubscription
   */
  public ThirdPartyUserSubscriptionPagingSlicedResult queryUserThirdPartySubscription(
      QueryUserThirdPartySubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartyPlatformSubscriptionOwnershipByGroupId
   */
  public ThirdPartySubscriptionOwnership getThirdPartyPlatformSubscriptionOwnershipByGroupId(
      GetThirdPartyPlatformSubscriptionOwnershipByGroupId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartyPlatformSubscriptionOwnershipByProductId
   */
  public ThirdPartySubscriptionOwnership getThirdPartyPlatformSubscriptionOwnershipByProductId(
      GetThirdPartyPlatformSubscriptionOwnershipByProductId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserThirdPartySubscriptionTransactions
   */
  public ThirdPartySubscriptionTransactionPagingSlicedResult
      queryUserThirdPartySubscriptionTransactions(QueryUserThirdPartySubscriptionTransactions input)
          throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartySubscriptionDetails
   */
  public ThirdPartySubscriptionTransactionInfo getThirdPartySubscriptionDetails(
      GetThirdPartySubscriptionDetails input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSubscriptionHistory
   */
  public ThirdPartySubscriptionTransactionHistoryPagingSlicedResult getSubscriptionHistory(
      GetSubscriptionHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncSubscriptionTransaction
   */
  public ThirdPartySubscriptionTransactionInfo syncSubscriptionTransaction(
      SyncSubscriptionTransaction input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartyUserSubscriptionDetails
   */
  public ThirdPartyUserSubscriptionInfo getThirdPartyUserSubscriptionDetails(
      GetThirdPartyUserSubscriptionDetails input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncSubscription
   */
  public ThirdPartyUserSubscriptionInfo syncSubscription(SyncSubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserThirdPartySubscription
   */
  public ThirdPartyUserSubscriptionPagingSlicedResult publicQueryUserThirdPartySubscription(
      PublicQueryUserThirdPartySubscription input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

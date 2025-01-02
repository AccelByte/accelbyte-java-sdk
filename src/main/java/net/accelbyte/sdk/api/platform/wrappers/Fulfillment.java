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
import net.accelbyte.sdk.api.platform.operations.fulfillment.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Fulfillment {

  private AccelByteSDK sdk;

  public Fulfillment(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryFulfillmentHistories
   */
  public FulfillmentHistoryPagingSlicedResult queryFulfillmentHistories(
      QueryFulfillmentHistories input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FulfillItem
   */
  public FulfillmentResult fulfillItem(FulfillItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RedeemCode
   */
  public FulfillmentResult redeemCode(RedeemCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PreCheckFulfillItem
   */
  public List<FulfillmentItem> preCheckFulfillItem(PreCheckFulfillItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FulfillRewards
   */
  public void fulfillRewards(FulfillRewards input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicRedeemCode
   */
  public FulfillmentResult publicRedeemCode(PublicRedeemCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryFulfillments
   */
  public FulfillmentPagingSlicedResult queryFulfillments(QueryFulfillments input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FulfillRewardsV2
   */
  public FulfillmentResult fulfillRewardsV2(FulfillRewardsV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FulfillItems
   * @deprecated
   */
  @Deprecated
  public FulfillmentV2Result fulfillItems(FulfillItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetryFulfillItems
   * @deprecated
   */
  @Deprecated
  public FulfillmentV2Result retryFulfillItems(RetryFulfillItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeItems
   * @deprecated
   */
  @Deprecated
  public RevokeFulfillmentV2Result revokeItems(RevokeItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FulfillItemsV3
   */
  public FulfillmentV2Result fulfillItemsV3(FulfillItemsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetryFulfillItemsV3
   */
  public FulfillmentV2Result retryFulfillItemsV3(RetryFulfillItemsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeItemsV3
   */
  public RevokeFulfillmentV2Result revokeItemsV3(RevokeItemsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

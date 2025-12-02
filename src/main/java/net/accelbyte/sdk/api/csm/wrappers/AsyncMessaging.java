/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.async_messaging.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AsyncMessaging {

  private AccelByteSDK sdk;

  public AsyncMessaging(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateSubscriptionHandler
   */
  public ApimodelCreateSubscriptionResponse createSubscriptionHandler(
      CreateSubscriptionHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UnsubscribeTopicHandler
   */
  public ApimodelTopicSubscription unsubscribeTopicHandler(UnsubscribeTopicHandler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListTopicsHandler
   */
  public ApimodelListTopicsResponse listTopicsHandler(ListTopicsHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateTopicHandler
   */
  public ApimodelTopicResponse createTopicHandler(CreateTopicHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteTopicHandler
   */
  public ApimodelTopicResponse deleteTopicHandler(DeleteTopicHandler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.notification_subscription_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class NotificationSubscriptionV3 {

  private AccelByteSDK sdk;

  public NotificationSubscriptionV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetNotificationSubscriberListV3
   */
  public ApimodelGetNotificationSubscriberListResponseV2 getNotificationSubscriberListV3(
      GetNotificationSubscriberListV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSubscriptionAppNotificationV3
   */
  public void deleteSubscriptionAppNotificationV3(DeleteSubscriptionAppNotificationV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

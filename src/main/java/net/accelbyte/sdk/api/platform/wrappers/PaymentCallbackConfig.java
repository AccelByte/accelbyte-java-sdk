/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment_callback_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PaymentCallbackConfig {

  private AccelByteSDK sdk;

  public PaymentCallbackConfig(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetPaymentCallbackConfig
   */
  public PaymentCallbackConfigInfo getPaymentCallbackConfig(GetPaymentCallbackConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePaymentCallbackConfig
   */
  public PaymentCallbackConfigInfo updatePaymentCallbackConfig(UpdatePaymentCallbackConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

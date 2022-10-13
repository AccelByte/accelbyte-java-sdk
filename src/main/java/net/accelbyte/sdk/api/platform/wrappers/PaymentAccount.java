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
import net.accelbyte.sdk.api.platform.operations.payment_account.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PaymentAccount {

  private AccelByteSDK sdk;

  public PaymentAccount(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicGetPaymentAccounts
   */
  public List<net.accelbyte.sdk.api.platform.models.PaymentAccount> publicGetPaymentAccounts(
      PublicGetPaymentAccounts input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeletePaymentAccount
   */
  public void publicDeletePaymentAccount(PublicDeletePaymentAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

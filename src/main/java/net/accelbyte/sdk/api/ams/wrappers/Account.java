/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.wrappers;

import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.operations.account.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Account {

  private AccelByteSDK sdk;

  public Account(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AccountGet
   */
  public ApiAccountResponse accountGet(AccountGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AccountCreate
   */
  public ApiAccountCreateResponse accountCreate(AccountCreate input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AccountLinkTokenGet
   */
  public ApiAccountLinkTokenResponse accountLinkTokenGet(AccountLinkTokenGet input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AccountLink
   */
  public ApiAccountLinkResponse accountLink(AccountLink input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.wrappers;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.global_statistic.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GlobalStatistic {

  private AccelByteSDK sdk;

  public GlobalStatistic(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetGlobalStatItems
   */
  public GlobalStatItemPagingSlicedResult getGlobalStatItems(GetGlobalStatItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGlobalStatItemByStatCode
   */
  public GlobalStatItemInfo getGlobalStatItemByStatCode(GetGlobalStatItemByStatCode input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGlobalStatItems1
   */
  public GlobalStatItemPagingSlicedResult getGlobalStatItems1(GetGlobalStatItems1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGlobalStatItemByStatCode1
   */
  public GlobalStatItemInfo getGlobalStatItemByStatCode1(GetGlobalStatItemByStatCode1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

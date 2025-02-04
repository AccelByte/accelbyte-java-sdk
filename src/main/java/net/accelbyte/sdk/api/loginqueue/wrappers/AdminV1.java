/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.loginqueue.wrappers;

import net.accelbyte.sdk.api.loginqueue.models.*;
import net.accelbyte.sdk.api.loginqueue.operations.admin_v1.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminV1 {

  private AccelByteSDK sdk;

  public AdminV1(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetConfiguration
   */
  public ApimodelsConfigurationResponse adminGetConfiguration(AdminGetConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateConfiguration
   */
  public ApimodelsConfigurationResponse adminUpdateConfiguration(AdminUpdateConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetStatus
   */
  public ApimodelsQueueStatusResponse adminGetStatus(AdminGetStatus input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.global_configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GlobalConfiguration {

  private AccelByteSDK sdk;

  public GlobalConfiguration(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListGlobalConfiguration
   */
  public ApimodelsGlobalConfigurationResponse adminListGlobalConfiguration(
      AdminListGlobalConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateGlobalConfiguration
   */
  public ApimodelsGlobalConfigurationResponse adminUpdateGlobalConfiguration(
      AdminUpdateGlobalConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteGlobalConfiguration
   */
  public void adminDeleteGlobalConfiguration(AdminDeleteGlobalConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

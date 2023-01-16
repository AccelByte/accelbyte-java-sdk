/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.service_plugin_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ServicePluginConfig {

  private AccelByteSDK sdk;

  public ServicePluginConfig(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetServicePluginConfig
   */
  public ServicePluginConfigInfo getServicePluginConfig(GetServicePluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateServicePluginConfig
   */
  public ServicePluginConfigInfo updateServicePluginConfig(UpdateServicePluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteServicePluginConfig
   */
  public void deleteServicePluginConfig(DeleteServicePluginConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

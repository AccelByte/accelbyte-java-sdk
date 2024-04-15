/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.admin_integration_configurations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminIntegrationConfigurations {

  private AccelByteSDK sdk;

  public AdminIntegrationConfigurations(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListIntegrationConfigurations
   */
  public ApimodelsListIntegrationConfigurationsResp adminListIntegrationConfigurations(
      AdminListIntegrationConfigurations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateIntegrationConfiguration
   */
  public ApimodelsIntegrationConfigurationResp adminCreateIntegrationConfiguration(
      AdminCreateIntegrationConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateIntegrationConfiguration
   */
  public ApimodelsIntegrationConfigurationResp adminUpdateIntegrationConfiguration(
      AdminUpdateIntegrationConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateStatusIntegrationConfiguration
   */
  public ApimodelsIntegrationConfigurationResp adminUpdateStatusIntegrationConfiguration(
      AdminUpdateStatusIntegrationConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.admin_inventory_configurations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminInventoryConfigurations {

  private AccelByteSDK sdk;

  public AdminInventoryConfigurations(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListInventoryConfigurations
   */
  public ApimodelsListInventoryConfigurationsResp adminListInventoryConfigurations(
      AdminListInventoryConfigurations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateInventoryConfiguration
   */
  public ApimodelsInventoryConfigurationResp adminCreateInventoryConfiguration(
      AdminCreateInventoryConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetInventoryConfiguration
   */
  public ApimodelsInventoryConfigurationResp adminGetInventoryConfiguration(
      AdminGetInventoryConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateInventoryConfiguration
   */
  public ApimodelsInventoryConfigurationResp adminUpdateInventoryConfiguration(
      AdminUpdateInventoryConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteInventoryConfiguration
   */
  public void adminDeleteInventoryConfiguration(AdminDeleteInventoryConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

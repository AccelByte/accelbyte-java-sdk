/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.admin_items.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminItems {

  private AccelByteSDK sdk;

  public AdminItems(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListItems
   */
  public ApimodelsListItemResp adminListItems(AdminListItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetInventoryItem
   */
  public ApimodelsItemResp adminGetInventoryItem(AdminGetInventoryItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkUpdateMyItems
   */
  public List<ApimodelsUpdateItemResp> adminBulkUpdateMyItems(AdminBulkUpdateMyItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSaveItemToInventory
   */
  public ApimodelsItemResp adminSaveItemToInventory(AdminSaveItemToInventory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkRemoveItems
   */
  public List<ApimodelsUpdateItemResp> adminBulkRemoveItems(AdminBulkRemoveItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminConsumeUserItem
   */
  public ApimodelsItemResp adminConsumeUserItem(AdminConsumeUserItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSaveItem
   */
  public ApimodelsItemResp adminSaveItem(AdminSaveItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

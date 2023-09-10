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
import net.accelbyte.sdk.api.inventory.operations.public_items.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicItems {

  private AccelByteSDK sdk;

  public PublicItems(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicConsumeMyItem
   */
  public ApimodelsItemResp publicConsumeMyItem(PublicConsumeMyItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListItems
   */
  public ApimodelsListItemResp publicListItems(PublicListItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkUpdateMyItems
   */
  public List<ApimodelsUpdateItemResp> publicBulkUpdateMyItems(PublicBulkUpdateMyItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkRemoveMyItems
   */
  public List<ApimodelsUpdateItemResp> publicBulkRemoveMyItems(PublicBulkRemoveMyItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicMoveMyItems
   */
  public ApimodelsMoveItemsResp publicMoveMyItems(PublicMoveMyItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetItem
   */
  public ApimodelsItemResp publicGetItem(PublicGetItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

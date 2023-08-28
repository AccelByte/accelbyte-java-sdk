/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.admin_tags.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminTags {

  private AccelByteSDK sdk;

  public AdminTags(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListTags
   */
  public ApimodelsListTagsResp adminListTags(AdminListTags input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateTag
   */
  public ApimodelsCreateTagResp adminCreateTag(AdminCreateTag input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteTag
   */
  public void adminDeleteTag(AdminDeleteTag input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

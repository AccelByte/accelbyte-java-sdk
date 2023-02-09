/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.wrappers;

import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.api.reporting.operations.admin_extension_categories_and_auto_moderation_actions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminExtensionCategoriesAndAutoModerationActions {

  private AccelByteSDK sdk;

  public AdminExtensionCategoriesAndAutoModerationActions(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminFindActionList
   */
  public RestapiActionListApiResponse adminFindActionList(AdminFindActionList input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateModAction
   */
  public RestapiActionApiResponse adminCreateModAction(AdminCreateModAction input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminFindExtensionCategoryList
   */
  public RestapiExtensionCategoryListApiResponse adminFindExtensionCategoryList(
      AdminFindExtensionCategoryList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateExtensionCategory
   */
  public RestapiExtensionCategoryApiResponse adminCreateExtensionCategory(
      AdminCreateExtensionCategory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

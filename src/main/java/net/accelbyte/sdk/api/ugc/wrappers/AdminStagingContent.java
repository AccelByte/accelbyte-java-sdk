/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.admin_staging_content.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminStagingContent {

  private AccelByteSDK sdk;

  public AdminStagingContent(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListStagingContents
   */
  public ModelsPaginatedListStagingContentResponse adminListStagingContents(
      AdminListStagingContents input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetStagingContentByID
   */
  public ModelsStagingContentResponse adminGetStagingContentByID(AdminGetStagingContentByID input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminApproveStagingContent
   */
  public ModelsStagingContentResponse adminApproveStagingContent(AdminApproveStagingContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUserStagingContents
   */
  public ModelsPaginatedListStagingContentResponse adminListUserStagingContents(
      AdminListUserStagingContents input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

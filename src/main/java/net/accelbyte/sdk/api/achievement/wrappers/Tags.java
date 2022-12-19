/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.wrappers;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.operations.tags.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Tags {

  private AccelByteSDK sdk;

  public Tags(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListTags
   */
  public ModelsPaginatedTagResponse adminListTags(AdminListTags input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListTags
   */
  public ModelsPaginatedTagResponse publicListTags(PublicListTags input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_like_v2.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicLikeV2 {

  private AccelByteSDK sdk;

  public PublicLikeV2(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicListContentLikeV2
   */
  public ModelsPaginatedContentLikersResponse publicListContentLikeV2(PublicListContentLikeV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateContentLikeStatusV2
   */
  public ModelsContentLikeResponse updateContentLikeStatusV2(UpdateContentLikeStatusV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

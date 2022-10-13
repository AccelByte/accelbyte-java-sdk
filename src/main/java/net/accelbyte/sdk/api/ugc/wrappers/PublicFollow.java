/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_follow.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicFollow {

  private AccelByteSDK sdk;

  public PublicFollow(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetFollowedContent
   */
  public ModelsPaginatedContentDownloadResponse getFollowedContent(GetFollowedContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetFollowedUsers
   */
  public ModelsPaginatedCreatorOverviewResponse getFollowedUsers(GetFollowedUsers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserFollowStatus
   */
  public ModelsUserFollowResponse updateUserFollowStatus(UpdateUserFollowStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPublicFollowers
   */
  public ModelsPaginatedCreatorOverviewResponse getPublicFollowers(GetPublicFollowers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPublicFollowing
   */
  public ModelsPaginatedCreatorOverviewResponse getPublicFollowing(GetPublicFollowing input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

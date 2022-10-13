/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.user_visibility.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserVisibility {

  private AccelByteSDK sdk;

  public UserVisibility(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetHiddenUsersV2
   */
  public ModelsGetHiddenUserResponse getHiddenUsersV2(GetHiddenUsersV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserVisibilityStatusV2
   */
  public ModelsGetUserVisibilityResponse getUserVisibilityStatusV2(GetUserVisibilityStatusV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetUserLeaderboardVisibilityStatusV2
   */
  public ModelsGetUserVisibilityResponse setUserLeaderboardVisibilityStatusV2(
      SetUserLeaderboardVisibilityStatusV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetUserVisibilityStatusV2
   */
  public ModelsGetUserVisibilityResponse setUserVisibilityStatusV2(SetUserVisibilityStatusV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

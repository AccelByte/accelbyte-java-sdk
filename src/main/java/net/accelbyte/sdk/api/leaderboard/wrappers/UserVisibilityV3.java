/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.user_visibility_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserVisibilityV3 {

  private AccelByteSDK sdk;

  public UserVisibilityV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetHiddenUsersV3
   */
  public ModelsGetHiddenUserResponse getHiddenUsersV3(GetHiddenUsersV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserVisibilityStatusV3
   */
  public ModelsGetUserVisibilityResponse getUserVisibilityStatusV3(GetUserVisibilityStatusV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetUserLeaderboardVisibilityV3
   */
  public ModelsGetUserVisibilityResponse setUserLeaderboardVisibilityV3(
      SetUserLeaderboardVisibilityV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetUserVisibilityV3
   */
  public ModelsGetUserVisibilityResponse setUserVisibilityV3(SetUserVisibilityV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.user_data_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserDataV3 {

  private AccelByteSDK sdk;

  public UserDataV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserLeaderboardRankingsAdminV3
   */
  public ModelsGetAllUserLeaderboardsRespV3 getUserLeaderboardRankingsAdminV3(
      GetUserLeaderboardRankingsAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LeaderboardDataV3 {

  private AccelByteSDK sdk;

  public LeaderboardDataV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetAllTimeLeaderboardRankingAdminV3
   */
  public ModelsGetLeaderboardRankingResp getAllTimeLeaderboardRankingAdminV3(
      GetAllTimeLeaderboardRankingAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentCycleLeaderboardRankingAdminV3
   */
  public ModelsGetLeaderboardRankingResp getCurrentCycleLeaderboardRankingAdminV3(
      GetCurrentCycleLeaderboardRankingAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingByLeaderboardCodeAdminV3
   */
  public void deleteUserRankingByLeaderboardCodeAdminV3(
      DeleteUserRankingByLeaderboardCodeAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingAdminV3
   */
  public ModelsUserRankingResponseV3 getUserRankingAdminV3(GetUserRankingAdminV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingAdminV3
   */
  public void deleteUserRankingAdminV3(DeleteUserRankingAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingsAdminV3
   */
  public void deleteUserRankingsAdminV3(DeleteUserRankingsAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV3
   */
  public ModelsGetLeaderboardRankingResp getAllTimeLeaderboardRankingPublicV3(
      GetAllTimeLeaderboardRankingPublicV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentCycleLeaderboardRankingPublicV3
   */
  public ModelsGetLeaderboardRankingResp getCurrentCycleLeaderboardRankingPublicV3(
      GetCurrentCycleLeaderboardRankingPublicV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingPublicV3
   */
  public ModelsUserRankingResponseV3 getUserRankingPublicV3(GetUserRankingPublicV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

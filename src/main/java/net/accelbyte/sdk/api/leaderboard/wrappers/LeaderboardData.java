/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LeaderboardData {

  private AccelByteSDK sdk;

  public LeaderboardData(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetArchivedLeaderboardRankingDataV1Handler
   */
  public List<ModelsArchiveLeaderboardSignedURLResponse>
      adminGetArchivedLeaderboardRankingDataV1Handler(
          AdminGetArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateArchivedLeaderboardRankingDataV1Handler
   */
  public void createArchivedLeaderboardRankingDataV1Handler(
      CreateArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getAllTimeLeaderboardRankingAdminV1(
      GetAllTimeLeaderboardRankingAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentMonthLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentMonthLeaderboardRankingAdminV1(
      GetCurrentMonthLeaderboardRankingAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentSeasonLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentSeasonLeaderboardRankingAdminV1(
      GetCurrentSeasonLeaderboardRankingAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTodayLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getTodayLeaderboardRankingAdminV1(
      GetTodayLeaderboardRankingAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingAdminV1
   */
  public ModelsUserRankingResponse getUserRankingAdminV1(GetUserRankingAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserPointAdminV1
   */
  public ModelsUpdateUserPointAdminV1Response updateUserPointAdminV1(UpdateUserPointAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingAdminV1
   */
  public void deleteUserRankingAdminV1(DeleteUserRankingAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentWeekLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentWeekLeaderboardRankingAdminV1(
      GetCurrentWeekLeaderboardRankingAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingsAdminV1
   */
  public void deleteUserRankingsAdminV1(DeleteUserRankingsAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getAllTimeLeaderboardRankingPublicV1(
      GetAllTimeLeaderboardRankingPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetArchivedLeaderboardRankingDataV1Handler
   */
  public List<ModelsArchiveLeaderboardSignedURLResponse> getArchivedLeaderboardRankingDataV1Handler(
      GetArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentMonthLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentMonthLeaderboardRankingPublicV1(
      GetCurrentMonthLeaderboardRankingPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentSeasonLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentSeasonLeaderboardRankingPublicV1(
      GetCurrentSeasonLeaderboardRankingPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTodayLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getTodayLeaderboardRankingPublicV1(
      GetTodayLeaderboardRankingPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingPublicV1
   */
  public ModelsUserRankingResponse getUserRankingPublicV1(GetUserRankingPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingPublicV1
   */
  public void deleteUserRankingPublicV1(DeleteUserRankingPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentWeekLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentWeekLeaderboardRankingPublicV1(
      GetCurrentWeekLeaderboardRankingPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV2
   */
  public V2GetPublicLeaderboardRankingResponse getAllTimeLeaderboardRankingPublicV2(
      GetAllTimeLeaderboardRankingPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

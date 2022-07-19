/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import java.io.*;
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
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see CreateArchivedLeaderboardRankingDataV1Handler
   */
  public void createArchivedLeaderboardRankingDataV1Handler(
      CreateArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetAllTimeLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getAllTimeLeaderboardRankingAdminV1(
      GetAllTimeLeaderboardRankingAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetCurrentMonthLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentMonthLeaderboardRankingAdminV1(
      GetCurrentMonthLeaderboardRankingAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetCurrentSeasonLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentSeasonLeaderboardRankingAdminV1(
      GetCurrentSeasonLeaderboardRankingAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetTodayLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getTodayLeaderboardRankingAdminV1(
      GetTodayLeaderboardRankingAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetUserRankingAdminV1
   */
  public ModelsUserRankingResponse getUserRankingAdminV1(GetUserRankingAdminV1 input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see UpdateUserPointAdminV1
   */
  public ModelsUpdateUserPointAdminV1Response updateUserPointAdminV1(UpdateUserPointAdminV1 input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see DeleteUserRankingAdminV1
   */
  public void deleteUserRankingAdminV1(DeleteUserRankingAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetCurrentWeekLeaderboardRankingAdminV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentWeekLeaderboardRankingAdminV1(
      GetCurrentWeekLeaderboardRankingAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see DeleteUserRankingsAdminV1
   */
  public void deleteUserRankingsAdminV1(DeleteUserRankingsAdminV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getAllTimeLeaderboardRankingPublicV1(
      GetAllTimeLeaderboardRankingPublicV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetArchivedLeaderboardRankingDataV1Handler
   */
  public List<ModelsArchiveLeaderboardSignedURLResponse> getArchivedLeaderboardRankingDataV1Handler(
      GetArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetCurrentMonthLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentMonthLeaderboardRankingPublicV1(
      GetCurrentMonthLeaderboardRankingPublicV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetCurrentSeasonLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentSeasonLeaderboardRankingPublicV1(
      GetCurrentSeasonLeaderboardRankingPublicV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetTodayLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getTodayLeaderboardRankingPublicV1(
      GetTodayLeaderboardRankingPublicV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetUserRankingPublicV1
   */
  public ModelsUserRankingResponse getUserRankingPublicV1(GetUserRankingPublicV1 input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see DeleteUserRankingPublicV1
   */
  public void deleteUserRankingPublicV1(DeleteUserRankingPublicV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetCurrentWeekLeaderboardRankingPublicV1
   */
  public ModelsGetLeaderboardRankingResp getCurrentWeekLeaderboardRankingPublicV1(
      GetCurrentWeekLeaderboardRankingPublicV1 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV2
   */
  public V2GetPublicLeaderboardRankingResponse getAllTimeLeaderboardRankingPublicV2(
      GetAllTimeLeaderboardRankingPublicV2 input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}

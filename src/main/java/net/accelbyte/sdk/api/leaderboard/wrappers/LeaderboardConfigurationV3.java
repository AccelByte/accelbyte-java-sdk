/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LeaderboardConfigurationV3 {

  private AccelByteSDK sdk;

  public LeaderboardConfigurationV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetLeaderboardConfigurationsAdminV3
   */
  public ModelsGetAllLeaderboardConfigsRespV3 getLeaderboardConfigurationsAdminV3(
      GetLeaderboardConfigurationsAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLeaderboardConfigurationAdminV3
   */
  public ModelsGetLeaderboardConfigRespV3 createLeaderboardConfigurationAdminV3(
      CreateLeaderboardConfigurationAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteBulkLeaderboardConfigurationAdminV3
   */
  public ModelsDeleteBulkLeaderboardsResp deleteBulkLeaderboardConfigurationAdminV3(
      DeleteBulkLeaderboardConfigurationAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationAdminV3
   */
  public ModelsGetLeaderboardConfigRespV3 getLeaderboardConfigurationAdminV3(
      GetLeaderboardConfigurationAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLeaderboardConfigurationAdminV3
   */
  public ModelsGetLeaderboardConfigRespV3 updateLeaderboardConfigurationAdminV3(
      UpdateLeaderboardConfigurationAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteLeaderboardConfigurationAdminV3
   */
  public void deleteLeaderboardConfigurationAdminV3(DeleteLeaderboardConfigurationAdminV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see HardDeleteLeaderboardAdminV3
   */
  public void hardDeleteLeaderboardAdminV3(HardDeleteLeaderboardAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationsPublicV3
   */
  public ModelsGetAllLeaderboardConfigsPublicRespV3 getLeaderboardConfigurationsPublicV3(
      GetLeaderboardConfigurationsPublicV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationPublicV3
   */
  public ModelsGetLeaderboardConfigPublicRespV3 getLeaderboardConfigurationPublicV3(
      GetLeaderboardConfigurationPublicV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

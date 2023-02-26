/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.wrappers;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.operations.global_achievements.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GlobalAchievements {

  private AccelByteSDK sdk;

  public GlobalAchievements(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListGlobalAchievements
   */
  public ModelsPaginatedGlobalAchievementResponse adminListGlobalAchievements(
      AdminListGlobalAchievements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListGlobalAchievementContributors
   */
  public ModelsPaginatedContributorResponse adminListGlobalAchievementContributors(
      AdminListGlobalAchievementContributors input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ResetGlobalAchievement
   */
  public void resetGlobalAchievement(ResetGlobalAchievement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUserContributions
   */
  public ModelsPaginatedUserContributionResponse adminListUserContributions(
      AdminListUserContributions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListGlobalAchievements
   */
  public ModelsPaginatedGlobalAchievementResponse publicListGlobalAchievements(
      PublicListGlobalAchievements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListGlobalAchievementContributors
   */
  public ModelsPaginatedContributorResponse listGlobalAchievementContributors(
      ListGlobalAchievementContributors input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListUserContributions
   */
  public ModelsPaginatedUserContributionResponse listUserContributions(ListUserContributions input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ClaimGlobalAchievementReward
   */
  public void claimGlobalAchievementReward(ClaimGlobalAchievementReward input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

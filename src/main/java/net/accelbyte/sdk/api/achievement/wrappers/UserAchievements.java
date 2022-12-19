/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.wrappers;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.operations.user_achievements.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserAchievements {

  private AccelByteSDK sdk;

  public UserAchievements(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListUserAchievements
   */
  public ModelsPaginatedUserAchievementResponse adminListUserAchievements(
      AdminListUserAchievements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetAchievement
   */
  public void adminResetAchievement(AdminResetAchievement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUnlockAchievement
   */
  public void adminUnlockAchievement(AdminUnlockAchievement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListUserAchievements
   */
  public ModelsPaginatedUserAchievementResponse publicListUserAchievements(
      PublicListUserAchievements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUnlockAchievement
   */
  public void publicUnlockAchievement(PublicUnlockAchievement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

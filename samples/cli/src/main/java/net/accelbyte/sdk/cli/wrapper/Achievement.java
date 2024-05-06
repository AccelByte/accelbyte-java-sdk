/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.achievement.achievements.*;
import net.accelbyte.sdk.cli.api.achievement.anonymization.*;
import net.accelbyte.sdk.cli.api.achievement.global_achievements.*;
import net.accelbyte.sdk.cli.api.achievement.platform_achievement.*;
import net.accelbyte.sdk.cli.api.achievement.tags.*;
import net.accelbyte.sdk.cli.api.achievement.user_achievements.*;
import picocli.CommandLine.Command;

@Command(
    name = "achievement",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminListAchievements.class,
      AdminCreateNewAchievement.class,
      ExportAchievements.class,
      ImportAchievements.class,
      AdminGetAchievement.class,
      AdminUpdateAchievement.class,
      AdminDeleteAchievement.class,
      AdminUpdateAchievementListOrder.class,
      AdminListGlobalAchievements.class,
      AdminListGlobalAchievementContributors.class,
      ResetGlobalAchievement.class,
      BulkCreatePSNEvent.class,
      AdminListTags.class,
      AdminListUserAchievements.class,
      AdminResetAchievement.class,
      AdminUnlockAchievement.class,
      AdminAnonymizeUserAchievement.class,
      AdminListUserContributions.class,
      PublicListAchievements.class,
      PublicGetAchievement.class,
      PublicListGlobalAchievements.class,
      ListGlobalAchievementContributors.class,
      PublicListTags.class,
      PublicListUserAchievements.class,
      PublicUnlockAchievement.class,
      ListUserContributions.class,
      ClaimGlobalAchievementReward.class,
    })
public class Achievement implements Runnable {

  @Override
  public void run() {}
}

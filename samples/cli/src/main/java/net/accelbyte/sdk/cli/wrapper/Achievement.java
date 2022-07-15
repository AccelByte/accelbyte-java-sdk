/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.achievement.achievements.*;
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
      AdminListUserAchievements.class,
      AdminUnlockAchievement.class,
      PublicListAchievements.class,
      PublicGetAchievement.class,
      PublicListUserAchievements.class,
      PublicUnlockAchievement.class,
    })
public class Achievement implements Runnable {

  @Override
  public void run() {}
}

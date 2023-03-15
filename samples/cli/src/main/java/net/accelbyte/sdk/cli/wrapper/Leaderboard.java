/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.leaderboard.anonymization.*;
import net.accelbyte.sdk.cli.api.leaderboard.leaderboard_configuration.*;
import net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data.*;
import net.accelbyte.sdk.cli.api.leaderboard.user_data.*;
import net.accelbyte.sdk.cli.api.leaderboard.user_visibility.*;
import picocli.CommandLine.Command;

@Command(
    name = "leaderboard",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetLeaderboardConfigurationsAdminV1.class,
      CreateLeaderboardConfigurationAdminV1.class,
      AdminGetArchivedLeaderboardRankingDataV1Handler.class,
      CreateArchivedLeaderboardRankingDataV1Handler.class,
      DeleteBulkLeaderboardConfigurationAdminV1.class,
      GetLeaderboardConfigurationAdminV1.class,
      UpdateLeaderboardConfigurationAdminV1.class,
      DeleteLeaderboardConfigurationAdminV1.class,
      GetAllTimeLeaderboardRankingAdminV1.class,
      GetCurrentMonthLeaderboardRankingAdminV1.class,
      GetCurrentSeasonLeaderboardRankingAdminV1.class,
      GetTodayLeaderboardRankingAdminV1.class,
      GetUserRankingAdminV1.class,
      UpdateUserPointAdminV1.class,
      DeleteUserRankingAdminV1.class,
      GetCurrentWeekLeaderboardRankingAdminV1.class,
      DeleteUserRankingsAdminV1.class,
      AdminAnonymizeUserLeaderboardAdminV1.class,
      GetUserLeaderboardRankingsAdminV1.class,
      GetLeaderboardConfigurationsPublicV1.class,
      CreateLeaderboardConfigurationPublicV1.class,
      GetAllTimeLeaderboardRankingPublicV1.class,
      GetArchivedLeaderboardRankingDataV1Handler.class,
      GetCurrentMonthLeaderboardRankingPublicV1.class,
      GetCurrentSeasonLeaderboardRankingPublicV1.class,
      GetTodayLeaderboardRankingPublicV1.class,
      GetUserRankingPublicV1.class,
      DeleteUserRankingPublicV1.class,
      GetCurrentWeekLeaderboardRankingPublicV1.class,
      GetHiddenUsersV2.class,
      GetUserVisibilityStatusV2.class,
      SetUserLeaderboardVisibilityStatusV2.class,
      SetUserVisibilityStatusV2.class,
      GetLeaderboardConfigurationsPublicV2.class,
      GetAllTimeLeaderboardRankingPublicV2.class,
    })
public class Leaderboard implements Runnable {

  @Override
  public void run() {}
}

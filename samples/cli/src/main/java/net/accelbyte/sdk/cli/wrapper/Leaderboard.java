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
import net.accelbyte.sdk.cli.api.leaderboard.leaderboard_configuration_v3.*;
import net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data.*;
import net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data_v3.*;
import net.accelbyte.sdk.cli.api.leaderboard.user_data.*;
import net.accelbyte.sdk.cli.api.leaderboard.user_data_v3.*;
import net.accelbyte.sdk.cli.api.leaderboard.user_visibility.*;
import net.accelbyte.sdk.cli.api.leaderboard.user_visibility_v3.*;
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
      HardDeleteLeaderboardAdminV1.class,
      GetCurrentMonthLeaderboardRankingAdminV1.class,
      DeleteUserRankingByLeaderboardCodeAdminV1.class,
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
      GetLeaderboardConfigurationsAdminV3.class,
      CreateLeaderboardConfigurationAdminV3.class,
      DeleteBulkLeaderboardConfigurationAdminV3.class,
      GetLeaderboardConfigurationAdminV3.class,
      UpdateLeaderboardConfigurationAdminV3.class,
      DeleteLeaderboardConfigurationAdminV3.class,
      GetAllTimeLeaderboardRankingAdminV3.class,
      GetCurrentCycleLeaderboardRankingAdminV3.class,
      HardDeleteLeaderboardAdminV3.class,
      DeleteUserRankingByLeaderboardCodeAdminV3.class,
      GetHiddenUsersV3.class,
      GetUserRankingAdminV3.class,
      DeleteUserRankingAdminV3.class,
      GetUserVisibilityStatusV3.class,
      SetUserLeaderboardVisibilityV3.class,
      DeleteUserRankingsAdminV3.class,
      GetUserLeaderboardRankingsAdminV3.class,
      SetUserVisibilityV3.class,
      GetLeaderboardConfigurationsPublicV3.class,
      GetLeaderboardConfigurationPublicV3.class,
      GetAllTimeLeaderboardRankingPublicV3.class,
      GetCurrentCycleLeaderboardRankingPublicV3.class,
      BulkGetUsersRankingPublicV3.class,
      GetUserRankingPublicV3.class,
    })
public class Leaderboard implements Runnable {

  @Override
  public void run() {}
}

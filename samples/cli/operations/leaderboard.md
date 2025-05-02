## Java Extend SDK CLI Sample App Operation Index for Leaderboard service

### Operation GetLeaderboardConfigurationsAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsAdminV1 \
    --namespace <namespace value> \
    --isArchived <isArchived value - optional> \
    --isDeleted <isDeleted value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateLeaderboardConfigurationAdminV1

```sh
$ build/install/cli/bin/cli leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetArchivedLeaderboardRankingDataV1Handler

```sh
$ build/install/cli/bin/cli leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace <namespace value> \
    --slug <slug value - optional> \
    --leaderboardCodes <leaderboardCodes value>
```

### Operation CreateArchivedLeaderboardRankingDataV1Handler

```sh
$ build/install/cli/bin/cli leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteBulkLeaderboardConfigurationAdminV1

```sh
$ build/install/cli/bin/cli leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetLeaderboardConfigurationAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation UpdateLeaderboardConfigurationAdminV1

```sh
$ build/install/cli/bin/cli leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteLeaderboardConfigurationAdminV1

```sh
$ build/install/cli/bin/cli leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation GetAllTimeLeaderboardRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation HardDeleteLeaderboardAdminV1

```sh
$ build/install/cli/bin/cli leaderboard hardDeleteLeaderboardAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation GetCurrentMonthLeaderboardRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation DeleteUserRankingByLeaderboardCodeAdminV1

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingByLeaderboardCodeAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation GetCurrentSeasonLeaderboardRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetTodayLeaderboardRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetUserRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getUserRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --previousVersion <previousVersion value - optional>
```

### Operation UpdateUserPointAdminV1

```sh
$ build/install/cli/bin/cli leaderboard updateUserPointAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteUserRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetCurrentWeekLeaderboardRankingAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation DeleteUserRankingsAdminV1

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingsAdminV1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --leaderboardCode <leaderboardCode value>
```

### Operation AdminAnonymizeUserLeaderboardAdminV1

```sh
$ build/install/cli/bin/cli leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetUserLeaderboardRankingsAdminV1

```sh
$ build/install/cli/bin/cli leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetLeaderboardConfigurationsPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace <namespace value> \
    --isArchived <isArchived value - optional> \
    --isDeleted <isDeleted value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateLeaderboardConfigurationPublicV1

```sh
$ build/install/cli/bin/cli leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetAllTimeLeaderboardRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetArchivedLeaderboardRankingDataV1Handler

```sh
$ build/install/cli/bin/cli leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --slug <slug value - optional> \
    --leaderboardCodes <leaderboardCodes value>
```

### Operation GetCurrentMonthLeaderboardRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetCurrentSeasonLeaderboardRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetTodayLeaderboardRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetUserRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getUserRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --previousVersion <previousVersion value - optional>
```

### Operation DeleteUserRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetCurrentWeekLeaderboardRankingPublicV1

```sh
$ build/install/cli/bin/cli leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation GetHiddenUsersV2

```sh
$ build/install/cli/bin/cli leaderboard getHiddenUsersV2 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserVisibilityStatusV2

```sh
$ build/install/cli/bin/cli leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation SetUserLeaderboardVisibilityStatusV2

```sh
$ build/install/cli/bin/cli leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SetUserVisibilityStatusV2

```sh
$ build/install/cli/bin/cli leaderboard setUserVisibilityStatusV2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetLeaderboardConfigurationsPublicV2

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetAllTimeLeaderboardRankingPublicV2

```sh
$ build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetLeaderboardConfigurationsAdminV3

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsAdminV3 \
    --namespace <namespace value> \
    --isDeleted <isDeleted value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateLeaderboardConfigurationAdminV3

```sh
$ build/install/cli/bin/cli leaderboard createLeaderboardConfigurationAdminV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteBulkLeaderboardConfigurationAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteBulkLeaderboardConfigurationAdminV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetLeaderboardConfigurationAdminV3

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation UpdateLeaderboardConfigurationAdminV3

```sh
$ build/install/cli/bin/cli leaderboard updateLeaderboardConfigurationAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteLeaderboardConfigurationAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteLeaderboardConfigurationAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation GetAllTimeLeaderboardRankingAdminV3

```sh
$ build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetCurrentCycleLeaderboardRankingAdminV3

```sh
$ build/install/cli/bin/cli leaderboard getCurrentCycleLeaderboardRankingAdminV3 \
    --cycleId <cycleId value> \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation DeleteAllUserRankingByCycleIdAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteAllUserRankingByCycleIdAdminV3 \
    --cycleId <cycleId value> \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation DeleteUserRankingByCycleIdAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingByCycleIdAdminV3 \
    --cycleId <cycleId value> \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation HardDeleteLeaderboardAdminV3

```sh
$ build/install/cli/bin/cli leaderboard hardDeleteLeaderboardAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation DeleteUserRankingByLeaderboardCodeAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingByLeaderboardCodeAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation GetHiddenUsersV3

```sh
$ build/install/cli/bin/cli leaderboard getHiddenUsersV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserRankingAdminV3

```sh
$ build/install/cli/bin/cli leaderboard getUserRankingAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --previousVersion <previousVersion value - optional>
```

### Operation DeleteUserRankingAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingAdminV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetUserVisibilityStatusV3

```sh
$ build/install/cli/bin/cli leaderboard getUserVisibilityStatusV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation SetUserLeaderboardVisibilityV3

```sh
$ build/install/cli/bin/cli leaderboard setUserLeaderboardVisibilityV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteUserRankingsAdminV3

```sh
$ build/install/cli/bin/cli leaderboard deleteUserRankingsAdminV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --leaderboardCode <leaderboardCode value>
```

### Operation GetUserLeaderboardRankingsAdminV3

```sh
$ build/install/cli/bin/cli leaderboard getUserLeaderboardRankingsAdminV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation SetUserVisibilityV3

```sh
$ build/install/cli/bin/cli leaderboard setUserVisibilityV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetLeaderboardConfigurationsPublicV3

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsPublicV3 \
    --namespace <namespace value> \
    --isDeleted <isDeleted value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetLeaderboardConfigurationPublicV3

```sh
$ build/install/cli/bin/cli leaderboard getLeaderboardConfigurationPublicV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value>
```

### Operation GetAllTimeLeaderboardRankingPublicV3

```sh
$ build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingPublicV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetCurrentCycleLeaderboardRankingPublicV3

```sh
$ build/install/cli/bin/cli leaderboard getCurrentCycleLeaderboardRankingPublicV3 \
    --cycleId <cycleId value> \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --previousVersion <previousVersion value - optional>
```

### Operation BulkGetUsersRankingPublicV3

```sh
$ build/install/cli/bin/cli leaderboard bulkGetUsersRankingPublicV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --previousVersion <previousVersion value - optional> \
    --body <json string for request body>
```

### Operation GetUserRankingPublicV3

```sh
$ build/install/cli/bin/cli leaderboard getUserRankingPublicV3 \
    --leaderboardCode <leaderboardCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --previousVersion <previousVersion value - optional>
```


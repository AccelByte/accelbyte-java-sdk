<a name="v0.26.0"></a>
## [v0.26.0] - 2022-12-20

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. In achievement service, some operations are moved to different namespace due to OpenAPI spec tag renaming.

    - net.accelbyte.sdk.api.achievement.operations.{achievements -> user_achievements}.AdminListUserAchievements
    - net.accelbyte.sdk.api.achievement.operations.{achievements -> user_achievements}.AdminResetAchievement
    - net.accelbyte.sdk.api.achievement.operations.{achievements -> user_achievements}.AdminUnlockAchievement
    - net.accelbyte.sdk.api.achievement.operations.{achievements -> user_achievements}.PublicListUserAchievements
    - net.accelbyte.sdk.api.achievement.operations.{achievements -> user_achievements}.PublicUnlockAchievement

2. An operation and its model are moved from DSMC service to DSLogManager service.

    - net.accelbyte.sdk.api.{dsmc -> dslogmanager}.models.ModelsServerLogs
    - net.accelbyte.sdk.api.{dsmc -> dslogmanager}.operations.admin.GetServerLogs

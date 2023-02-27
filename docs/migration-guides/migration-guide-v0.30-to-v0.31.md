<a name="v0.31.0"></a>
## [v0.31.0] - 2023-2-28

### BREAKING CHANGE

Following changes in OpenAPI spec:

1. Achievement

   - In `net.accelbyte.sdk.api.achievement.operations.global_achievements.PublicListGlobalAchievements`
     - The property `achievementCode` has been renamed to `achievementCodes`

2. Group

   - The following models are renamed     
     - `net.accelbyte.sdk.api.group.models.{ModelsPublicGetGroupListRequestV2 -> ModelsGetGroupListRequestV2}`

3. Lobby

   - The following operations are moved to a different package and the corresponding wrapper methods follows.
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.CreateTemplate`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.DeleteTemplateLocalization`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.DeleteTemplateSlug`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.FreeFormNotification`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.GetGameTemplate`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.GetLocalizationTemplate`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.etSlugTemplate`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.NotificationWithTemplate`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.PublishTemplate`
     - `net.accelbyte.sdk.api.lobby.operations.{notification -> admin}.UpdateLocalizationTemplate`

4. Platform

   - The following models are renamed
     - `net.accelbyte.sdk.api.platform.models.{AvailablePredicateObject -> AvailablePredicate}`
     - `net.accelbyte.sdk.api.platform.models.{ADTOObjectForUnlockSteamAchievementAPI -> SteamAchievementUpdateRequest}`
     - `net.accelbyte.sdk.api.platform.models.{ADTOObjectForUpdateXboxAchievementCompletePercentageAPI -> XblAchievementUpdateRequest}`
     - `net.accelbyte.sdk.api.platform.models.{ADTOObjectForQueryingXboxUserAchievements -> XblUserAchievements}`

5. Social

   - The following models are renamed
     - `net.accelbyte.sdk.api.social.models.{BulkStatItemOperationResult -> BulkStatOperationResult}`


     

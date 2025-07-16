## Java Extend SDK CLI Sample App Operation Index for Lobby service

### Operation GetUserFriendsUpdated

```sh
$ build/install/cli/bin/cli lobby getUserFriendsUpdated \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserIncomingFriends

```sh
$ build/install/cli/bin/cli lobby getUserIncomingFriends \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserIncomingFriendsWithTime

```sh
$ build/install/cli/bin/cli lobby getUserIncomingFriendsWithTime \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserOutgoingFriends

```sh
$ build/install/cli/bin/cli lobby getUserOutgoingFriends \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserOutgoingFriendsWithTime

```sh
$ build/install/cli/bin/cli lobby getUserOutgoingFriendsWithTime \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserFriendsWithPlatform

```sh
$ build/install/cli/bin/cli lobby getUserFriendsWithPlatform \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation UserRequestFriend

```sh
$ build/install/cli/bin/cli lobby userRequestFriend \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UserAcceptFriendRequest

```sh
$ build/install/cli/bin/cli lobby userAcceptFriendRequest \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UserCancelFriendRequest

```sh
$ build/install/cli/bin/cli lobby userCancelFriendRequest \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UserRejectFriendRequest

```sh
$ build/install/cli/bin/cli lobby userRejectFriendRequest \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UserGetFriendshipStatus

```sh
$ build/install/cli/bin/cli lobby userGetFriendshipStatus \
    --friendId <friendId value> \
    --namespace <namespace value>
```

### Operation UserUnfriendRequest

```sh
$ build/install/cli/bin/cli lobby userUnfriendRequest \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AddFriendsWithoutConfirmation

```sh
$ build/install/cli/bin/cli lobby addFriendsWithoutConfirmation \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkDeleteFriends

```sh
$ build/install/cli/bin/cli lobby bulkDeleteFriends \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncNativeFriends

```sh
$ build/install/cli/bin/cli lobby syncNativeFriends \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SyncNativeBlockedUser

```sh
$ build/install/cli/bin/cli lobby syncNativeBlockedUser \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetAllConfigV1

```sh
$ build/install/cli/bin/cli lobby adminGetAllConfigV1
```

### Operation AdminGetLogConfig

```sh
$ build/install/cli/bin/cli lobby adminGetLogConfig
```

### Operation AdminPatchUpdateLogConfig

```sh
$ build/install/cli/bin/cli lobby adminPatchUpdateLogConfig \
    --body <json string for request body>
```

### Operation AdminGetConfigV1

```sh
$ build/install/cli/bin/cli lobby adminGetConfigV1 \
    --namespace <namespace value>
```

### Operation AdminUpdateConfigV1

```sh
$ build/install/cli/bin/cli lobby adminUpdateConfigV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminExportConfigV1

```sh
$ build/install/cli/bin/cli lobby adminExportConfigV1 \
    --namespace <namespace value>
```

### Operation AdminImportConfigV1

```sh
$ build/install/cli/bin/cli lobby adminImportConfigV1 \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation GetListOfFriends

```sh
$ build/install/cli/bin/cli lobby getListOfFriends \
    --namespace <namespace value> \
    --userId <userId value> \
    --friendId <friendId value - optional> \
    --friendIds <friendIds value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetIncomingFriendRequests

```sh
$ build/install/cli/bin/cli lobby getIncomingFriendRequests \
    --namespace <namespace value> \
    --userId <userId value> \
    --friendId <friendId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminListFriendsOfFriends

```sh
$ build/install/cli/bin/cli lobby adminListFriendsOfFriends \
    --namespace <namespace value> \
    --userId <userId value> \
    --friendId <friendId value - optional> \
    --limit <limit value - optional> \
    --nopaging <nopaging value - optional> \
    --offset <offset value - optional>
```

### Operation GetOutgoingFriendRequests

```sh
$ build/install/cli/bin/cli lobby getOutgoingFriendRequests \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation SendMultipleUsersFreeformNotificationV1Admin

```sh
$ build/install/cli/bin/cli lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SendUsersFreeformNotificationV1Admin

```sh
$ build/install/cli/bin/cli lobby sendUsersFreeformNotificationV1Admin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetAllNotificationTemplatesV1Admin

```sh
$ build/install/cli/bin/cli lobby getAllNotificationTemplatesV1Admin \
    --namespace <namespace value>
```

### Operation CreateNotificationTemplateV1Admin

```sh
$ build/install/cli/bin/cli lobby createNotificationTemplateV1Admin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SendUsersTemplatedNotificationV1Admin

```sh
$ build/install/cli/bin/cli lobby sendUsersTemplatedNotificationV1Admin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetTemplateSlugLocalizationsTemplateV1Admin

```sh
$ build/install/cli/bin/cli lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace <namespace value> \
    --templateSlug <templateSlug value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation DeleteNotificationTemplateSlugV1Admin

```sh
$ build/install/cli/bin/cli lobby deleteNotificationTemplateSlugV1Admin \
    --namespace <namespace value> \
    --templateSlug <templateSlug value>
```

### Operation GetSingleTemplateLocalizationV1Admin

```sh
$ build/install/cli/bin/cli lobby getSingleTemplateLocalizationV1Admin \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value>
```

### Operation UpdateTemplateLocalizationV1Admin

```sh
$ build/install/cli/bin/cli lobby updateTemplateLocalizationV1Admin \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value> \
    --body <json string for request body>
```

### Operation DeleteTemplateLocalizationV1Admin

```sh
$ build/install/cli/bin/cli lobby deleteTemplateLocalizationV1Admin \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value>
```

### Operation PublishTemplateLocalizationV1Admin

```sh
$ build/install/cli/bin/cli lobby publishTemplateLocalizationV1Admin \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value>
```

### Operation GetAllNotificationTopicsV1Admin

```sh
$ build/install/cli/bin/cli lobby getAllNotificationTopicsV1Admin \
    --namespace <namespace value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation CreateNotificationTopicV1Admin

```sh
$ build/install/cli/bin/cli lobby createNotificationTopicV1Admin \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetNotificationTopicV1Admin

```sh
$ build/install/cli/bin/cli lobby getNotificationTopicV1Admin \
    --namespace <namespace value> \
    --topicName <topicName value>
```

### Operation UpdateNotificationTopicV1Admin

```sh
$ build/install/cli/bin/cli lobby updateNotificationTopicV1Admin \
    --namespace <namespace value> \
    --topicName <topicName value> \
    --body <json string for request body>
```

### Operation DeleteNotificationTopicV1Admin

```sh
$ build/install/cli/bin/cli lobby deleteNotificationTopicV1Admin \
    --namespace <namespace value> \
    --topicName <topicName value>
```

### Operation SendSpecificUserFreeformNotificationV1Admin

```sh
$ build/install/cli/bin/cli lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SendSpecificUserTemplatedNotificationV1Admin

```sh
$ build/install/cli/bin/cli lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetLobbyCCU

```sh
$ build/install/cli/bin/cli lobby adminGetLobbyCCU \
    --namespace <namespace value>
```

### Operation AdminGetBulkPlayerBlockedPlayersV1

```sh
$ build/install/cli/bin/cli lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetPlayerBlockedPlayersV1

```sh
$ build/install/cli/bin/cli lobby adminGetPlayerBlockedPlayersV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetPlayerBlockedByPlayersV1

```sh
$ build/install/cli/bin/cli lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminBulkBlockPlayersV1

```sh
$ build/install/cli/bin/cli lobby adminBulkBlockPlayersV1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminBulkUnblockPlayersV1

```sh
$ build/install/cli/bin/cli lobby adminBulkUnblockPlayersV1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetMessages

```sh
$ build/install/cli/bin/cli lobby publicGetMessages
```

### Operation PublicPlayerBlockPlayersV1

```sh
$ build/install/cli/bin/cli lobby publicPlayerBlockPlayersV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetPlayerBlockedPlayersV1

```sh
$ build/install/cli/bin/cli lobby publicGetPlayerBlockedPlayersV1 \
    --namespace <namespace value>
```

### Operation PublicGetPlayerBlockedByPlayersV1

```sh
$ build/install/cli/bin/cli lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace <namespace value>
```

### Operation PublicUnblockPlayerV1

```sh
$ build/install/cli/bin/cli lobby publicUnblockPlayerV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UsersPresenceHandlerV1

```sh
$ build/install/cli/bin/cli lobby usersPresenceHandlerV1 \
    --namespace <namespace value> \
    --countOnly <countOnly value - optional> \
    --userIds <userIds value>
```

### Operation UsersPresenceHandlerV2

```sh
$ build/install/cli/bin/cli lobby usersPresenceHandlerV2 \
    --namespace <namespace value> \
    --countOnly <countOnly value - optional> \
    --body <json string for request body>
```

### Operation FreeFormNotification

```sh
$ build/install/cli/bin/cli lobby freeFormNotification \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetMyNotifications

```sh
$ build/install/cli/bin/cli lobby getMyNotifications \
    --namespace <namespace value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startTime <startTime value - optional>
```

### Operation GetMyOfflineNotifications

```sh
$ build/install/cli/bin/cli lobby getMyOfflineNotifications \
    --namespace <namespace value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startTime <startTime value - optional>
```

### Operation NotificationWithTemplate

```sh
$ build/install/cli/bin/cli lobby notificationWithTemplate \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetGameTemplate

```sh
$ build/install/cli/bin/cli lobby getGameTemplate \
    --namespace <namespace value>
```

### Operation CreateTemplate

```sh
$ build/install/cli/bin/cli lobby createTemplate \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSlugTemplate

```sh
$ build/install/cli/bin/cli lobby getSlugTemplate \
    --namespace <namespace value> \
    --templateSlug <templateSlug value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation DeleteTemplateSlug

```sh
$ build/install/cli/bin/cli lobby deleteTemplateSlug \
    --namespace <namespace value> \
    --templateSlug <templateSlug value>
```

### Operation GetLocalizationTemplate

```sh
$ build/install/cli/bin/cli lobby getLocalizationTemplate \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value>
```

### Operation UpdateLocalizationTemplate

```sh
$ build/install/cli/bin/cli lobby updateLocalizationTemplate \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value> \
    --body <json string for request body>
```

### Operation DeleteTemplateLocalization

```sh
$ build/install/cli/bin/cli lobby deleteTemplateLocalization \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value>
```

### Operation PublishTemplate

```sh
$ build/install/cli/bin/cli lobby publishTemplate \
    --namespace <namespace value> \
    --templateLanguage <templateLanguage value> \
    --templateSlug <templateSlug value>
```

### Operation GetTopicByNamespace

```sh
$ build/install/cli/bin/cli lobby getTopicByNamespace \
    --namespace <namespace value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation CreateTopic

```sh
$ build/install/cli/bin/cli lobby createTopic \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetTopicByTopicName

```sh
$ build/install/cli/bin/cli lobby getTopicByTopicName \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation UpdateTopicByTopicName

```sh
$ build/install/cli/bin/cli lobby updateTopicByTopicName \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation DeleteTopicByTopicName

```sh
$ build/install/cli/bin/cli lobby deleteTopicByTopicName \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation FreeFormNotificationByUserID

```sh
$ build/install/cli/bin/cli lobby freeFormNotificationByUserID \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation NotificationWithTemplateByUserID

```sh
$ build/install/cli/bin/cli lobby notificationWithTemplateByUserID \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```


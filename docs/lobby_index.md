# Lobby Service Index

&nbsp;  

## Operations

### friends Wrapper:  [Friends](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Friends.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/friends/namespaces/{namespace}/me` | GET | GetUserFriendsUpdated | [GetUserFriendsUpdated](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/GetUserFriendsUpdated.java) |
| `/friends/namespaces/{namespace}/me/incoming` | GET | GetUserIncomingFriends | [GetUserIncomingFriends](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/GetUserIncomingFriends.java) |
| `/friends/namespaces/{namespace}/me/outgoing` | GET | GetUserOutgoingFriends | [GetUserOutgoingFriends](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/GetUserOutgoingFriends.java) |
| `/friends/namespaces/{namespace}/me/request` | POST | UserRequestFriend | [UserRequestFriend](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/UserRequestFriend.java) |
| `/friends/namespaces/{namespace}/me/request/accept` | POST | UserAcceptFriendRequest | [UserAcceptFriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/UserAcceptFriendRequest.java) |
| `/friends/namespaces/{namespace}/me/request/cancel` | POST | UserCancelFriendRequest | [UserCancelFriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/UserCancelFriendRequest.java) |
| `/friends/namespaces/{namespace}/me/request/reject` | POST | UserRejectFriendRequest | [UserRejectFriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/UserRejectFriendRequest.java) |
| `/friends/namespaces/{namespace}/me/status/{friendId}` | GET | UserGetFriendshipStatus | [UserGetFriendshipStatus](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/UserGetFriendshipStatus.java) |
| `/friends/namespaces/{namespace}/me/unfriend` | POST | UserUnfriendRequest | [UserUnfriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/UserUnfriendRequest.java) |
| `/friends/namespaces/{namespace}/users/{userId}/add/bulk` | POST | AddFriendsWithoutConfirmation | [AddFriendsWithoutConfirmation](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/AddFriendsWithoutConfirmation.java) |
| `/lobby/v1/admin/friend/namespaces/{namespace}/users/{userId}` | GET | GetListOfFriends | [GetListOfFriends](../src/main/java/net/accelbyte/sdk/api/lobby/operations/friends/GetListOfFriends.java) |

### chat Wrapper:  [Chat](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Chat.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/chat/namespaces/{namespace}/users/{userId}/friend/{friendId}` | GET | PersonalChatHistory | [PersonalChatHistory](../src/main/java/net/accelbyte/sdk/api/lobby/operations/chat/PersonalChatHistory.java) |
| `/lobby/v1/admin/chat/namespaces/{namespace}/users/{userId}/friends/{friendId}` | GET | AdminChatHistory | [AdminChatHistory](../src/main/java/net/accelbyte/sdk/api/lobby/operations/chat/AdminChatHistory.java) |
| `/lobby/v1/public/chat/namespaces/{namespace}/users/me/friends/{friendId}` | GET | GetPersonalChatHistoryV1Public | [GetPersonalChatHistoryV1Public](../src/main/java/net/accelbyte/sdk/api/lobby/operations/chat/GetPersonalChatHistoryV1Public.java) |

### config Wrapper:  [Config](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Config.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/config` | GET | AdminGetAllConfigV1 | [AdminGetAllConfigV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/config/AdminGetAllConfigV1.java) |
| `/lobby/v1/admin/config/namespaces/{namespace}` | GET | AdminGetConfigV1 | [AdminGetConfigV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/config/AdminGetConfigV1.java) |
| `/lobby/v1/admin/config/namespaces/{namespace}` | PUT | AdminUpdateConfigV1 | [AdminUpdateConfigV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/config/AdminUpdateConfigV1.java) |
| `/lobby/v1/admin/config/namespaces/{namespace}/export` | GET | AdminExportConfigV1 | [AdminExportConfigV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/config/AdminExportConfigV1.java) |
| `/lobby/v1/admin/config/namespaces/{namespace}/import` | POST | AdminImportConfigV1 | [AdminImportConfigV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/config/AdminImportConfigV1.java) |

### notification Wrapper:  [Notification](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Notification.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/notification/namespaces/{namespace}/bulkUsers/freeform/notify` | POST | SendMultipleUsersFreeformNotificationV1Admin | [SendMultipleUsersFreeformNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendMultipleUsersFreeformNotificationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/freeform/notify` | POST | SendUsersFreeformNotificationV1Admin | [SendUsersFreeformNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendUsersFreeformNotificationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/parties/{partyId}/freeform/notify` | POST | SendPartyFreeformNotificationV1Admin | [SendPartyFreeformNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendPartyFreeformNotificationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/parties/{partyId}/templates/notify` | POST | SendPartyTemplatedNotificationV1Admin | [SendPartyTemplatedNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendPartyTemplatedNotificationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates` | GET | GetAllNotificationTemplatesV1Admin | [GetAllNotificationTemplatesV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetAllNotificationTemplatesV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates` | POST | CreateNotificationTemplateV1Admin | [CreateNotificationTemplateV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/CreateNotificationTemplateV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/notify` | POST | SendUsersTemplatedNotificationV1Admin | [SendUsersTemplatedNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendUsersTemplatedNotificationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/{templateSlug}` | GET | GetTemplateSlugLocalizationsTemplateV1Admin | [GetTemplateSlugLocalizationsTemplateV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetTemplateSlugLocalizationsTemplateV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/{templateSlug}` | DELETE | DeleteNotificationTemplateSlugV1Admin | [DeleteNotificationTemplateSlugV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/DeleteNotificationTemplateSlugV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}` | GET | GetSingleTemplateLocalizationV1Admin | [GetSingleTemplateLocalizationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetSingleTemplateLocalizationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}` | PUT | UpdateTemplateLocalizationV1Admin | [UpdateTemplateLocalizationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/UpdateTemplateLocalizationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}` | DELETE | DeleteTemplateLocalizationV1Admin | [DeleteTemplateLocalizationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/DeleteTemplateLocalizationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}/publish` | POST | PublishTemplateLocalizationV1Admin | [PublishTemplateLocalizationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/PublishTemplateLocalizationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/topics` | GET | GetAllNotificationTopicsV1Admin | [GetAllNotificationTopicsV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetAllNotificationTopicsV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/topics` | POST | CreateNotificationTopicV1Admin | [CreateNotificationTopicV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/CreateNotificationTopicV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/topics/{topicName}` | GET | GetNotificationTopicV1Admin | [GetNotificationTopicV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetNotificationTopicV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/topics/{topicName}` | PUT | UpdateNotificationTopicV1Admin | [UpdateNotificationTopicV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/UpdateNotificationTopicV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/topics/{topicName}` | DELETE | DeleteNotificationTopicV1Admin | [DeleteNotificationTopicV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/DeleteNotificationTopicV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/users/{userId}/freeform/notify` | POST | SendSpecificUserFreeformNotificationV1Admin | [SendSpecificUserFreeformNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendSpecificUserFreeformNotificationV1Admin.java) |
| `/lobby/v1/admin/notification/namespaces/{namespace}/users/{userId}/templates/notify` | POST | SendSpecificUserTemplatedNotificationV1Admin | [SendSpecificUserTemplatedNotificationV1Admin](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/SendSpecificUserTemplatedNotificationV1Admin.java) |
| `/notification/namespaces/{namespace}/freeform` | POST | FreeFormNotification | [FreeFormNotification](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/FreeFormNotification.java) |
| `/notification/namespaces/{namespace}/templated` | POST | NotificationWithTemplate | [NotificationWithTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/NotificationWithTemplate.java) |
| `/notification/namespaces/{namespace}/templates` | GET | GetGameTemplate | [GetGameTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetGameTemplate.java) |
| `/notification/namespaces/{namespace}/templates` | POST | CreateTemplate | [CreateTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/CreateTemplate.java) |
| `/notification/namespaces/{namespace}/templates/{templateSlug}` | GET | GetSlugTemplate | [GetSlugTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetSlugTemplate.java) |
| `/notification/namespaces/{namespace}/templates/{templateSlug}` | DELETE | DeleteTemplateSlug | [DeleteTemplateSlug](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/DeleteTemplateSlug.java) |
| `/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}` | GET | GetLocalizationTemplate | [GetLocalizationTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetLocalizationTemplate.java) |
| `/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}` | PUT | UpdateLocalizationTemplate | [UpdateLocalizationTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/UpdateLocalizationTemplate.java) |
| `/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}` | DELETE | DeleteTemplateLocalization | [DeleteTemplateLocalization](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/DeleteTemplateLocalization.java) |
| `/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}/publish` | POST | PublishTemplate | [PublishTemplate](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/PublishTemplate.java) |
| `/notification/namespaces/{namespace}/topics` | GET | GetTopicByNamespace | [GetTopicByNamespace](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetTopicByNamespace.java) |
| `/notification/namespaces/{namespace}/topics` | POST | CreateTopic | [CreateTopic](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/CreateTopic.java) |
| `/notification/namespaces/{namespace}/topics/{topic}` | GET | GetTopicByTopicName | [GetTopicByTopicName](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/GetTopicByTopicName.java) |
| `/notification/namespaces/{namespace}/topics/{topic}` | PUT | UpdateTopicByTopicName | [UpdateTopicByTopicName](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/UpdateTopicByTopicName.java) |
| `/notification/namespaces/{namespace}/topics/{topic}` | DELETE | DeleteTopicByTopicName | [DeleteTopicByTopicName](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/DeleteTopicByTopicName.java) |
| `/notification/namespaces/{namespace}/users/{userId}/freeform` | POST | FreeFormNotificationByUserID | [FreeFormNotificationByUserID](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/FreeFormNotificationByUserID.java) |
| `/notification/namespaces/{namespace}/users/{userId}/templated` | POST | NotificationWithTemplateByUserID | [NotificationWithTemplateByUserID](../src/main/java/net/accelbyte/sdk/api/lobby/operations/notification/NotificationWithTemplateByUserID.java) |

### party Wrapper:  [Party](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Party.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/party/namespaces/{namespace}/parties/{partyId}` | GET | AdminGetPartyDataV1 | [AdminGetPartyDataV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/party/AdminGetPartyDataV1.java) |
| `/lobby/v1/admin/party/namespaces/{namespace}/users/{userId}/party` | GET | AdminGetUserPartyV1 | [AdminGetUserPartyV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/party/AdminGetUserPartyV1.java) |
| `/lobby/v1/public/party/namespaces/{namespace}/parties/{partyId}` | GET | PublicGetPartyDataV1 | [PublicGetPartyDataV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/party/PublicGetPartyDataV1.java) |
| `/lobby/v1/public/party/namespaces/{namespace}/parties/{partyId}/attributes` | PUT | PublicUpdatePartyAttributesV1 | [PublicUpdatePartyAttributesV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/party/PublicUpdatePartyAttributesV1.java) |

### Operations Wrapper:  [Operations](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Operations.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/party/namespaces/{namespace}/parties/{partyId}/attributes` | PUT | AdminUpdatePartyAttributesV1 | [AdminUpdatePartyAttributesV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/operations/AdminUpdatePartyAttributesV1.java) |
| `/lobby/v1/admin/party/namespaces/{namespace}/parties/{partyId}/join/{userId}` | POST | AdminJoinPartyV1 | [AdminJoinPartyV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/operations/AdminJoinPartyV1.java) |
| `/lobby/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../src/main/java/net/accelbyte/sdk/api/lobby/operations/operations/PublicGetMessages.java) |

### player Wrapper:  [Player](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Player.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/player/namespaces/{namespace}/ccu` | GET | AdminGetLobbyCCU | [AdminGetLobbyCCU](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminGetLobbyCCU.java) |
| `/lobby/v1/admin/player/namespaces/{namespace}/users/{userId}/attributes` | GET | AdminGetAllPlayerSessionAttribute | [AdminGetAllPlayerSessionAttribute](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminGetAllPlayerSessionAttribute.java) |
| `/lobby/v1/admin/player/namespaces/{namespace}/users/{userId}/attributes` | PUT | AdminSetPlayerSessionAttribute | [AdminSetPlayerSessionAttribute](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminSetPlayerSessionAttribute.java) |
| `/lobby/v1/admin/player/namespaces/{namespace}/users/{userId}/attributes/{attribute}` | GET | AdminGetPlayerSessionAttribute | [AdminGetPlayerSessionAttribute](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminGetPlayerSessionAttribute.java) |
| `/lobby/v1/admin/player/namespaces/{namespace}/users/{userId}/blocked` | GET | AdminGetPlayerBlockedPlayersV1 | [AdminGetPlayerBlockedPlayersV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminGetPlayerBlockedPlayersV1.java) |
| `/lobby/v1/admin/player/namespaces/{namespace}/users/{userId}/blocked-by` | GET | AdminGetPlayerBlockedByPlayersV1 | [AdminGetPlayerBlockedByPlayersV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminGetPlayerBlockedByPlayersV1.java) |
| `/lobby/v1/admin/player/namespaces/{namespace}/users/{userId}/bulk/block` | POST | AdminBulkBlockPlayersV1 | [AdminBulkBlockPlayersV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/AdminBulkBlockPlayersV1.java) |
| `/lobby/v1/public/player/namespaces/{namespace}/users/me/blocked` | GET | PublicGetPlayerBlockedPlayersV1 | [PublicGetPlayerBlockedPlayersV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/PublicGetPlayerBlockedPlayersV1.java) |
| `/lobby/v1/public/player/namespaces/{namespace}/users/me/blocked-by` | GET | PublicGetPlayerBlockedByPlayersV1 | [PublicGetPlayerBlockedByPlayersV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/player/PublicGetPlayerBlockedByPlayersV1.java) |

### profanity Wrapper:  [Profanity](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Profanity.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/profanity/namespaces/{namespace}/filters/debug` | POST | AdminDebugProfanityFilters | [AdminDebugProfanityFilters](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminDebugProfanityFilters.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters` | GET | AdminGetProfanityListFiltersV1 | [AdminGetProfanityListFiltersV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminGetProfanityListFiltersV1.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters` | POST | AdminAddProfanityFilterIntoList | [AdminAddProfanityFilterIntoList](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminAddProfanityFilterIntoList.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters/bulk` | POST | AdminAddProfanityFilters | [AdminAddProfanityFilters](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminAddProfanityFilters.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters/bulk-file` | POST | AdminImportProfanityFiltersFromFile | [AdminImportProfanityFiltersFromFile](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminImportProfanityFiltersFromFile.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters/delete` | POST | AdminDeleteProfanityFilter | [AdminDeleteProfanityFilter](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminDeleteProfanityFilter.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/lists` | GET | AdminGetProfanityLists | [AdminGetProfanityLists](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminGetProfanityLists.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/lists` | POST | AdminCreateProfanityList | [AdminCreateProfanityList](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminCreateProfanityList.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/lists/{list}` | POST | AdminUpdateProfanityList | [AdminUpdateProfanityList](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminUpdateProfanityList.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/lists/{list}` | DELETE | AdminDeleteProfanityList | [AdminDeleteProfanityList](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminDeleteProfanityList.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/rule` | GET | AdminGetProfanityRule | [AdminGetProfanityRule](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminGetProfanityRule.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/rule` | POST | AdminSetProfanityRuleForNamespace | [AdminSetProfanityRuleForNamespace](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminSetProfanityRuleForNamespace.java) |
| `/lobby/v1/admin/profanity/namespaces/{namespace}/verify` | POST | AdminVerifyMessageProfanityResponse | [AdminVerifyMessageProfanityResponse](../src/main/java/net/accelbyte/sdk/api/lobby/operations/profanity/AdminVerifyMessageProfanityResponse.java) |

### thirdParty Wrapper:  [ThirdParty](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/ThirdParty.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/admin/thirdparty/namespaces/{namespace}/config/steam` | GET | AdminGetThirdPartyConfig | [AdminGetThirdPartyConfig](../src/main/java/net/accelbyte/sdk/api/lobby/operations/third_party/AdminGetThirdPartyConfig.java) |
| `/lobby/v1/admin/thirdparty/namespaces/{namespace}/config/steam` | PUT | AdminUpdateThirdPartyConfig | [AdminUpdateThirdPartyConfig](../src/main/java/net/accelbyte/sdk/api/lobby/operations/third_party/AdminUpdateThirdPartyConfig.java) |
| `/lobby/v1/admin/thirdparty/namespaces/{namespace}/config/steam` | POST | AdminCreateThirdPartyConfig | [AdminCreateThirdPartyConfig](../src/main/java/net/accelbyte/sdk/api/lobby/operations/third_party/AdminCreateThirdPartyConfig.java) |
| `/lobby/v1/admin/thirdparty/namespaces/{namespace}/config/steam` | DELETE | AdminDeleteThirdPartyConfig | [AdminDeleteThirdPartyConfig](../src/main/java/net/accelbyte/sdk/api/lobby/operations/third_party/AdminDeleteThirdPartyConfig.java) |

### presence Wrapper:  [Presence](../src/main/java/net/accelbyte/sdk/api/lobby/wrappers/Presence.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/lobby/v1/public/presence/namespaces/{namespace}/users/presence` | GET | UsersPresenceHandlerV1 | [UsersPresenceHandlerV1](../src/main/java/net/accelbyte/sdk/api/lobby/operations/presence/UsersPresenceHandlerV1.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `handlers.GetUsersPresenceResponse` | [HandlersGetUsersPresenceResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/HandlersGetUsersPresenceResponse.java) |
| `handlers.UserPresence` | [HandlersUserPresence](../src/main/java/net/accelbyte/sdk/api/lobby/models/HandlersUserPresence.java) |
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../src/main/java/net/accelbyte/sdk/api/lobby/models/LogAppMessageDeclaration.java) |
| `model.BulkAddFriendsRequest` | [ModelBulkAddFriendsRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelBulkAddFriendsRequest.java) |
| `model.BulkUsersFreeFormNotificationRequestV1` | [ModelBulkUsersFreeFormNotificationRequestV1](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelBulkUsersFreeFormNotificationRequestV1.java) |
| `model.ChatMessageResponse` | [ModelChatMessageResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelChatMessageResponse.java) |
| `model.CreateTemplateRequest` | [ModelCreateTemplateRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelCreateTemplateRequest.java) |
| `model.CreateTopicRequest` | [ModelCreateTopicRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelCreateTopicRequest.java) |
| `model.CreateTopicRequestV1` | [ModelCreateTopicRequestV1](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelCreateTopicRequestV1.java) |
| `model.FreeFormNotificationRequest` | [ModelFreeFormNotificationRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelFreeFormNotificationRequest.java) |
| `model.FreeFormNotificationRequestV1` | [ModelFreeFormNotificationRequestV1](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelFreeFormNotificationRequestV1.java) |
| `model.GetAllNotificationTemplateSlugResp` | [ModelGetAllNotificationTemplateSlugResp](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelGetAllNotificationTemplateSlugResp.java) |
| `model.GetAllNotificationTopicsResponse` | [ModelGetAllNotificationTopicsResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelGetAllNotificationTopicsResponse.java) |
| `model.GetFriendsResponse` | [ModelGetFriendsResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelGetFriendsResponse.java) |
| `model.GetUserFriendsResponse` | [ModelGetUserFriendsResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelGetUserFriendsResponse.java) |
| `model.GetUserIncomingFriendsResponse` | [ModelGetUserIncomingFriendsResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelGetUserIncomingFriendsResponse.java) |
| `model.GetUserOutgoingFriendsResponse` | [ModelGetUserOutgoingFriendsResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelGetUserOutgoingFriendsResponse.java) |
| `model.Localization` | [ModelLocalization](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelLocalization.java) |
| `model.NotificationTemplateResponse` | [ModelNotificationTemplateResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelNotificationTemplateResponse.java) |
| `model.NotificationTopicResponse` | [ModelNotificationTopicResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelNotificationTopicResponse.java) |
| `model.NotificationTopicResponseV1` | [ModelNotificationTopicResponseV1](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelNotificationTopicResponseV1.java) |
| `model.NotificationWithTemplateRequest` | [ModelNotificationWithTemplateRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelNotificationWithTemplateRequest.java) |
| `model.NotificationWithTemplateRequestV1` | [ModelNotificationWithTemplateRequestV1](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelNotificationWithTemplateRequestV1.java) |
| `model.Pagination` | [ModelPagination](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelPagination.java) |
| `model.RequestFriendsRequest` | [ModelRequestFriendsRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelRequestFriendsRequest.java) |
| `model.TemplateContent` | [ModelTemplateContent](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelTemplateContent.java) |
| `model.TemplateLocalization` | [ModelTemplateLocalization](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelTemplateLocalization.java) |
| `model.TemplateLocalizationResponse` | [ModelTemplateLocalizationResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelTemplateLocalizationResponse.java) |
| `model.TemplateResponse` | [ModelTemplateResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelTemplateResponse.java) |
| `model.TopicByNamespacesResponse` | [ModelTopicByNamespacesResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelTopicByNamespacesResponse.java) |
| `model.UpdateTemplateRequest` | [ModelUpdateTemplateRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUpdateTemplateRequest.java) |
| `model.UpdateTopicRequest` | [ModelUpdateTopicRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUpdateTopicRequest.java) |
| `model.UserAcceptFriendRequest` | [ModelUserAcceptFriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUserAcceptFriendRequest.java) |
| `model.UserCancelFriendRequest` | [ModelUserCancelFriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUserCancelFriendRequest.java) |
| `model.UserGetFriendshipStatusResponse` | [ModelUserGetFriendshipStatusResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUserGetFriendshipStatusResponse.java) |
| `model.UserRejectFriendRequest` | [ModelUserRejectFriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUserRejectFriendRequest.java) |
| `model.UserUnfriendRequest` | [ModelUserUnfriendRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelUserUnfriendRequest.java) |
| `models.AdminAddProfanityFilterIntoListRequest` | [ModelsAdminAddProfanityFilterIntoListRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminAddProfanityFilterIntoListRequest.java) |
| `models.AdminAddProfanityFiltersFilterRequest` | [ModelsAdminAddProfanityFiltersFilterRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminAddProfanityFiltersFilterRequest.java) |
| `models.AdminAddProfanityFiltersRequest` | [ModelsAdminAddProfanityFiltersRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminAddProfanityFiltersRequest.java) |
| `models.AdminCreateProfanityListRequest` | [ModelsAdminCreateProfanityListRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminCreateProfanityListRequest.java) |
| `models.AdminDeleteProfanityFilterRequest` | [ModelsAdminDeleteProfanityFilterRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminDeleteProfanityFilterRequest.java) |
| `models.AdminGetProfanityListFiltersV1Response` | [ModelsAdminGetProfanityListFiltersV1Response](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminGetProfanityListFiltersV1Response.java) |
| `models.AdminGetProfanityListsListResponse` | [ModelsAdminGetProfanityListsListResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminGetProfanityListsListResponse.java) |
| `models.AdminSetProfanityRuleForNamespaceRequest` | [ModelsAdminSetProfanityRuleForNamespaceRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminSetProfanityRuleForNamespaceRequest.java) |
| `models.AdminUpdateProfanityList` | [ModelsAdminUpdateProfanityList](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminUpdateProfanityList.java) |
| `models.AdminVerifyMessageProfanityRequest` | [ModelsAdminVerifyMessageProfanityRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminVerifyMessageProfanityRequest.java) |
| `models.AdminVerifyMessageProfanityResponse` | [ModelsAdminVerifyMessageProfanityResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsAdminVerifyMessageProfanityResponse.java) |
| `models.BlockedByPlayerData` | [ModelsBlockedByPlayerData](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsBlockedByPlayerData.java) |
| `models.BlockedPlayerData` | [ModelsBlockedPlayerData](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsBlockedPlayerData.java) |
| `models.Config` | [ModelsConfig](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsConfig.java) |
| `models.ConfigExport` | [ModelsConfigExport](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsConfigExport.java) |
| `models.ConfigList` | [ModelsConfigList](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsConfigList.java) |
| `models.ConfigReq` | [ModelsConfigReq](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsConfigReq.java) |
| `models.CreateConfigRequest` | [ModelsCreateConfigRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsCreateConfigRequest.java) |
| `models.CreateConfigResponse` | [ModelsCreateConfigResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsCreateConfigResponse.java) |
| `models.DebugProfanityFilterRequest` | [ModelsDebugProfanityFilterRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsDebugProfanityFilterRequest.java) |
| `models.GetAllPlayerBlockedByUsersResponse` | [ModelsGetAllPlayerBlockedByUsersResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsGetAllPlayerBlockedByUsersResponse.java) |
| `models.GetAllPlayerBlockedUsersResponse` | [ModelsGetAllPlayerBlockedUsersResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsGetAllPlayerBlockedUsersResponse.java) |
| `models.GetAllPlayerSessionAttributeResponse` | [ModelsGetAllPlayerSessionAttributeResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsGetAllPlayerSessionAttributeResponse.java) |
| `models.GetConfigResponse` | [ModelsGetConfigResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsGetConfigResponse.java) |
| `models.GetLobbyCcuResponse` | [ModelsGetLobbyCcuResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsGetLobbyCcuResponse.java) |
| `models.GetPlayerSessionAttributeResponse` | [ModelsGetPlayerSessionAttributeResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsGetPlayerSessionAttributeResponse.java) |
| `models.ImportConfigResponse` | [ModelsImportConfigResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsImportConfigResponse.java) |
| `models.ListBlockedPlayerRequest` | [ModelsListBlockedPlayerRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsListBlockedPlayerRequest.java) |
| `models.PartyData` | [ModelsPartyData](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsPartyData.java) |
| `models.PartyPUTCustomAttributesRequest` | [ModelsPartyPUTCustomAttributesRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsPartyPUTCustomAttributesRequest.java) |
| `models.ProfanityFilter` | [ModelsProfanityFilter](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsProfanityFilter.java) |
| `models.ProfanityRule` | [ModelsProfanityRule](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsProfanityRule.java) |
| `models.SetPlayerSessionAttributeRequest` | [ModelsSetPlayerSessionAttributeRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsSetPlayerSessionAttributeRequest.java) |
| `models.UpdateConfigRequest` | [ModelsUpdateConfigRequest](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsUpdateConfigRequest.java) |
| `models.UpdateConfigResponse` | [ModelsUpdateConfigResponse](../src/main/java/net/accelbyte/sdk/api/lobby/models/ModelsUpdateConfigResponse.java) |
| `response.Error` | [ResponseError](../src/main/java/net/accelbyte/sdk/api/lobby/models/ResponseError.java) |
| `restapi.ErrorResponseBody` | [RestapiErrorResponseBody](../src/main/java/net/accelbyte/sdk/api/lobby/models/RestapiErrorResponseBody.java) |
| `restapi.ErrorResponseV1` | [RestapiErrorResponseV1](../src/main/java/net/accelbyte/sdk/api/lobby/models/RestapiErrorResponseV1.java) |

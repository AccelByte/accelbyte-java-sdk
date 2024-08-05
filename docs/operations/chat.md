# Chat Service Index

&nbsp;  

## Operations

### topic Wrapper:  [Topic](../../src/main/java/net/accelbyte/sdk/api/chat/wrappers/Topic.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/admin/namespaces/{namespace}/chat/filter` | POST | AdminFilterChatMessage | [AdminFilterChatMessage](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminFilterChatMessage.java) | [AdminFilterChatMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminFilterChatMessage.java) |
| `/chat/admin/namespaces/{namespace}/chats` | GET | AdminChatHistory | [AdminChatHistory](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChatHistory.java) | [AdminChatHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChatHistory.java) |
| `/chat/admin/namespaces/{namespace}/namespace-topic` | POST | AdminCreateNamespaceTopic | [AdminCreateNamespaceTopic](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminCreateNamespaceTopic.java) | [AdminCreateNamespaceTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminCreateNamespaceTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic` | GET | AdminTopicList | [AdminTopicList](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicList.java) | [AdminTopicList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicList.java) |
| `/chat/admin/namespaces/{namespace}/topic` | POST | AdminCreateTopic | [AdminCreateTopic](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminCreateTopic.java) | [AdminCreateTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminCreateTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic/channel` | GET | AdminChannelTopicList | [AdminChannelTopicList](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChannelTopicList.java) | [AdminChannelTopicList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChannelTopicList.java) |
| `/chat/admin/namespaces/{namespace}/topic/channel/summary` | GET | AdminChannelTopicSummary | [AdminChannelTopicSummary](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChannelTopicSummary.java) | [AdminChannelTopicSummary](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChannelTopicSummary.java) |
| `/chat/admin/namespaces/{namespace}/topic/log` | GET | AdminQueryTopicLog | [AdminQueryTopicLog](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminQueryTopicLog.java) | [AdminQueryTopicLog](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminQueryTopicLog.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}` | PUT | AdminUpdateTopic | [AdminUpdateTopic](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminUpdateTopic.java) | [AdminUpdateTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminUpdateTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}` | DELETE | AdminDeleteTopic | [AdminDeleteTopic](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminDeleteTopic.java) | [AdminDeleteTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminDeleteTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/ban-members` | POST | AdminBanTopicMembers | [AdminBanTopicMembers](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminBanTopicMembers.java) | [AdminBanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminBanTopicMembers.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/channel` | GET | AdminChannelTopicInfo | [AdminChannelTopicInfo](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChannelTopicInfo.java) | [AdminChannelTopicInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChannelTopicInfo.java) |
| [DEPRECATED] `/chat/admin/namespaces/{namespace}/topic/{topic}/chats` | GET | AdminTopicChatHistory | [AdminTopicChatHistory](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicChatHistory.java) | [AdminTopicChatHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicChatHistory.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/chats` | POST | AdminSendChat | [AdminSendChat](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminSendChat.java) | [AdminSendChat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminSendChat.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/chats/{chatId}` | DELETE | AdminDeleteChat | [AdminDeleteChat](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminDeleteChat.java) | [AdminDeleteChat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminDeleteChat.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/members` | GET | AdminTopicMembers | [AdminTopicMembers](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicMembers.java) | [AdminTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicMembers.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/shards` | GET | AdminTopicShards | [AdminTopicShards](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicShards.java) | [AdminTopicShards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicShards.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/unban-members` | POST | AdminUnbanTopicMembers | [AdminUnbanTopicMembers](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminUnbanTopicMembers.java) | [AdminUnbanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminUnbanTopicMembers.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/user/{userId}` | POST | AdminAddTopicMember | [AdminAddTopicMember](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminAddTopicMember.java) | [AdminAddTopicMember](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminAddTopicMember.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/user/{userId}` | DELETE | AdminRemoveTopicMember | [AdminRemoveTopicMember](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminRemoveTopicMember.java) | [AdminRemoveTopicMember](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminRemoveTopicMember.java) |
| `/chat/admin/namespaces/{namespace}/topics` | GET | AdminQueryTopic | [AdminQueryTopic](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminQueryTopic.java) | [AdminQueryTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminQueryTopic.java) |
| `/chat/admin/namespaces/{namespace}/users/{userId}/topics` | GET | AdminQueryUsersTopic | [AdminQueryUsersTopic](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminQueryUsersTopic.java) | [AdminQueryUsersTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminQueryUsersTopic.java) |
| `/chat/public/namespaces/{namespace}/muted` | GET | PublicGetMutedTopics | [PublicGetMutedTopics](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicGetMutedTopics.java) | [PublicGetMutedTopics](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicGetMutedTopics.java) |
| `/chat/public/namespaces/{namespace}/topic` | GET | PublicTopicList | [PublicTopicList](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicTopicList.java) | [PublicTopicList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicTopicList.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/ban-members` | POST | PublicBanTopicMembers | [PublicBanTopicMembers](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicBanTopicMembers.java) | [PublicBanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicBanTopicMembers.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/chats` | GET | PublicChatHistory | [PublicChatHistory](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicChatHistory.java) | [PublicChatHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicChatHistory.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/chats/{chatId}` | DELETE | PublicDeleteChat | [PublicDeleteChat](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicDeleteChat.java) | [PublicDeleteChat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicDeleteChat.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/mute` | PUT | PublicMuteUser | [PublicMuteUser](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicMuteUser.java) | [PublicMuteUser](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicMuteUser.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/unban-members` | POST | PublicUnbanTopicMembers | [PublicUnbanTopicMembers](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicUnbanTopicMembers.java) | [PublicUnbanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicUnbanTopicMembers.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/unmute` | PUT | PublicUnmuteUser | [PublicUnmuteUser](../../src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicUnmuteUser.java) | [PublicUnmuteUser](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicUnmuteUser.java) |

### config Wrapper:  [Config](../../src/main/java/net/accelbyte/sdk/api/chat/wrappers/Config.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/config` | GET | AdminGetAllConfigV1 | [AdminGetAllConfigV1](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminGetAllConfigV1.java) | [AdminGetAllConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminGetAllConfigV1.java) |
| `/chat/v1/admin/config/log` | GET | AdminGetLogConfig | [AdminGetLogConfig](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminGetLogConfig.java) | [AdminGetLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminGetLogConfig.java) |
| `/chat/v1/admin/config/log` | PATCH | AdminPatchUpdateLogConfig | [AdminPatchUpdateLogConfig](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminPatchUpdateLogConfig.java) | [AdminPatchUpdateLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminPatchUpdateLogConfig.java) |
| `/chat/v1/admin/config/namespaces/{namespace}` | GET | AdminGetConfigV1 | [AdminGetConfigV1](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminGetConfigV1.java) | [AdminGetConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminGetConfigV1.java) |
| `/chat/v1/admin/config/namespaces/{namespace}` | PUT | AdminUpdateConfigV1 | [AdminUpdateConfigV1](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminUpdateConfigV1.java) | [AdminUpdateConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminUpdateConfigV1.java) |
| `/chat/v1/admin/config/namespaces/{namespace}/export` | GET | ExportConfig | [ExportConfig](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/ExportConfig.java) | [ExportConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/ExportConfig.java) |
| `/chat/v1/admin/config/namespaces/{namespace}/import` | POST | ImportConfig | [ImportConfig](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/ImportConfig.java) | [ImportConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/ImportConfig.java) |
| `/chat/v1/public/config/namespaces/{namespace}` | GET | PublicGetConfigV1 | [PublicGetConfigV1](../../src/main/java/net/accelbyte/sdk/api/chat/operations/config/PublicGetConfigV1.java) | [PublicGetConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/PublicGetConfigV1.java) |

### inbox Wrapper:  [Inbox](../../src/main/java/net/accelbyte/sdk/api/chat/wrappers/Inbox.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories` | GET | AdminGetInboxCategories | [AdminGetInboxCategories](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxCategories.java) | [AdminGetInboxCategories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxCategories.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories` | POST | AdminAddInboxCategory | [AdminAddInboxCategory](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminAddInboxCategory.java) | [AdminAddInboxCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminAddInboxCategory.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories/{category}` | DELETE | AdminDeleteInboxCategory | [AdminDeleteInboxCategory](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminDeleteInboxCategory.java) | [AdminDeleteInboxCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminDeleteInboxCategory.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories/{category}` | PATCH | AdminUpdateInboxCategory | [AdminUpdateInboxCategory](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminUpdateInboxCategory.java) | [AdminUpdateInboxCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminUpdateInboxCategory.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories/{category}/schema.json` | GET | AdminGetCategorySchema | [AdminGetCategorySchema](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetCategorySchema.java) | [AdminGetCategorySchema](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetCategorySchema.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/message/{messageId}` | DELETE | AdminDeleteInboxMessage | [AdminDeleteInboxMessage](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminDeleteInboxMessage.java) | [AdminDeleteInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminDeleteInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages` | GET | AdminGetInboxMessages | [AdminGetInboxMessages](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxMessages.java) | [AdminGetInboxMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxMessages.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages` | POST | AdminSaveInboxMessage | [AdminSaveInboxMessage](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminSaveInboxMessage.java) | [AdminSaveInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminSaveInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{inbox}/unsend` | POST | AdminUnsendInboxMessage | [AdminUnsendInboxMessage](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminUnsendInboxMessage.java) | [AdminUnsendInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminUnsendInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{inbox}/users` | GET | AdminGetInboxUsers | [AdminGetInboxUsers](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxUsers.java) | [AdminGetInboxUsers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxUsers.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{messageId}` | PATCH | AdminUpdateInboxMessage | [AdminUpdateInboxMessage](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminUpdateInboxMessage.java) | [AdminUpdateInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminUpdateInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{messageId}/send` | POST | AdminSendInboxMessage | [AdminSendInboxMessage](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminSendInboxMessage.java) | [AdminSendInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminSendInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/stats` | GET | AdminGetInboxStats | [AdminGetInboxStats](../../src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxStats.java) | [AdminGetInboxStats](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxStats.java) |

### moderation Wrapper:  [Moderation](../../src/main/java/net/accelbyte/sdk/api/chat/wrappers/Moderation.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/namespaces/{namespace}/snapshot/{chatId}` | GET | AdminGetChatSnapshot | [AdminGetChatSnapshot](../../src/main/java/net/accelbyte/sdk/api/chat/operations/moderation/AdminGetChatSnapshot.java) | [AdminGetChatSnapshot](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/moderation/AdminGetChatSnapshot.java) |
| `/chat/v1/admin/namespaces/{namespace}/snapshot/{chatId}` | DELETE | AdminDeleteChatSnapshot | [AdminDeleteChatSnapshot](../../src/main/java/net/accelbyte/sdk/api/chat/operations/moderation/AdminDeleteChatSnapshot.java) | [AdminDeleteChatSnapshot](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/moderation/AdminDeleteChatSnapshot.java) |
| `/chat/v1/public/namespaces/{namespace}/topic/{topic}/snapshot/{chatId}` | GET | PublicGetChatSnapshot | [PublicGetChatSnapshot](../../src/main/java/net/accelbyte/sdk/api/chat/operations/moderation/PublicGetChatSnapshot.java) | [PublicGetChatSnapshot](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/moderation/PublicGetChatSnapshot.java) |

### profanity Wrapper:  [Profanity](../../src/main/java/net/accelbyte/sdk/api/chat/wrappers/Profanity.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary` | GET | AdminProfanityQuery | [AdminProfanityQuery](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityQuery.java) | [AdminProfanityQuery](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityQuery.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary` | POST | AdminProfanityCreate | [AdminProfanityCreate](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityCreate.java) | [AdminProfanityCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityCreate.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/bulk` | POST | AdminProfanityCreateBulk | [AdminProfanityCreateBulk](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityCreateBulk.java) | [AdminProfanityCreateBulk](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityCreateBulk.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/export` | GET | AdminProfanityExport | [AdminProfanityExport](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityExport.java) | [AdminProfanityExport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityExport.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/group` | GET | AdminProfanityGroup | [AdminProfanityGroup](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityGroup.java) | [AdminProfanityGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityGroup.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/import` | POST | AdminProfanityImport | [AdminProfanityImport](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityImport.java) | [AdminProfanityImport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityImport.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/{id}` | PUT | AdminProfanityUpdate | [AdminProfanityUpdate](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityUpdate.java) | [AdminProfanityUpdate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityUpdate.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/{id}` | DELETE | AdminProfanityDelete | [AdminProfanityDelete](../../src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityDelete.java) | [AdminProfanityDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityDelete.java) |

### Operations Wrapper:  [Operations](../../src/main/java/net/accelbyte/sdk/api/chat/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../src/main/java/net/accelbyte/sdk/api/chat/operations/operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/operations/PublicGetMessages.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `api.AddMemberParams` | [ApiAddMemberParams](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiAddMemberParams.java) |
| `api.CreateNamespaceTopicParams` | [ApiCreateNamespaceTopicParams](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiCreateNamespaceTopicParams.java) |
| `api.CreateTopicParams` | [ApiCreateTopicParams](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiCreateTopicParams.java) |
| `api.CreateTopicResponse` | [ApiCreateTopicResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiCreateTopicResponse.java) |
| `api.MuteUserRequest` | [ApiMuteUserRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiMuteUserRequest.java) |
| `api.MutedTopicResponse` | [ApiMutedTopicResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiMutedTopicResponse.java) |
| `api.SendChatParams` | [ApiSendChatParams](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiSendChatParams.java) |
| `api.UnmuteUserRequest` | [ApiUnmuteUserRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiUnmuteUserRequest.java) |
| `api.UpdateTopicParams` | [ApiUpdateTopicParams](../../src/main/java/net/accelbyte/sdk/api/chat/models/ApiUpdateTopicParams.java) |
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../src/main/java/net/accelbyte/sdk/api/chat/models/LogAppMessageDeclaration.java) |
| `logconfig.Configuration` | [LogconfigConfiguration](../../src/main/java/net/accelbyte/sdk/api/chat/models/LogconfigConfiguration.java) |
| `message.ActionAddUserToTopicResult` | [MessageActionAddUserToTopicResult](../../src/main/java/net/accelbyte/sdk/api/chat/models/MessageActionAddUserToTopicResult.java) |
| `message.ActionDeleteTopicResult` | [MessageActionDeleteTopicResult](../../src/main/java/net/accelbyte/sdk/api/chat/models/MessageActionDeleteTopicResult.java) |
| `models.AddInboxCategoryRequest` | [ModelsAddInboxCategoryRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsAddInboxCategoryRequest.java) |
| `models.AddInboxCategoryResponse` | [ModelsAddInboxCategoryResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsAddInboxCategoryResponse.java) |
| `models.BanTopicMemberParam` | [ModelsBanTopicMemberParam](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsBanTopicMemberParam.java) |
| `models.BanTopicMemberResult` | [ModelsBanTopicMemberResult](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsBanTopicMemberResult.java) |
| `models.CategoryHook` | [ModelsCategoryHook](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsCategoryHook.java) |
| `models.ChannelTopicResponse` | [ModelsChannelTopicResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChannelTopicResponse.java) |
| `models.ChannelTopicSummaryResponse` | [ModelsChannelTopicSummaryResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChannelTopicSummaryResponse.java) |
| `models.ChannelTopicWithPaginationResponse` | [ModelsChannelTopicWithPaginationResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChannelTopicWithPaginationResponse.java) |
| `models.ChatMessageResponse` | [ModelsChatMessageResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatMessageResponse.java) |
| `models.ChatMessageWithPaginationResponse` | [ModelsChatMessageWithPaginationResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatMessageWithPaginationResponse.java) |
| `models.ChatSnapshotMessage` | [ModelsChatSnapshotMessage](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatSnapshotMessage.java) |
| `models.ChatSnapshots` | [ModelsChatSnapshots](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatSnapshots.java) |
| `models.Config` | [ModelsConfig](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfig.java) |
| `models.ConfigExport` | [ModelsConfigExport](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfigExport.java) |
| `models.ConfigList` | [ModelsConfigList](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfigList.java) |
| `models.ConfigResponse` | [ModelsConfigResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfigResponse.java) |
| `models.Dictionary` | [ModelsDictionary](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionary.java) |
| `models.DictionaryChild` | [ModelsDictionaryChild](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryChild.java) |
| `models.DictionaryExport` | [ModelsDictionaryExport](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryExport.java) |
| `models.DictionaryExportItem` | [ModelsDictionaryExportItem](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryExportItem.java) |
| `models.DictionaryGroup` | [ModelsDictionaryGroup](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryGroup.java) |
| `models.DictionaryImportResult` | [ModelsDictionaryImportResult](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryImportResult.java) |
| `models.DictionaryInsertBulkRequest` | [ModelsDictionaryInsertBulkRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryInsertBulkRequest.java) |
| `models.DictionaryInsertRequest` | [ModelsDictionaryInsertRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryInsertRequest.java) |
| `models.DictionaryQueryResult` | [ModelsDictionaryQueryResult](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryQueryResult.java) |
| `models.DictionaryUpdateRequest` | [ModelsDictionaryUpdateRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryUpdateRequest.java) |
| `models.DictionaryWithChildren` | [ModelsDictionaryWithChildren](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryWithChildren.java) |
| `models.DictionaryWordChanges` | [ModelsDictionaryWordChanges](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryWordChanges.java) |
| `models.GetInboxCategoriesResponseItem` | [ModelsGetInboxCategoriesResponseItem](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxCategoriesResponseItem.java) |
| `models.GetInboxMessagesResponse` | [ModelsGetInboxMessagesResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxMessagesResponse.java) |
| `models.GetInboxMessagesResponseData` | [ModelsGetInboxMessagesResponseData](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxMessagesResponseData.java) |
| `models.GetInboxStatsResponse` | [ModelsGetInboxStatsResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxStatsResponse.java) |
| `models.GetInboxUsersResponse` | [ModelsGetInboxUsersResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxUsersResponse.java) |
| `models.ImportConfigResponse` | [ModelsImportConfigResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsImportConfigResponse.java) |
| `models.JSONSchemaType` | [ModelsJSONSchemaType](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsJSONSchemaType.java) |
| `models.MessageRequest` | [ModelsMessageRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsMessageRequest.java) |
| `models.MessageResultWithAttributes` | [ModelsMessageResultWithAttributes](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsMessageResultWithAttributes.java) |
| `models.MessageStats` | [ModelsMessageStats](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsMessageStats.java) |
| `models.Pagination` | [ModelsPagination](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPagination.java) |
| `models.PublicBanTopicMembersRequest` | [ModelsPublicBanTopicMembersRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicBanTopicMembersRequest.java) |
| `models.PublicBanTopicMembersResponse` | [ModelsPublicBanTopicMembersResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicBanTopicMembersResponse.java) |
| `models.PublicConfigResponse` | [ModelsPublicConfigResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicConfigResponse.java) |
| `models.PublicUnbanTopicMembersRequest` | [ModelsPublicUnbanTopicMembersRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicUnbanTopicMembersRequest.java) |
| `models.PublicUnbanTopicMembersResponse` | [ModelsPublicUnbanTopicMembersResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicUnbanTopicMembersResponse.java) |
| `models.SaveInboxMessageRequest` | [ModelsSaveInboxMessageRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSaveInboxMessageRequest.java) |
| `models.SaveInboxMessageResponse` | [ModelsSaveInboxMessageResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSaveInboxMessageResponse.java) |
| `models.SendInboxMessageRequest` | [ModelsSendInboxMessageRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSendInboxMessageRequest.java) |
| `models.SendInboxMessageResponse` | [ModelsSendInboxMessageResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSendInboxMessageResponse.java) |
| `models.TopicInfo` | [ModelsTopicInfo](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicInfo.java) |
| `models.TopicLogItem` | [ModelsTopicLogItem](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicLogItem.java) |
| `models.TopicLogWithPaginationResponse` | [ModelsTopicLogWithPaginationResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicLogWithPaginationResponse.java) |
| `models.TopicMemberResponse` | [ModelsTopicMemberResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicMemberResponse.java) |
| `models.TopicMemberWithPaginationResponse` | [ModelsTopicMemberWithPaginationResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicMemberWithPaginationResponse.java) |
| `models.TopicResponse` | [ModelsTopicResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicResponse.java) |
| `models.UnbanTopicMemberParam` | [ModelsUnbanTopicMemberParam](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnbanTopicMemberParam.java) |
| `models.UnbanTopicMemberResult` | [ModelsUnbanTopicMemberResult](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnbanTopicMemberResult.java) |
| `models.UnsendInboxMessageRequest` | [ModelsUnsendInboxMessageRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnsendInboxMessageRequest.java) |
| `models.UnsendInboxMessageResponse` | [ModelsUnsendInboxMessageResponse](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnsendInboxMessageResponse.java) |
| `models.UpdateInboxCategoryRequest` | [ModelsUpdateInboxCategoryRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUpdateInboxCategoryRequest.java) |
| `models.UpdateInboxMessageRequest` | [ModelsUpdateInboxMessageRequest](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUpdateInboxMessageRequest.java) |
| `models.UserInbox` | [ModelsUserInbox](../../src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUserInbox.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/chat/models/ResponseError.java) |
| `restapi.ErrorResponseBody` | [RestapiErrorResponseBody](../../src/main/java/net/accelbyte/sdk/api/chat/models/RestapiErrorResponseBody.java) |
| `topic.InfoMember` | [TopicInfoMember](../../src/main/java/net/accelbyte/sdk/api/chat/models/TopicInfoMember.java) |

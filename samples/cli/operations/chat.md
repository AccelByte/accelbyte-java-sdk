## Java Extend SDK CLI Sample App Operation Index for Chat service

### Operation AdminFilterChatMessage

```sh
$ build/install/cli/bin/cli chat adminFilterChatMessage \
    --namespace <namespace value> \
    --detail <detail value - optional> \
    --body <json string for request body>
```

### Operation AdminChatHistory

```sh
$ build/install/cli/bin/cli chat adminChatHistory \
    --namespace <namespace value> \
    --chatId <chatId value - optional> \
    --endCreatedAt <endCreatedAt value - optional> \
    --keyword <keyword value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --senderUserId <senderUserId value - optional> \
    --shardId <shardId value - optional> \
    --startCreatedAt <startCreatedAt value - optional> \
    --topic <topic value - optional> \
    --unfiltered <unfiltered value - optional>
```

### Operation AdminCreateNamespaceTopic

```sh
$ build/install/cli/bin/cli chat adminCreateNamespaceTopic \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminTopicList

```sh
$ build/install/cli/bin/cli chat adminTopicList \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --topicType <topicType value - optional>
```

### Operation AdminCreateTopic

```sh
$ build/install/cli/bin/cli chat adminCreateTopic \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminChannelTopicList

```sh
$ build/install/cli/bin/cli chat adminChannelTopicList \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --topicName <topicName value - optional>
```

### Operation AdminChannelTopicSummary

```sh
$ build/install/cli/bin/cli chat adminChannelTopicSummary \
    --namespace <namespace value>
```

### Operation AdminQueryTopicLog

```sh
$ build/install/cli/bin/cli chat adminQueryTopicLog \
    --namespace <namespace value> \
    --endCreatedAt <endCreatedAt value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --senderUserId <senderUserId value - optional> \
    --startCreatedAt <startCreatedAt value - optional> \
    --topicId <topicId value - optional> \
    --topicIds <topicIds value - optional> \
    --userId <userId value - optional>
```

### Operation AdminUpdateTopic

```sh
$ build/install/cli/bin/cli chat adminUpdateTopic \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation AdminDeleteTopic

```sh
$ build/install/cli/bin/cli chat adminDeleteTopic \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation AdminBanTopicMembers

```sh
$ build/install/cli/bin/cli chat adminBanTopicMembers \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation AdminChannelTopicInfo

```sh
$ build/install/cli/bin/cli chat adminChannelTopicInfo \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation AdminSendChat

```sh
$ build/install/cli/bin/cli chat adminSendChat \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation AdminDeleteChat

```sh
$ build/install/cli/bin/cli chat adminDeleteChat \
    --chatId <chatId value> \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation AdminTopicMembers

```sh
$ build/install/cli/bin/cli chat adminTopicMembers \
    --namespace <namespace value> \
    --topic <topic value> \
    --isBanned <isBanned value - optional> \
    --isModerator <isModerator value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --shardId <shardId value - optional>
```

### Operation AdminTopicShards

```sh
$ build/install/cli/bin/cli chat adminTopicShards \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation AdminUnbanTopicMembers

```sh
$ build/install/cli/bin/cli chat adminUnbanTopicMembers \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation AdminAddTopicMember

```sh
$ build/install/cli/bin/cli chat adminAddTopicMember \
    --namespace <namespace value> \
    --topic <topic value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminRemoveTopicMember

```sh
$ build/install/cli/bin/cli chat adminRemoveTopicMember \
    --namespace <namespace value> \
    --topic <topic value> \
    --userId <userId value>
```

### Operation AdminQueryTopic

```sh
$ build/install/cli/bin/cli chat adminQueryTopic \
    --namespace <namespace value> \
    --includeMembers <includeMembers value - optional> \
    --includePastMembers <includePastMembers value - optional> \
    --includePastTopics <includePastTopics value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --topic <topic value - optional> \
    --topicSubType <topicSubType value - optional> \
    --topicType <topicType value - optional> \
    --userId <userId value - optional>
```

### Operation AdminQueryUsersTopic

```sh
$ build/install/cli/bin/cli chat adminQueryUsersTopic \
    --namespace <namespace value> \
    --userId <userId value> \
    --includePastTopics <includePastTopics value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --topicSubType <topicSubType value - optional> \
    --topicType <topicType value - optional>
```

### Operation PublicGetMutedTopics

```sh
$ build/install/cli/bin/cli chat publicGetMutedTopics \
    --namespace <namespace value>
```

### Operation PublicTopicList

```sh
$ build/install/cli/bin/cli chat publicTopicList \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --topicType <topicType value - optional>
```

### Operation PublicBanTopicMembers

```sh
$ build/install/cli/bin/cli chat publicBanTopicMembers \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation PublicChatHistory

```sh
$ build/install/cli/bin/cli chat publicChatHistory \
    --namespace <namespace value> \
    --topic <topic value> \
    --limit <limit value - optional> \
    --order <order value - optional> \
    --startCreatedAt <startCreatedAt value - optional>
```

### Operation PublicDeleteChat

```sh
$ build/install/cli/bin/cli chat publicDeleteChat \
    --chatId <chatId value> \
    --namespace <namespace value> \
    --topic <topic value>
```

### Operation PublicMuteUser

```sh
$ build/install/cli/bin/cli chat publicMuteUser \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation PublicUnbanTopicMembers

```sh
$ build/install/cli/bin/cli chat publicUnbanTopicMembers \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation PublicUnmuteUser

```sh
$ build/install/cli/bin/cli chat publicUnmuteUser \
    --namespace <namespace value> \
    --topic <topic value> \
    --body <json string for request body>
```

### Operation AdminGetAllConfigV1

```sh
$ build/install/cli/bin/cli chat adminGetAllConfigV1
```

### Operation AdminGetLogConfig

```sh
$ build/install/cli/bin/cli chat adminGetLogConfig
```

### Operation AdminPatchUpdateLogConfig

```sh
$ build/install/cli/bin/cli chat adminPatchUpdateLogConfig \
    --body <json string for request body>
```

### Operation AdminGetConfigV1

```sh
$ build/install/cli/bin/cli chat adminGetConfigV1 \
    --namespace <namespace value>
```

### Operation AdminUpdateConfigV1

```sh
$ build/install/cli/bin/cli chat adminUpdateConfigV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ExportConfig

```sh
$ build/install/cli/bin/cli chat exportConfig \
    --namespace <namespace value>
```

### Operation ImportConfig

```sh
$ build/install/cli/bin/cli chat importConfig \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation AdminGetInboxCategories

```sh
$ build/install/cli/bin/cli chat adminGetInboxCategories \
    --namespace <namespace value>
```

### Operation AdminAddInboxCategory

```sh
$ build/install/cli/bin/cli chat adminAddInboxCategory \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteInboxCategory

```sh
$ build/install/cli/bin/cli chat adminDeleteInboxCategory \
    --category <category value> \
    --namespace <namespace value>
```

### Operation AdminUpdateInboxCategory

```sh
$ build/install/cli/bin/cli chat adminUpdateInboxCategory \
    --category <category value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetCategorySchema

```sh
$ build/install/cli/bin/cli chat adminGetCategorySchema \
    --category <category value> \
    --namespace <namespace value>
```

### Operation AdminListKafkaTopic

```sh
$ build/install/cli/bin/cli chat adminListKafkaTopic \
    --namespace <namespace value>
```

### Operation AdminDeleteInboxMessage

```sh
$ build/install/cli/bin/cli chat adminDeleteInboxMessage \
    --messageId <messageId value> \
    --namespace <namespace value> \
    --force <force value - optional>
```

### Operation AdminGetInboxMessages

```sh
$ build/install/cli/bin/cli chat adminGetInboxMessages \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --endCreatedAt <endCreatedAt value - optional> \
    --limit <limit value - optional> \
    --messageId <messageId value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --scope <scope value - optional> \
    --startCreatedAt <startCreatedAt value - optional> \
    --status <status value - optional> \
    --transient_ <transient value - optional>
```

### Operation AdminSaveInboxMessage

```sh
$ build/install/cli/bin/cli chat adminSaveInboxMessage \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUnsendInboxMessage

```sh
$ build/install/cli/bin/cli chat adminUnsendInboxMessage \
    --inbox <inbox value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetInboxUsers

```sh
$ build/install/cli/bin/cli chat adminGetInboxUsers \
    --inbox <inbox value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional> \
    --userId <userId value - optional>
```

### Operation AdminUpdateInboxMessage

```sh
$ build/install/cli/bin/cli chat adminUpdateInboxMessage \
    --messageId <messageId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminSendInboxMessage

```sh
$ build/install/cli/bin/cli chat adminSendInboxMessage \
    --messageId <messageId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetInboxStats

```sh
$ build/install/cli/bin/cli chat adminGetInboxStats \
    --namespace <namespace value> \
    --messageId <messageId value - optional>
```

### Operation AdminGetChatSnapshot

```sh
$ build/install/cli/bin/cli chat adminGetChatSnapshot \
    --chatId <chatId value> \
    --namespace <namespace value>
```

### Operation AdminDeleteChatSnapshot

```sh
$ build/install/cli/bin/cli chat adminDeleteChatSnapshot \
    --chatId <chatId value> \
    --namespace <namespace value>
```

### Operation AdminProfanityQuery

```sh
$ build/install/cli/bin/cli chat adminProfanityQuery \
    --namespace <namespace value> \
    --filterMask <filterMask value - optional> \
    --includeChildren <includeChildren value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --parentId <parentId value - optional> \
    --startWith <startWith value - optional> \
    --wordType <wordType value - optional>
```

### Operation AdminProfanityCreate

```sh
$ build/install/cli/bin/cli chat adminProfanityCreate \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminProfanityCreateBulk

```sh
$ build/install/cli/bin/cli chat adminProfanityCreateBulk \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminProfanityExport

```sh
$ build/install/cli/bin/cli chat adminProfanityExport \
    --namespace <namespace value>
```

### Operation AdminProfanityGroup

```sh
$ build/install/cli/bin/cli chat adminProfanityGroup \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminProfanityImport

```sh
$ build/install/cli/bin/cli chat adminProfanityImport \
    --namespace <namespace value> \
    --action <action value - optional> \
    --showResult <showResult value - optional> \
    --file <file value>
```

### Operation AdminProfanityUpdate

```sh
$ build/install/cli/bin/cli chat adminProfanityUpdate \
    --id <id value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminProfanityDelete

```sh
$ build/install/cli/bin/cli chat adminProfanityDelete \
    --id <id value> \
    --namespace <namespace value>
```

### Operation PublicGetMessages

```sh
$ build/install/cli/bin/cli chat publicGetMessages
```

### Operation PublicGetConfigV1

```sh
$ build/install/cli/bin/cli chat publicGetConfigV1 \
    --namespace <namespace value>
```

### Operation PublicGetChatSnapshot

```sh
$ build/install/cli/bin/cli chat publicGetChatSnapshot \
    --chatId <chatId value> \
    --namespace <namespace value> \
    --topic <topic value>
```


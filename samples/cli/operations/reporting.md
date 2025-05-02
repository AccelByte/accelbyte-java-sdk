## Java Extend SDK CLI Sample App Operation Index for Reporting service

### Operation AdminFindActionList

```sh
$ build/install/cli/bin/cli reporting adminFindActionList
```

### Operation AdminCreateModAction

```sh
$ build/install/cli/bin/cli reporting adminCreateModAction \
    --body <json string for request body>
```

### Operation AdminFindExtensionCategoryList

```sh
$ build/install/cli/bin/cli reporting adminFindExtensionCategoryList \
    --order <order value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminCreateExtensionCategory

```sh
$ build/install/cli/bin/cli reporting adminCreateExtensionCategory \
    --body <json string for request body>
```

### Operation Get

```sh
$ build/install/cli/bin/cli reporting get \
    --namespace <namespace value> \
    --category <category value - optional>
```

### Operation Upsert

```sh
$ build/install/cli/bin/cli reporting upsert \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListReasonGroups

```sh
$ build/install/cli/bin/cli reporting adminListReasonGroups \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateReasonGroup

```sh
$ build/install/cli/bin/cli reporting createReasonGroup \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetReasonGroup

```sh
$ build/install/cli/bin/cli reporting getReasonGroup \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation DeleteReasonGroup

```sh
$ build/install/cli/bin/cli reporting deleteReasonGroup \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation UpdateReasonGroup

```sh
$ build/install/cli/bin/cli reporting updateReasonGroup \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetReasons

```sh
$ build/install/cli/bin/cli reporting adminGetReasons \
    --namespace <namespace value> \
    --group <group value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --title <title value - optional>
```

### Operation CreateReason

```sh
$ build/install/cli/bin/cli reporting createReason \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetAllReasons

```sh
$ build/install/cli/bin/cli reporting adminGetAllReasons \
    --namespace <namespace value>
```

### Operation AdminGetUnusedReasons

```sh
$ build/install/cli/bin/cli reporting adminGetUnusedReasons \
    --namespace <namespace value> \
    --extensionCategory <extensionCategory value - optional> \
    --category <category value>
```

### Operation AdminGetReason

```sh
$ build/install/cli/bin/cli reporting adminGetReason \
    --namespace <namespace value> \
    --reasonId <reasonId value>
```

### Operation DeleteReason

```sh
$ build/install/cli/bin/cli reporting deleteReason \
    --namespace <namespace value> \
    --reasonId <reasonId value>
```

### Operation UpdateReason

```sh
$ build/install/cli/bin/cli reporting updateReason \
    --namespace <namespace value> \
    --reasonId <reasonId value> \
    --body <json string for request body>
```

### Operation ListReports

```sh
$ build/install/cli/bin/cli reporting listReports \
    --namespace <namespace value> \
    --category <category value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --reportedUserId <reportedUserId value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminSubmitReport

```sh
$ build/install/cli/bin/cli reporting adminSubmitReport \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateModerationRule

```sh
$ build/install/cli/bin/cli reporting createModerationRule \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateModerationRule

```sh
$ build/install/cli/bin/cli reporting updateModerationRule \
    --namespace <namespace value> \
    --ruleId <ruleId value> \
    --body <json string for request body>
```

### Operation DeleteModerationRule

```sh
$ build/install/cli/bin/cli reporting deleteModerationRule \
    --namespace <namespace value> \
    --ruleId <ruleId value>
```

### Operation UpdateModerationRuleStatus

```sh
$ build/install/cli/bin/cli reporting updateModerationRuleStatus \
    --namespace <namespace value> \
    --ruleId <ruleId value> \
    --body <json string for request body>
```

### Operation GetModerationRules

```sh
$ build/install/cli/bin/cli reporting getModerationRules \
    --namespace <namespace value> \
    --category <category value - optional> \
    --extensionCategory <extensionCategory value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetModerationRuleDetails

```sh
$ build/install/cli/bin/cli reporting getModerationRuleDetails \
    --namespace <namespace value> \
    --ruleId <ruleId value>
```

### Operation ListTickets

```sh
$ build/install/cli/bin/cli reporting listTickets \
    --namespace <namespace value> \
    --category <category value - optional> \
    --extensionCategory <extensionCategory value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --reportedUserId <reportedUserId value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional>
```

### Operation TicketStatistic

```sh
$ build/install/cli/bin/cli reporting ticketStatistic \
    --namespace <namespace value> \
    --extensionCategory <extensionCategory value - optional> \
    --category <category value>
```

### Operation GetTicketDetail

```sh
$ build/install/cli/bin/cli reporting getTicketDetail \
    --namespace <namespace value> \
    --ticketId <ticketId value>
```

### Operation DeleteTicket

```sh
$ build/install/cli/bin/cli reporting deleteTicket \
    --namespace <namespace value> \
    --ticketId <ticketId value>
```

### Operation GetReportsByTicket

```sh
$ build/install/cli/bin/cli reporting getReportsByTicket \
    --namespace <namespace value> \
    --ticketId <ticketId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation UpdateTicketResolutions

```sh
$ build/install/cli/bin/cli reporting updateTicketResolutions \
    --namespace <namespace value> \
    --ticketId <ticketId value> \
    --body <json string for request body>
```

### Operation PublicListReasonGroups

```sh
$ build/install/cli/bin/cli reporting publicListReasonGroups \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicGetReasons

```sh
$ build/install/cli/bin/cli reporting publicGetReasons \
    --namespace <namespace value> \
    --group <group value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --title <title value - optional>
```

### Operation SubmitReport

```sh
$ build/install/cli/bin/cli reporting submitReport \
    --namespace <namespace value> \
    --body <json string for request body>
```


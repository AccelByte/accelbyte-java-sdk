## Java Extend SDK CLI Sample App Operation Index for Match2 service

### Operation GetHealthcheckInfo

```sh
$ build/install/cli/bin/cli match2 getHealthcheckInfo
```

### Operation GetHealthcheckInfoV1

```sh
$ build/install/cli/bin/cli match2 getHealthcheckInfoV1
```

### Operation AdminGetLogConfig

```sh
$ build/install/cli/bin/cli match2 adminGetLogConfig
```

### Operation AdminPatchUpdateLogConfig

```sh
$ build/install/cli/bin/cli match2 adminPatchUpdateLogConfig \
    --body <json string for request body>
```

### Operation AdminGetAllConfigV1

```sh
$ build/install/cli/bin/cli match2 adminGetAllConfigV1
```

### Operation AdminGetConfigV1

```sh
$ build/install/cli/bin/cli match2 adminGetConfigV1 \
    --namespace <namespace value>
```

### Operation AdminPatchConfigV1

```sh
$ build/install/cli/bin/cli match2 adminPatchConfigV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation EnvironmentVariableList

```sh
$ build/install/cli/bin/cli match2 environmentVariableList
```

### Operation AdminQueryBackfill

```sh
$ build/install/cli/bin/cli match2 adminQueryBackfill \
    --namespace <namespace value> \
    --fromTime <fromTime value - optional> \
    --isActive <isActive value - optional> \
    --limit <limit value - optional> \
    --matchPool <matchPool value - optional> \
    --offset <offset value - optional> \
    --playerID <playerID value - optional> \
    --region <region value - optional> \
    --sessionID <sessionID value - optional> \
    --toTime <toTime value - optional>
```

### Operation CreateBackfill

```sh
$ build/install/cli/bin/cli match2 createBackfill \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetBackfillProposal

```sh
$ build/install/cli/bin/cli match2 getBackfillProposal \
    --namespace <namespace value> \
    --sessionID <sessionID value>
```

### Operation GetBackfill

```sh
$ build/install/cli/bin/cli match2 getBackfill \
    --backfillID <backfillID value> \
    --namespace <namespace value>
```

### Operation DeleteBackfill

```sh
$ build/install/cli/bin/cli match2 deleteBackfill \
    --backfillID <backfillID value> \
    --namespace <namespace value>
```

### Operation AcceptBackfill

```sh
$ build/install/cli/bin/cli match2 acceptBackfill \
    --backfillID <backfillID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RejectBackfill

```sh
$ build/install/cli/bin/cli match2 rejectBackfill \
    --backfillID <backfillID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation MatchFunctionList

```sh
$ build/install/cli/bin/cli match2 matchFunctionList \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateMatchFunction

```sh
$ build/install/cli/bin/cli match2 createMatchFunction \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation MatchFunctionGet

```sh
$ build/install/cli/bin/cli match2 matchFunctionGet \
    --name <name value> \
    --namespace <namespace value>
```

### Operation UpdateMatchFunction

```sh
$ build/install/cli/bin/cli match2 updateMatchFunction \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteMatchFunction

```sh
$ build/install/cli/bin/cli match2 deleteMatchFunction \
    --name <name value> \
    --namespace <namespace value>
```

### Operation MatchPoolList

```sh
$ build/install/cli/bin/cli match2 matchPoolList \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional>
```

### Operation CreateMatchPool

```sh
$ build/install/cli/bin/cli match2 createMatchPool \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation MatchPoolDetails

```sh
$ build/install/cli/bin/cli match2 matchPoolDetails \
    --namespace <namespace value> \
    --pool <pool value>
```

### Operation UpdateMatchPool

```sh
$ build/install/cli/bin/cli match2 updateMatchPool \
    --namespace <namespace value> \
    --pool <pool value> \
    --body <json string for request body>
```

### Operation DeleteMatchPool

```sh
$ build/install/cli/bin/cli match2 deleteMatchPool \
    --namespace <namespace value> \
    --pool <pool value>
```

### Operation MatchPoolMetric

```sh
$ build/install/cli/bin/cli match2 matchPoolMetric \
    --namespace <namespace value> \
    --pool <pool value>
```

### Operation PostMatchErrorMetric

```sh
$ build/install/cli/bin/cli match2 postMatchErrorMetric \
    --namespace <namespace value> \
    --pool <pool value> \
    --body <json string for request body>
```

### Operation GetPlayerMetric

```sh
$ build/install/cli/bin/cli match2 getPlayerMetric \
    --namespace <namespace value> \
    --pool <pool value>
```

### Operation AdminGetMatchPoolTickets

```sh
$ build/install/cli/bin/cli match2 adminGetMatchPoolTickets \
    --namespace <namespace value> \
    --pool <pool value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateMatchTicket

```sh
$ build/install/cli/bin/cli match2 createMatchTicket \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetMyMatchTickets

```sh
$ build/install/cli/bin/cli match2 getMyMatchTickets \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --matchPool <matchPool value - optional> \
    --offset <offset value - optional>
```

### Operation MatchTicketDetails

```sh
$ build/install/cli/bin/cli match2 matchTicketDetails \
    --namespace <namespace value> \
    --ticketid <ticketid value>
```

### Operation DeleteMatchTicket

```sh
$ build/install/cli/bin/cli match2 deleteMatchTicket \
    --namespace <namespace value> \
    --ticketid <ticketid value>
```

### Operation RuleSetList

```sh
$ build/install/cli/bin/cli match2 ruleSetList \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional>
```

### Operation CreateRuleSet

```sh
$ build/install/cli/bin/cli match2 createRuleSet \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RuleSetDetails

```sh
$ build/install/cli/bin/cli match2 ruleSetDetails \
    --namespace <namespace value> \
    --ruleset <ruleset value>
```

### Operation UpdateRuleSet

```sh
$ build/install/cli/bin/cli match2 updateRuleSet \
    --namespace <namespace value> \
    --ruleset <ruleset value> \
    --body <json string for request body>
```

### Operation DeleteRuleSet

```sh
$ build/install/cli/bin/cli match2 deleteRuleSet \
    --namespace <namespace value> \
    --ruleset <ruleset value>
```

### Operation PublicGetPlayerMetric

```sh
$ build/install/cli/bin/cli match2 publicGetPlayerMetric \
    --namespace <namespace value> \
    --pool <pool value>
```

### Operation VersionCheckHandler

```sh
$ build/install/cli/bin/cli match2 versionCheckHandler
```


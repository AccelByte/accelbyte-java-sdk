## Java Extend SDK CLI Sample App Operation Index for Sessionhistory service

### Operation GetHealthcheckInfo

```sh
$ build/install/cli/bin/cli sessionhistory getHealthcheckInfo
```

### Operation GetHealthcheckInfoV1

```sh
$ build/install/cli/bin/cli sessionhistory getHealthcheckInfoV1
```

### Operation AdminGetEnvConfig

```sh
$ build/install/cli/bin/cli sessionhistory adminGetEnvConfig
```

### Operation AdminPatchUpdateEnvConfig

```sh
$ build/install/cli/bin/cli sessionhistory adminPatchUpdateEnvConfig \
    --body <json string for request body>
```

### Operation AdminGetLogConfig

```sh
$ build/install/cli/bin/cli sessionhistory adminGetLogConfig
```

### Operation AdminPatchUpdateLogConfig

```sh
$ build/install/cli/bin/cli sessionhistory adminPatchUpdateLogConfig \
    --body <json string for request body>
```

### Operation AdminQueryGameSessionDetail

```sh
$ build/install/cli/bin/cli sessionhistory adminQueryGameSessionDetail \
    --namespace <namespace value> \
    --completedOnly <completedOnly value - optional> \
    --configurationName <configurationName value - optional> \
    --dsPodName <dsPodName value - optional> \
    --endDate <endDate value - optional> \
    --gameSessionID <gameSessionID value - optional> \
    --isPersistent <isPersistent value - optional> \
    --joinability <joinability value - optional> \
    --limit <limit value - optional> \
    --matchPool <matchPool value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --startDate <startDate value - optional> \
    --statusV2 <statusV2 value - optional> \
    --userID <userID value - optional>
```

### Operation GetGameSessionDetail

```sh
$ build/install/cli/bin/cli sessionhistory getGameSessionDetail \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation AdminQueryMatchmakingDetail

```sh
$ build/install/cli/bin/cli sessionhistory adminQueryMatchmakingDetail \
    --namespace <namespace value> \
    --gameSessionID <gameSessionID value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --ticketID <ticketID value - optional> \
    --userID <userID value - optional>
```

### Operation AdminGetMatchmakingDetailBySessionID

```sh
$ build/install/cli/bin/cli sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation AdminGetMatchmakingDetailByTicketID

```sh
$ build/install/cli/bin/cli sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace <namespace value> \
    --ticketId <ticketId value>
```

### Operation AdminQueryPartyDetail

```sh
$ build/install/cli/bin/cli sessionhistory adminQueryPartyDetail \
    --namespace <namespace value> \
    --endDate <endDate value - optional> \
    --joinability <joinability value - optional> \
    --leaderID <leaderID value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --partyID <partyID value - optional> \
    --startDate <startDate value - optional> \
    --userID <userID value - optional>
```

### Operation GetPartyDetail

```sh
$ build/install/cli/bin/cli sessionhistory getPartyDetail \
    --namespace <namespace value> \
    --sessionId <sessionId value>
```

### Operation AdminQueryTicketDetail

```sh
$ build/install/cli/bin/cli sessionhistory adminQueryTicketDetail \
    --namespace <namespace value> \
    --endDate <endDate value - optional> \
    --gameMode <gameMode value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --partyID <partyID value - optional> \
    --region <region value - optional> \
    --startDate <startDate value - optional> \
    --userIDs <userIDs value - optional>
```

### Operation AdminTicketDetailGetByTicketID

```sh
$ build/install/cli/bin/cli sessionhistory adminTicketDetailGetByTicketID \
    --namespace <namespace value> \
    --ticketId <ticketId value>
```

### Operation PublicQueryGameSessionMe

```sh
$ build/install/cli/bin/cli sessionhistory publicQueryGameSessionMe \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional>
```

### Operation QueryXrayMatchPool

```sh
$ build/install/cli/bin/cli sessionhistory queryXrayMatchPool \
    --namespace <namespace value> \
    --poolName <poolName value> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryDetailTickMatchPool

```sh
$ build/install/cli/bin/cli sessionhistory queryDetailTickMatchPool \
    --namespace <namespace value> \
    --podName <podName value> \
    --poolName <poolName value> \
    --all <all value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryDetailTickMatchPoolMatches

```sh
$ build/install/cli/bin/cli sessionhistory queryDetailTickMatchPoolMatches \
    --namespace <namespace value> \
    --podName <podName value> \
    --poolName <poolName value> \
    --tickId <tickId value>
```

### Operation QueryDetailTickMatchPoolTicket

```sh
$ build/install/cli/bin/cli sessionhistory queryDetailTickMatchPoolTicket \
    --namespace <namespace value> \
    --podName <podName value> \
    --poolName <poolName value> \
    --tickId <tickId value>
```

### Operation QueryMatchHistories

```sh
$ build/install/cli/bin/cli sessionhistory queryMatchHistories \
    --matchId <matchId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation QueryMatchTicketHistories

```sh
$ build/install/cli/bin/cli sessionhistory queryMatchTicketHistories \
    --matchId <matchId value> \
    --namespace <namespace value>
```

### Operation QueryXrayMatch

```sh
$ build/install/cli/bin/cli sessionhistory queryXrayMatch \
    --matchId <matchId value> \
    --namespace <namespace value>
```

### Operation QueryAcquiringDS

```sh
$ build/install/cli/bin/cli sessionhistory queryAcquiringDS \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryAcquiringDSWaitTimeAvg

```sh
$ build/install/cli/bin/cli sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryMatchLengthDurationpAvg

```sh
$ build/install/cli/bin/cli sessionhistory queryMatchLengthDurationpAvg \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryMatchLengthDurationp99

```sh
$ build/install/cli/bin/cli sessionhistory queryMatchLengthDurationp99 \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalActiveSession

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalActiveSession \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --region <region value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalMatchmakingMatch

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalMatchmakingMatch \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalPlayerPersession

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalPlayerPersession \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalMatchmakingCanceled

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalMatchmakingCanceled \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalMatchmakingCreated

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalMatchmakingCreated \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalMatchmakingExpired

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalMatchmakingExpired \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryTotalMatchmakingMatchTicket

```sh
$ build/install/cli/bin/cli sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace <namespace value> \
    --matchPool <matchPool value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation CreateXrayTicketObservability

```sh
$ build/install/cli/bin/cli sessionhistory createXrayTicketObservability \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateXrayBulkTicketObservability

```sh
$ build/install/cli/bin/cli sessionhistory createXrayBulkTicketObservability \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation QueryXrayTimelineByTicketID

```sh
$ build/install/cli/bin/cli sessionhistory queryXrayTimelineByTicketID \
    --namespace <namespace value> \
    --ticketId <ticketId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```

### Operation QueryXrayTimelineByUserID

```sh
$ build/install/cli/bin/cli sessionhistory queryXrayTimelineByUserID \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional> \
    --orderBy <orderBy value - optional> \
    --endDate <endDate value> \
    --startDate <startDate value>
```


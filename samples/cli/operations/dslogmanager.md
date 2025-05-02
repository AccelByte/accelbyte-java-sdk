## Java Extend SDK CLI Sample App Operation Index for Dslogmanager service

### Operation GetServerLogs

```sh
$ build/install/cli/bin/cli dslogmanager getServerLogs \
    --namespace <namespace value> \
    --podName <podName value> \
    --logType <logType value - optional> \
    --offset <offset value - optional> \
    --origin <origin value - optional>
```

### Operation ListTerminatedServers

```sh
$ build/install/cli/bin/cli dslogmanager listTerminatedServers \
    --namespace <namespace value> \
    --deployment <deployment value - optional> \
    --endDate <end_date value - optional> \
    --gameMode <game_mode value - optional> \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --partyId <party_id value - optional> \
    --podName <pod_name value - optional> \
    --previous <previous value - optional> \
    --provider <provider value - optional> \
    --region <region value - optional> \
    --sessionId <session_id value - optional> \
    --source <source value - optional> \
    --startDate <start_date value - optional> \
    --status <status value - optional> \
    --userId <user_id value - optional>
```

### Operation DownloadServerLogs

```sh
$ build/install/cli/bin/cli dslogmanager downloadServerLogs \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation CheckServerLogs

```sh
$ build/install/cli/bin/cli dslogmanager checkServerLogs \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation BatchDownloadServerLogs

```sh
$ build/install/cli/bin/cli dslogmanager batchDownloadServerLogs \
    --body <json string for request body>
```

### Operation ListMetadataServers

```sh
$ build/install/cli/bin/cli dslogmanager listMetadataServers \
    --body <json string for request body>
```

### Operation ListAllTerminatedServers

```sh
$ build/install/cli/bin/cli dslogmanager listAllTerminatedServers \
    --deployment <deployment value - optional> \
    --endDate <end_date value - optional> \
    --gameMode <game_mode value - optional> \
    --limit <limit value - optional> \
    --namespace <namespace value - optional> \
    --next <next value - optional> \
    --partyId <party_id value - optional> \
    --podName <pod_name value - optional> \
    --previous <previous value - optional> \
    --provider <provider value - optional> \
    --region <region value - optional> \
    --sessionId <session_id value - optional> \
    --startDate <start_date value - optional> \
    --status <status value - optional> \
    --userId <user_id value - optional>
```

### Operation PublicGetMessages

```sh
$ build/install/cli/bin/cli dslogmanager publicGetMessages
```


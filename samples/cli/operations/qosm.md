## Java Extend SDK CLI Sample App Operation Index for Qosm service

### Operation UpdateServerConfig

```sh
$ build/install/cli/bin/cli qosm updateServerConfig \
    --namespace <namespace value> \
    --region <region value> \
    --body <json string for request body>
```

### Operation DeleteServer

```sh
$ build/install/cli/bin/cli qosm deleteServer \
    --region <region value>
```

### Operation SetServerAlias

```sh
$ build/install/cli/bin/cli qosm setServerAlias \
    --region <region value> \
    --body <json string for request body>
```

### Operation ListServerPerNamespace

```sh
$ build/install/cli/bin/cli qosm listServerPerNamespace \
    --namespace <namespace value> \
    --status <status value - optional>
```

### Operation ListServer

```sh
$ build/install/cli/bin/cli qosm listServer
```

### Operation Heartbeat

```sh
$ build/install/cli/bin/cli qosm heartbeat \
    --body <json string for request body>
```


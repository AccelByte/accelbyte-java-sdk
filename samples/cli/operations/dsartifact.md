## Java Extend SDK CLI Sample App Operation Index for Dsartifact service

### Operation ListNodesIPAddress

```sh
$ build/install/cli/bin/cli dsartifact listNodesIPAddress \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --nodeIP <nodeIP value - optional> \
    --previous <previous value - optional>
```

### Operation DeleteNodeByID

```sh
$ build/install/cli/bin/cli dsartifact deleteNodeByID \
    --nodeIP <nodeIP value> \
    --podName <podName value>
```

### Operation ListQueue

```sh
$ build/install/cli/bin/cli dsartifact listQueue \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --previous <previous value - optional> \
    --nodeIP <nodeIP value>
```

### Operation GetActiveQueue

```sh
$ build/install/cli/bin/cli dsartifact getActiveQueue \
    --nodeIP <nodeIP value>
```

### Operation SetActiveQueue

```sh
$ build/install/cli/bin/cli dsartifact setActiveQueue \
    --nodeIP <nodeIP value> \
    --podName <podName value>
```

### Operation DeleteActiveQueue

```sh
$ build/install/cli/bin/cli dsartifact deleteActiveQueue \
    --nodeIP <nodeIP value>
```

### Operation ReportFailedUpload

```sh
$ build/install/cli/bin/cli dsartifact reportFailedUpload \
    --nodeIP <nodeIP value> \
    --podName <podName value>
```

### Operation DeleteQueue

```sh
$ build/install/cli/bin/cli dsartifact deleteQueue \
    --namespace <namespace value> \
    --nodeIP <nodeIP value> \
    --podName <podName value>
```

### Operation ListAllActiveQueue

```sh
$ build/install/cli/bin/cli dsartifact listAllActiveQueue \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --nodeIP <nodeIP value - optional> \
    --podName <podName value - optional> \
    --previous <previous value - optional>
```

### Operation ListAllQueue

```sh
$ build/install/cli/bin/cli dsartifact listAllQueue \
    --namespace <namespace value> \
    --excludeUploading <exclude_uploading value - optional> \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --nodeIP <nodeIP value - optional> \
    --order <order value - optional> \
    --podName <pod_name value - optional> \
    --previous <previous value - optional>
```

### Operation ListTerminatedServersWithNamespace

```sh
$ build/install/cli/bin/cli dsartifact listTerminatedServersWithNamespace \
    --namespace <namespace value> \
    --deployment <deployment value - optional> \
    --gameMode <game_mode value - optional> \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --partyId <party_id value - optional> \
    --podName <pod_name value - optional> \
    --previous <previous value - optional> \
    --provider <provider value - optional> \
    --region <region value - optional> \
    --sessionId <session_id value - optional> \
    --userId <user_id value - optional>
```

### Operation DownloadServerArtifacts

```sh
$ build/install/cli/bin/cli dsartifact downloadServerArtifacts \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation CheckServerArtifact

```sh
$ build/install/cli/bin/cli dsartifact checkServerArtifact \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation ListTerminatedServers

```sh
$ build/install/cli/bin/cli dsartifact listTerminatedServers \
    --deployment <deployment value - optional> \
    --gameMode <game_mode value - optional> \
    --limit <limit value - optional> \
    --next <next value - optional> \
    --partyId <party_id value - optional> \
    --podName <pod_name value - optional> \
    --previous <previous value - optional> \
    --provider <provider value - optional> \
    --region <region value - optional> \
    --sessionId <session_id value - optional> \
    --userId <user_id value - optional>
```

### Operation PublicGetMessages

```sh
$ build/install/cli/bin/cli dsartifact publicGetMessages
```


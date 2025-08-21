## Java Extend SDK CLI Sample App Operation Index for Ams service

### Operation AuthCheck

```sh
$ build/install/cli/bin/cli ams authCheck
```

### Operation PortalHealthCheck

```sh
$ build/install/cli/bin/cli ams portalHealthCheck
```

### Operation AdminAccountGet

```sh
$ build/install/cli/bin/cli ams adminAccountGet \
    --namespace <namespace value>
```

### Operation AdminAccountCreate

```sh
$ build/install/cli/bin/cli ams adminAccountCreate \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminAccountLinkTokenGet

```sh
$ build/install/cli/bin/cli ams adminAccountLinkTokenGet \
    --namespace <namespace value>
```

### Operation AdminAccountLink

```sh
$ build/install/cli/bin/cli ams adminAccountLink \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ArtifactGet

```sh
$ build/install/cli/bin/cli ams artifactGet \
    --namespace <namespace value> \
    --artifactType <artifactType value - optional> \
    --count <count value - optional> \
    --endDate <endDate value - optional> \
    --fleetID <fleetID value - optional> \
    --imageID <imageID value - optional> \
    --maxSize <maxSize value - optional> \
    --minSize <minSize value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --serverId <serverId value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional> \
    --startDate <startDate value - optional> \
    --status <status value - optional>
```

### Operation ArtifactBulkDelete

```sh
$ build/install/cli/bin/cli ams artifactBulkDelete \
    --namespace <namespace value> \
    --artifactType <artifactType value - optional> \
    --fleetId <fleetId value - optional> \
    --uploadedBefore <uploadedBefore value - optional>
```

### Operation ArtifactUsageGet

```sh
$ build/install/cli/bin/cli ams artifactUsageGet \
    --namespace <namespace value>
```

### Operation ArtifactDelete

```sh
$ build/install/cli/bin/cli ams artifactDelete \
    --artifactID <artifactID value> \
    --namespace <namespace value>
```

### Operation ArtifactGetURL

```sh
$ build/install/cli/bin/cli ams artifactGetURL \
    --artifactID <artifactID value> \
    --namespace <namespace value>
```

### Operation DevelopmentServerConfigurationList

```sh
$ build/install/cli/bin/cli ams developmentServerConfigurationList \
    --namespace <namespace value> \
    --count <count value - optional> \
    --imageId <imageId value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional>
```

### Operation DevelopmentServerConfigurationCreate

```sh
$ build/install/cli/bin/cli ams developmentServerConfigurationCreate \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DevelopmentServerConfigurationGet

```sh
$ build/install/cli/bin/cli ams developmentServerConfigurationGet \
    --developmentServerConfigID <developmentServerConfigID value> \
    --namespace <namespace value>
```

### Operation DevelopmentServerConfigurationDelete

```sh
$ build/install/cli/bin/cli ams developmentServerConfigurationDelete \
    --developmentServerConfigID <developmentServerConfigID value> \
    --namespace <namespace value>
```

### Operation DevelopmentServerConfigurationPatch

```sh
$ build/install/cli/bin/cli ams developmentServerConfigurationPatch \
    --developmentServerConfigID <developmentServerConfigID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation FleetList

```sh
$ build/install/cli/bin/cli ams fleetList \
    --namespace <namespace value> \
    --active <active value - optional> \
    --count <count value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional>
```

### Operation FleetCreate

```sh
$ build/install/cli/bin/cli ams fleetCreate \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation FleetGet

```sh
$ build/install/cli/bin/cli ams fleetGet \
    --fleetID <fleetID value> \
    --namespace <namespace value>
```

### Operation FleetUpdate

```sh
$ build/install/cli/bin/cli ams fleetUpdate \
    --fleetID <fleetID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation FleetDelete

```sh
$ build/install/cli/bin/cli ams fleetDelete \
    --fleetID <fleetID value> \
    --namespace <namespace value>
```

### Operation FleetArtifactSamplingRulesGet

```sh
$ build/install/cli/bin/cli ams fleetArtifactSamplingRulesGet \
    --fleetID <fleetID value> \
    --namespace <namespace value>
```

### Operation FleetArtifactSamplingRulesSet

```sh
$ build/install/cli/bin/cli ams fleetArtifactSamplingRulesSet \
    --fleetID <fleetID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation FleetServers

```sh
$ build/install/cli/bin/cli ams fleetServers \
    --fleetID <fleetID value> \
    --namespace <namespace value> \
    --count <count value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --serverId <serverId value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional> \
    --status <status value - optional>
```

### Operation FleetServerHistory

```sh
$ build/install/cli/bin/cli ams fleetServerHistory \
    --fleetID <fleetID value> \
    --namespace <namespace value> \
    --count <count value - optional> \
    --offset <offset value - optional> \
    --reason <reason value - optional> \
    --region <region value - optional> \
    --serverId <serverId value - optional> \
    --sortDirection <sortDirection value - optional> \
    --status <status value - optional>
```

### Operation ImageList

```sh
$ build/install/cli/bin/cli ams imageList \
    --namespace <namespace value> \
    --count <count value - optional> \
    --inUse <inUse value - optional> \
    --isProtected <isProtected value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional> \
    --status <status value - optional> \
    --tag <tag value - optional>
```

### Operation ImagesStorage

```sh
$ build/install/cli/bin/cli ams imagesStorage \
    --namespace <namespace value>
```

### Operation ImageGet

```sh
$ build/install/cli/bin/cli ams imageGet \
    --imageID <imageID value> \
    --namespace <namespace value>
```

### Operation ImageMarkForDeletion

```sh
$ build/install/cli/bin/cli ams imageMarkForDeletion \
    --imageID <imageID value> \
    --namespace <namespace value>
```

### Operation ImagePatch

```sh
$ build/install/cli/bin/cli ams imagePatch \
    --imageID <imageID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ImageUnmarkForDeletion

```sh
$ build/install/cli/bin/cli ams imageUnmarkForDeletion \
    --imageID <imageID value> \
    --namespace <namespace value>
```

### Operation QoSRegionsGet

```sh
$ build/install/cli/bin/cli ams qoSRegionsGet \
    --namespace <namespace value> \
    --status <status value - optional>
```

### Operation QoSRegionsUpdate

```sh
$ build/install/cli/bin/cli ams qoSRegionsUpdate \
    --namespace <namespace value> \
    --region <region value> \
    --body <json string for request body>
```

### Operation InfoRegions

```sh
$ build/install/cli/bin/cli ams infoRegions \
    --namespace <namespace value>
```

### Operation FleetServerInfo

```sh
$ build/install/cli/bin/cli ams fleetServerInfo \
    --namespace <namespace value> \
    --serverID <serverID value>
```

### Operation FleetServerConnectionInfo

```sh
$ build/install/cli/bin/cli ams fleetServerConnectionInfo \
    --namespace <namespace value> \
    --serverID <serverID value>
```

### Operation ServerHistory

```sh
$ build/install/cli/bin/cli ams serverHistory \
    --namespace <namespace value> \
    --serverID <serverID value>
```

### Operation InfoSupportedInstances

```sh
$ build/install/cli/bin/cli ams infoSupportedInstances \
    --namespace <namespace value>
```

### Operation AccountGet

```sh
$ build/install/cli/bin/cli ams accountGet \
    --namespace <namespace value>
```

### Operation FleetClaimByID

```sh
$ build/install/cli/bin/cli ams fleetClaimByID \
    --fleetID <fleetID value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation LocalWatchdogConnect

```sh
$ build/install/cli/bin/cli ams localWatchdogConnect \
    --namespace <namespace value> \
    --watchdogID <watchdogID value>
```

### Operation FleetClaimByKeys

```sh
$ build/install/cli/bin/cli ams fleetClaimByKeys \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation WatchdogConnect

```sh
$ build/install/cli/bin/cli ams watchdogConnect \
    --namespace <namespace value> \
    --watchdogID <watchdogID value>
```

### Operation UploadURLGet

```sh
$ build/install/cli/bin/cli ams uploadURLGet
```

### Operation Func1

```sh
$ build/install/cli/bin/cli ams func1
```

### Operation BasicHealthCheck

```sh
$ build/install/cli/bin/cli ams basicHealthCheck
```


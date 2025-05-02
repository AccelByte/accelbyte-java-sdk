## Java Extend SDK CLI Sample App Operation Index for Dsmc service

### Operation ListConfig

```sh
$ build/install/cli/bin/cli dsmc listConfig
```

### Operation UpdateImage

```sh
$ build/install/cli/bin/cli dsmc updateImage \
    --body <json string for request body>
```

### Operation CreateImage

```sh
$ build/install/cli/bin/cli dsmc createImage \
    --body <json string for request body>
```

### Operation CreateImagePatch

```sh
$ build/install/cli/bin/cli dsmc createImagePatch \
    --body <json string for request body>
```

### Operation GetLowestInstanceSpec

```sh
$ build/install/cli/bin/cli dsmc getLowestInstanceSpec
```

### Operation GetWorkerConfig

```sh
$ build/install/cli/bin/cli dsmc getWorkerConfig \
    --namespace <namespace value>
```

### Operation UpdateWorkerConfig

```sh
$ build/install/cli/bin/cli dsmc updateWorkerConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateWorkerConfig

```sh
$ build/install/cli/bin/cli dsmc createWorkerConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetConfig

```sh
$ build/install/cli/bin/cli dsmc getConfig \
    --namespace <namespace value>
```

### Operation CreateConfig

```sh
$ build/install/cli/bin/cli dsmc createConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteConfig

```sh
$ build/install/cli/bin/cli dsmc deleteConfig \
    --namespace <namespace value>
```

### Operation UpdateConfig

```sh
$ build/install/cli/bin/cli dsmc updateConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ClearCache

```sh
$ build/install/cli/bin/cli dsmc clearCache \
    --namespace <namespace value>
```

### Operation GetAllDeployment

```sh
$ build/install/cli/bin/cli dsmc getAllDeployment \
    --namespace <namespace value> \
    --name <name value - optional> \
    --count <count value> \
    --offset <offset value>
```

### Operation GetDeployment

```sh
$ build/install/cli/bin/cli dsmc getDeployment \
    --deployment <deployment value> \
    --namespace <namespace value>
```

### Operation CreateDeployment

```sh
$ build/install/cli/bin/cli dsmc createDeployment \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteDeployment

```sh
$ build/install/cli/bin/cli dsmc deleteDeployment \
    --deployment <deployment value> \
    --namespace <namespace value>
```

### Operation UpdateDeployment

```sh
$ build/install/cli/bin/cli dsmc updateDeployment \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateRootRegionOverride

```sh
$ build/install/cli/bin/cli dsmc createRootRegionOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --region <region value> \
    --body <json string for request body>
```

### Operation DeleteRootRegionOverride

```sh
$ build/install/cli/bin/cli dsmc deleteRootRegionOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --region <region value>
```

### Operation UpdateRootRegionOverride

```sh
$ build/install/cli/bin/cli dsmc updateRootRegionOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --region <region value> \
    --body <json string for request body>
```

### Operation CreateDeploymentOverride

```sh
$ build/install/cli/bin/cli dsmc createDeploymentOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --version <version value> \
    --body <json string for request body>
```

### Operation DeleteDeploymentOverride

```sh
$ build/install/cli/bin/cli dsmc deleteDeploymentOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --version <version value>
```

### Operation UpdateDeploymentOverride

```sh
$ build/install/cli/bin/cli dsmc updateDeploymentOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --version <version value> \
    --body <json string for request body>
```

### Operation CreateOverrideRegionOverride

```sh
$ build/install/cli/bin/cli dsmc createOverrideRegionOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --region <region value> \
    --version <version value> \
    --body <json string for request body>
```

### Operation DeleteOverrideRegionOverride

```sh
$ build/install/cli/bin/cli dsmc deleteOverrideRegionOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --region <region value> \
    --version <version value>
```

### Operation UpdateOverrideRegionOverride

```sh
$ build/install/cli/bin/cli dsmc updateOverrideRegionOverride \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --region <region value> \
    --version <version value> \
    --body <json string for request body>
```

### Operation DeleteCreatingServerCountQueue

```sh
$ build/install/cli/bin/cli dsmc deleteCreatingServerCountQueue \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --version <version value>
```

### Operation GetAllPodConfig

```sh
$ build/install/cli/bin/cli dsmc getAllPodConfig \
    --namespace <namespace value> \
    --count <count value> \
    --offset <offset value>
```

### Operation GetPodConfig

```sh
$ build/install/cli/bin/cli dsmc getPodConfig \
    --name <name value> \
    --namespace <namespace value>
```

### Operation CreatePodConfig

```sh
$ build/install/cli/bin/cli dsmc createPodConfig \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeletePodConfig

```sh
$ build/install/cli/bin/cli dsmc deletePodConfig \
    --name <name value> \
    --namespace <namespace value>
```

### Operation UpdatePodConfig

```sh
$ build/install/cli/bin/cli dsmc updatePodConfig \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AddPort

```sh
$ build/install/cli/bin/cli dsmc addPort \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeletePort

```sh
$ build/install/cli/bin/cli dsmc deletePort \
    --name <name value> \
    --namespace <namespace value>
```

### Operation UpdatePort

```sh
$ build/install/cli/bin/cli dsmc updatePort \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ListImages

```sh
$ build/install/cli/bin/cli dsmc listImages \
    --namespace <namespace value> \
    --q <q value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional> \
    --count <count value> \
    --offset <offset value>
```

### Operation DeleteImage

```sh
$ build/install/cli/bin/cli dsmc deleteImage \
    --namespace <namespace value> \
    --imageURI <imageURI value> \
    --version <version value>
```

### Operation GetImageLimit

```sh
$ build/install/cli/bin/cli dsmc getImageLimit \
    --namespace <namespace value>
```

### Operation DeleteImagePatch

```sh
$ build/install/cli/bin/cli dsmc deleteImagePatch \
    --namespace <namespace value> \
    --imageURI <imageURI value> \
    --version <version value> \
    --versionPatch <versionPatch value>
```

### Operation GetImageDetail

```sh
$ build/install/cli/bin/cli dsmc getImageDetail \
    --namespace <namespace value> \
    --version <version value>
```

### Operation GetImagePatches

```sh
$ build/install/cli/bin/cli dsmc getImagePatches \
    --namespace <namespace value> \
    --version <version value>
```

### Operation GetImagePatchDetail

```sh
$ build/install/cli/bin/cli dsmc getImagePatchDetail \
    --namespace <namespace value> \
    --version <version value> \
    --versionPatch <versionPatch value>
```

### Operation AddBuffer

```sh
$ build/install/cli/bin/cli dsmc addBuffer \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetRepository

```sh
$ build/install/cli/bin/cli dsmc getRepository \
    --namespace <namespace value>
```

### Operation ListServer

```sh
$ build/install/cli/bin/cli dsmc listServer \
    --namespace <namespace value> \
    --region <region value - optional> \
    --count <count value> \
    --offset <offset value>
```

### Operation CountServer

```sh
$ build/install/cli/bin/cli dsmc countServer \
    --namespace <namespace value>
```

### Operation CountServerDetailed

```sh
$ build/install/cli/bin/cli dsmc countServerDetailed \
    --namespace <namespace value> \
    --region <region value - optional>
```

### Operation ListLocalServer

```sh
$ build/install/cli/bin/cli dsmc listLocalServer \
    --namespace <namespace value>
```

### Operation DeleteLocalServer

```sh
$ build/install/cli/bin/cli dsmc deleteLocalServer \
    --name <name value> \
    --namespace <namespace value>
```

### Operation GetServer

```sh
$ build/install/cli/bin/cli dsmc getServer \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation DeleteServer

```sh
$ build/install/cli/bin/cli dsmc deleteServer \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation ListSession

```sh
$ build/install/cli/bin/cli dsmc listSession \
    --namespace <namespace value> \
    --region <region value - optional> \
    --withServer <withServer value - optional> \
    --count <count value> \
    --offset <offset value>
```

### Operation CountSession

```sh
$ build/install/cli/bin/cli dsmc countSession \
    --namespace <namespace value> \
    --region <region value - optional>
```

### Operation DeleteSession

```sh
$ build/install/cli/bin/cli dsmc deleteSession \
    --namespace <namespace value> \
    --sessionID <sessionID value>
```

### Operation RunGhostCleanerRequestHandler

```sh
$ build/install/cli/bin/cli dsmc runGhostCleanerRequestHandler \
    --namespace <namespace value>
```

### Operation RunZombieCleanerRequestHandler

```sh
$ build/install/cli/bin/cli dsmc runZombieCleanerRequestHandler \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateRepository

```sh
$ build/install/cli/bin/cli dsmc createRepository \
    --body <json string for request body>
```

### Operation ExportConfigV1

```sh
$ build/install/cli/bin/cli dsmc exportConfigV1 \
    --namespace <namespace value>
```

### Operation ImportConfigV1

```sh
$ build/install/cli/bin/cli dsmc importConfigV1 \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation GetAllDeploymentClient

```sh
$ build/install/cli/bin/cli dsmc getAllDeploymentClient \
    --namespace <namespace value> \
    --name <name value - optional> \
    --count <count value> \
    --offset <offset value>
```

### Operation GetDeploymentClient

```sh
$ build/install/cli/bin/cli dsmc getDeploymentClient \
    --deployment <deployment value> \
    --namespace <namespace value>
```

### Operation CreateDeploymentClient

```sh
$ build/install/cli/bin/cli dsmc createDeploymentClient \
    --deployment <deployment value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteDeploymentClient

```sh
$ build/install/cli/bin/cli dsmc deleteDeploymentClient \
    --deployment <deployment value> \
    --namespace <namespace value>
```

### Operation GetAllPodConfigClient

```sh
$ build/install/cli/bin/cli dsmc getAllPodConfigClient \
    --namespace <namespace value> \
    --count <count value> \
    --offset <offset value>
```

### Operation CreatePodConfigClient

```sh
$ build/install/cli/bin/cli dsmc createPodConfigClient \
    --name <name value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeletePodConfigClient

```sh
$ build/install/cli/bin/cli dsmc deletePodConfigClient \
    --name <name value> \
    --namespace <namespace value>
```

### Operation ListImagesClient

```sh
$ build/install/cli/bin/cli dsmc listImagesClient \
    --namespace <namespace value> \
    --count <count value - optional> \
    --offset <offset value - optional> \
    --q <q value - optional> \
    --sortBy <sortBy value - optional> \
    --sortDirection <sortDirection value - optional>
```

### Operation ImageLimitClient

```sh
$ build/install/cli/bin/cli dsmc imageLimitClient \
    --namespace <namespace value>
```

### Operation ImageDetailClient

```sh
$ build/install/cli/bin/cli dsmc imageDetailClient \
    --namespace <namespace value> \
    --version <version value>
```

### Operation ListServerClient

```sh
$ build/install/cli/bin/cli dsmc listServerClient \
    --namespace <namespace value> \
    --region <region value - optional> \
    --count <count value> \
    --offset <offset value>
```

### Operation CountServerDetailedClient

```sh
$ build/install/cli/bin/cli dsmc countServerDetailedClient \
    --namespace <namespace value> \
    --region <region value - optional>
```

### Operation ServerHeartbeat

```sh
$ build/install/cli/bin/cli dsmc serverHeartbeat \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeregisterLocalServer

```sh
$ build/install/cli/bin/cli dsmc deregisterLocalServer \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RegisterLocalServer

```sh
$ build/install/cli/bin/cli dsmc registerLocalServer \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RegisterServer

```sh
$ build/install/cli/bin/cli dsmc registerServer \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ShutdownServer

```sh
$ build/install/cli/bin/cli dsmc shutdownServer \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetServerSessionTimeout

```sh
$ build/install/cli/bin/cli dsmc getServerSessionTimeout \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation GetServerSession

```sh
$ build/install/cli/bin/cli dsmc getServerSession \
    --namespace <namespace value> \
    --podName <podName value>
```

### Operation CreateSession

```sh
$ build/install/cli/bin/cli dsmc createSession \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ClaimServer

```sh
$ build/install/cli/bin/cli dsmc claimServer \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSession

```sh
$ build/install/cli/bin/cli dsmc getSession \
    --namespace <namespace value> \
    --sessionID <sessionID value>
```

### Operation CancelSession

```sh
$ build/install/cli/bin/cli dsmc cancelSession \
    --namespace <namespace value> \
    --sessionID <sessionID value>
```

### Operation GetDefaultProvider

```sh
$ build/install/cli/bin/cli dsmc getDefaultProvider
```

### Operation ListProviders

```sh
$ build/install/cli/bin/cli dsmc listProviders
```

### Operation ListProvidersByRegion

```sh
$ build/install/cli/bin/cli dsmc listProvidersByRegion \
    --region <region value>
```

### Operation PublicGetMessages

```sh
$ build/install/cli/bin/cli dsmc publicGetMessages
```


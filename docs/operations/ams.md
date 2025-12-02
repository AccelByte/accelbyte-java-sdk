# Ams Service Index

&nbsp;  

## Operations

### Auth Wrapper:  [Auth](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Auth.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/auth` | GET | AuthCheck | [AuthCheck](../../src/main/java/net/accelbyte/sdk/api/ams/operations/auth/AuthCheck.java) | [AuthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/auth/AuthCheck.java) |

### Fleet Commander Wrapper:  [FleetCommander](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/FleetCommander.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/healthz` | GET | PortalHealthCheck | [PortalHealthCheck](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleet_commander/PortalHealthCheck.java) | [PortalHealthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleet_commander/PortalHealthCheck.java) |
| `/ams/version` | GET | Func1 | [Func1](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleet_commander/Func1.java) | [Func1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleet_commander/Func1.java) |
| `/healthz` | GET | BasicHealthCheck | [BasicHealthCheck](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleet_commander/BasicHealthCheck.java) | [BasicHealthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleet_commander/BasicHealthCheck.java) |

### Account Wrapper:  [Account](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Account.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/account` | GET | AdminAccountGet | [AdminAccountGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountGet.java) | [AdminAccountGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/account` | POST | AdminAccountCreate | [AdminAccountCreate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountCreate.java) | [AdminAccountCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/account/link` | GET | AdminAccountLinkTokenGet | [AdminAccountLinkTokenGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountLinkTokenGet.java) | [AdminAccountLinkTokenGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountLinkTokenGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/account/link` | POST | AdminAccountLink | [AdminAccountLink](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountLink.java) | [AdminAccountLink](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountLink.java) |
| `/ams/v1/namespaces/{namespace}/account` | GET | AccountGet | [AccountGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AccountGet.java) | [AccountGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AccountGet.java) |

### Artifacts Wrapper:  [Artifacts](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Artifacts.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/artifacts` | GET | ArtifactGet | [ArtifactGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactGet.java) | [ArtifactGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts` | DELETE | ArtifactBulkDelete | [ArtifactBulkDelete](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactBulkDelete.java) | [ArtifactBulkDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactBulkDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts/usage` | GET | ArtifactUsageGet | [ArtifactUsageGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactUsageGet.java) | [ArtifactUsageGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactUsageGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts/{artifactID}` | DELETE | ArtifactDelete | [ArtifactDelete](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactDelete.java) | [ArtifactDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts/{artifactID}/url` | GET | ArtifactGetURL | [ArtifactGetURL](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactGetURL.java) | [ArtifactGetURL](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactGetURL.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/artifacts-sampling-rules` | GET | FleetArtifactSamplingRulesGet | [FleetArtifactSamplingRulesGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/FleetArtifactSamplingRulesGet.java) | [FleetArtifactSamplingRulesGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/FleetArtifactSamplingRulesGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/artifacts-sampling-rules` | PUT | FleetArtifactSamplingRulesSet | [FleetArtifactSamplingRulesSet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/FleetArtifactSamplingRulesSet.java) | [FleetArtifactSamplingRulesSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/FleetArtifactSamplingRulesSet.java) |

### Development Wrapper:  [Development](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Development.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations` | GET | DevelopmentServerConfigurationList | [DevelopmentServerConfigurationList](../../src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationList.java) | [DevelopmentServerConfigurationList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationList.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations` | POST | DevelopmentServerConfigurationCreate | [DevelopmentServerConfigurationCreate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationCreate.java) | [DevelopmentServerConfigurationCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations/{developmentServerConfigID}` | GET | DevelopmentServerConfigurationGet | [DevelopmentServerConfigurationGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationGet.java) | [DevelopmentServerConfigurationGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations/{developmentServerConfigID}` | DELETE | DevelopmentServerConfigurationDelete | [DevelopmentServerConfigurationDelete](../../src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationDelete.java) | [DevelopmentServerConfigurationDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations/{developmentServerConfigID}` | PATCH | DevelopmentServerConfigurationPatch | [DevelopmentServerConfigurationPatch](../../src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationPatch.java) | [DevelopmentServerConfigurationPatch](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationPatch.java) |

### Fleets Wrapper:  [Fleets](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Fleets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/fleets` | GET | FleetList | [FleetList](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetList.java) | [FleetList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetList.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets` | POST | FleetCreate | [FleetCreate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetCreate.java) | [FleetCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets` | DELETE | BulkFleetDelete | [BulkFleetDelete](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/BulkFleetDelete.java) | [BulkFleetDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/BulkFleetDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}` | GET | FleetGet | [FleetGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetGet.java) | [FleetGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}` | PUT | FleetUpdate | [FleetUpdate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetUpdate.java) | [FleetUpdate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetUpdate.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}` | DELETE | FleetDelete | [FleetDelete](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetDelete.java) | [FleetDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/servers` | GET | FleetServers | [FleetServers](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetServers.java) | [FleetServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetServers.java) |
| `/ams/v1/namespaces/{namespace}/fleets/{fleetID}/claim` | PUT | FleetClaimByID | [FleetClaimByID](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetClaimByID.java) | [FleetClaimByID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetClaimByID.java) |
| `/ams/v1/namespaces/{namespace}/servers/claim` | PUT | FleetClaimByKeys | [FleetClaimByKeys](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetClaimByKeys.java) | [FleetClaimByKeys](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetClaimByKeys.java) |

### Servers Wrapper:  [Servers](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Servers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/servers/history` | GET | FleetServerHistory | [FleetServerHistory](../../src/main/java/net/accelbyte/sdk/api/ams/operations/servers/FleetServerHistory.java) | [FleetServerHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/FleetServerHistory.java) |
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}` | GET | FleetServerInfo | [FleetServerInfo](../../src/main/java/net/accelbyte/sdk/api/ams/operations/servers/FleetServerInfo.java) | [FleetServerInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/FleetServerInfo.java) |
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}/connectioninfo` | GET | FleetServerConnectionInfo | [FleetServerConnectionInfo](../../src/main/java/net/accelbyte/sdk/api/ams/operations/servers/FleetServerConnectionInfo.java) | [FleetServerConnectionInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/FleetServerConnectionInfo.java) |
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}/history` | GET | ServerHistory | [ServerHistory](../../src/main/java/net/accelbyte/sdk/api/ams/operations/servers/ServerHistory.java) | [ServerHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/ServerHistory.java) |

### Images Wrapper:  [Images](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Images.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/images` | GET | ImageList | [ImageList](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageList.java) | [ImageList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageList.java) |
| `/ams/v1/admin/namespaces/{namespace}/images-storage` | GET | ImagesStorage | [ImagesStorage](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImagesStorage.java) | [ImagesStorage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImagesStorage.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | GET | ImageGet | [ImageGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageGet.java) | [ImageGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | DELETE | ImageMarkForDeletion | [ImageMarkForDeletion](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageMarkForDeletion.java) | [ImageMarkForDeletion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageMarkForDeletion.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | PATCH | ImagePatch | [ImagePatch](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImagePatch.java) | [ImagePatch](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImagePatch.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}/restore` | POST | ImageUnmarkForDeletion | [ImageUnmarkForDeletion](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageUnmarkForDeletion.java) | [ImageUnmarkForDeletion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageUnmarkForDeletion.java) |

### AMS QoS Wrapper:  [AMSQoS](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/AMSQoS.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/qos` | GET | QoSRegionsGet | [QoSRegionsGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_qo_s/QoSRegionsGet.java) | [QoSRegionsGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_qo_s/QoSRegionsGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/qos/{region}` | PATCH | QoSRegionsUpdate | [QoSRegionsUpdate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_qo_s/QoSRegionsUpdate.java) | [QoSRegionsUpdate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_qo_s/QoSRegionsUpdate.java) |

### AMS Info Wrapper:  [AMSInfo](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/AMSInfo.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/regions` | GET | InfoRegions | [InfoRegions](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/InfoRegions.java) | [InfoRegions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/InfoRegions.java) |
| `/ams/v1/admin/namespaces/{namespace}/supported-instances` | GET | InfoSupportedInstances | [InfoSupportedInstances](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/InfoSupportedInstances.java) | [InfoSupportedInstances](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/InfoSupportedInstances.java) |
| `/ams/v1/upload-url` | GET | UploadURLGet | [UploadURLGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/UploadURLGet.java) | [UploadURLGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/UploadURLGet.java) |

### Watchdogs Wrapper:  [Watchdogs](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Watchdogs.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/namespaces/{namespace}/local/{watchdogID}/connect` | GET | LocalWatchdogConnect | [LocalWatchdogConnect](../../src/main/java/net/accelbyte/sdk/api/ams/operations/watchdogs/LocalWatchdogConnect.java) | [LocalWatchdogConnect](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/watchdogs/LocalWatchdogConnect.java) |
| `/ams/v1/namespaces/{namespace}/watchdogs/{watchdogID}/connect` | GET | WatchdogConnect | [WatchdogConnect](../../src/main/java/net/accelbyte/sdk/api/ams/operations/watchdogs/WatchdogConnect.java) | [WatchdogConnect](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/watchdogs/WatchdogConnect.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `api.AMSRegionsResponse` | [ApiAMSRegionsResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAMSRegionsResponse.java) |
| `api.AccountCreateRequest` | [ApiAccountCreateRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountCreateRequest.java) |
| `api.AccountCreateResponse` | [ApiAccountCreateResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountCreateResponse.java) |
| `api.AccountLimits` | [ApiAccountLimits](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLimits.java) |
| `api.AccountLinkRequest` | [ApiAccountLinkRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkRequest.java) |
| `api.AccountLinkResponse` | [ApiAccountLinkResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkResponse.java) |
| `api.AccountLinkTokenResponse` | [ApiAccountLinkTokenResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkTokenResponse.java) |
| `api.AccountResponse` | [ApiAccountResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountResponse.java) |
| `api.ArtifactListResponse` | [ApiArtifactListResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactListResponse.java) |
| `api.ArtifactResponse` | [ApiArtifactResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactResponse.java) |
| `api.ArtifactSamplingRule` | [ApiArtifactSamplingRule](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactSamplingRule.java) |
| `api.ArtifactTypeSamplingRules` | [ApiArtifactTypeSamplingRules](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactTypeSamplingRules.java) |
| `api.ArtifactURLResponse` | [ApiArtifactURLResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactURLResponse.java) |
| `api.ArtifactUsageResponse` | [ApiArtifactUsageResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactUsageResponse.java) |
| `api.Capacity` | [ApiCapacity](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiCapacity.java) |
| `api.CoredumpSamplingRules` | [ApiCoredumpSamplingRules](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiCoredumpSamplingRules.java) |
| `api.DSHistoryEvent` | [ApiDSHistoryEvent](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHistoryEvent.java) |
| `api.DSHistoryList` | [ApiDSHistoryList](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHistoryList.java) |
| `api.DSHostConfiguration` | [ApiDSHostConfiguration](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHostConfiguration.java) |
| `api.DSHostConfigurationParameters` | [ApiDSHostConfigurationParameters](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHostConfigurationParameters.java) |
| `api.DevelopmentServerConfigurationCreateRequest` | [ApiDevelopmentServerConfigurationCreateRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationCreateRequest.java) |
| `api.DevelopmentServerConfigurationCreateResponse` | [ApiDevelopmentServerConfigurationCreateResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationCreateResponse.java) |
| `api.DevelopmentServerConfigurationGetResponse` | [ApiDevelopmentServerConfigurationGetResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationGetResponse.java) |
| `api.DevelopmentServerConfigurationListResponse` | [ApiDevelopmentServerConfigurationListResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationListResponse.java) |
| `api.DevelopmentServerConfigurationUpdateRequest` | [ApiDevelopmentServerConfigurationUpdateRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationUpdateRequest.java) |
| `api.FleetArtifactsSampleRules` | [ApiFleetArtifactsSampleRules](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetArtifactsSampleRules.java) |
| `api.FleetBulkActionErrorItemResponse` | [ApiFleetBulkActionErrorItemResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetBulkActionErrorItemResponse.java) |
| `api.FleetBulkDeleteRequest` | [ApiFleetBulkDeleteRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetBulkDeleteRequest.java) |
| `api.FleetBulkDeleteResponse` | [ApiFleetBulkDeleteResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetBulkDeleteResponse.java) |
| `api.FleetClaimByKeysReq` | [ApiFleetClaimByKeysReq](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimByKeysReq.java) |
| `api.FleetClaimReq` | [ApiFleetClaimReq](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimReq.java) |
| `api.FleetClaimResponse` | [ApiFleetClaimResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimResponse.java) |
| `api.FleetCreateResponse` | [ApiFleetCreateResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetCreateResponse.java) |
| `api.FleetGetResponse` | [ApiFleetGetResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetGetResponse.java) |
| `api.FleetListItemResponse` | [ApiFleetListItemResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetListItemResponse.java) |
| `api.FleetListResponse` | [ApiFleetListResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetListResponse.java) |
| `api.FleetParameters` | [ApiFleetParameters](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetParameters.java) |
| `api.FleetRegionalServerCounts` | [ApiFleetRegionalServerCounts](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetRegionalServerCounts.java) |
| `api.FleetServerConnectionInfoResponse` | [ApiFleetServerConnectionInfoResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerConnectionInfoResponse.java) |
| `api.FleetServerHistoryEventResponse` | [ApiFleetServerHistoryEventResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerHistoryEventResponse.java) |
| `api.FleetServerHistoryResponse` | [ApiFleetServerHistoryResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerHistoryResponse.java) |
| `api.FleetServerInfoResponse` | [ApiFleetServerInfoResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerInfoResponse.java) |
| `api.FleetServersResponse` | [ApiFleetServersResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServersResponse.java) |
| `api.ImageDeploymentProfile` | [ApiImageDeploymentProfile](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageDeploymentProfile.java) |
| `api.ImageDetails` | [ApiImageDetails](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageDetails.java) |
| `api.ImageList` | [ApiImageList](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageList.java) |
| `api.ImageListItem` | [ApiImageListItem](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageListItem.java) |
| `api.ImageStorage` | [ApiImageStorage](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageStorage.java) |
| `api.ImageUpdate` | [ApiImageUpdate](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageUpdate.java) |
| `api.InstanceType` | [ApiInstanceType](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiInstanceType.java) |
| `api.InstanceTypesResponse` | [ApiInstanceTypesResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiInstanceTypesResponse.java) |
| `api.PagingInfo` | [ApiPagingInfo](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiPagingInfo.java) |
| `api.PortConfiguration` | [ApiPortConfiguration](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiPortConfiguration.java) |
| `api.QoSEndpointResponse` | [ApiQoSEndpointResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiQoSEndpointResponse.java) |
| `api.QoSServer` | [ApiQoSServer](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiQoSServer.java) |
| `api.ReferencingFleet` | [ApiReferencingFleet](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiReferencingFleet.java) |
| `api.RegionConfig` | [ApiRegionConfig](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiRegionConfig.java) |
| `api.Timeout` | [ApiTimeout](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiTimeout.java) |
| `api.UpdateServerRequest` | [ApiUpdateServerRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiUpdateServerRequest.java) |
| `pagination.PaginationInfo` | [PaginationPaginationInfo](../../src/main/java/net/accelbyte/sdk/api/ams/models/PaginationPaginationInfo.java) |
| `response.ErrorResponse` | [ResponseErrorResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ResponseErrorResponse.java) |

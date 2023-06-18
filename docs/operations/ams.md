# Ams Service Index

&nbsp;  

## Operations

### Account Wrapper:  [Account](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Account.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/account` | GET | AccountGet | [AccountGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AccountGet.java) | [AccountGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AccountGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/account` | POST | AccountCreate | [AccountCreate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AccountCreate.java) | [AccountCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AccountCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/account/link` | GET | AccountLinkTokenGet | [AccountLinkTokenGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AccountLinkTokenGet.java) | [AccountLinkTokenGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AccountLinkTokenGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/account/link` | POST | AccountLink | [AccountLink](../../src/main/java/net/accelbyte/sdk/api/ams/operations/account/AccountLink.java) | [AccountLink](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AccountLink.java) |

### Fleets Wrapper:  [Fleets](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Fleets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/fleets` | GET | FleetList | [FleetList](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetList.java) | [FleetList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetList.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets` | POST | FleetCreate | [FleetCreate](../../src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetCreate.java) | [FleetCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetCreate.java) |
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
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}/history` | GET | ServerHistory | [ServerHistory](../../src/main/java/net/accelbyte/sdk/api/ams/operations/servers/ServerHistory.java) | [ServerHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/ServerHistory.java) |

### Images Wrapper:  [Images](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Images.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/images` | GET | ImageList | [ImageList](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageList.java) | [ImageList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageList.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | GET | ImageGet | [ImageGet](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageGet.java) | [ImageGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | PATCH | ImagePatch | [ImagePatch](../../src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImagePatch.java) | [ImagePatch](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImagePatch.java) |

### AMS Info Wrapper:  [AMSInfo](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/AMSInfo.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/regions` | GET | InfoRegions | [InfoRegions](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/InfoRegions.java) | [InfoRegions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/InfoRegions.java) |
| `/ams/v1/admin/namespaces/{namespace}/supported-instances` | GET | InfoSupportedInstances | [InfoSupportedInstances](../../src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/InfoSupportedInstances.java) | [InfoSupportedInstances](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/InfoSupportedInstances.java) |

### Watchdogs Wrapper:  [Watchdogs](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Watchdogs.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/namespaces/{namespace}/watchdogs/{watchdogID}/connect` | GET | WatchdogConnect | [WatchdogConnect](../../src/main/java/net/accelbyte/sdk/api/ams/operations/watchdogs/WatchdogConnect.java) | [WatchdogConnect](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/watchdogs/WatchdogConnect.java) |

### Operations Wrapper:  [Operations](../../src/main/java/net/accelbyte/sdk/api/ams/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/version` | GET | Func1 | [Func1](../../src/main/java/net/accelbyte/sdk/api/ams/operations/operations/Func1.java) | [Func1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/operations/Func1.java) |
| `/healthz` | GET | BasicHealthCheck | [BasicHealthCheck](../../src/main/java/net/accelbyte/sdk/api/ams/operations/operations/BasicHealthCheck.java) | [BasicHealthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/operations/BasicHealthCheck.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `api.AccountCreateRequest` | [ApiAccountCreateRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountCreateRequest.java) |
| `api.AccountCreateResponse` | [ApiAccountCreateResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountCreateResponse.java) |
| `api.AccountLinkRequest` | [ApiAccountLinkRequest](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkRequest.java) |
| `api.AccountLinkResponse` | [ApiAccountLinkResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkResponse.java) |
| `api.AccountLinkTokenResponse` | [ApiAccountLinkTokenResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkTokenResponse.java) |
| `api.AccountResponse` | [ApiAccountResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountResponse.java) |
| `api.AvailableInstanceTypesResponse` | [ApiAvailableInstanceTypesResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiAvailableInstanceTypesResponse.java) |
| `api.DSHistoryEvent` | [ApiDSHistoryEvent](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHistoryEvent.java) |
| `api.DSHistoryList` | [ApiDSHistoryList](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHistoryList.java) |
| `api.DSHostConfiguration` | [ApiDSHostConfiguration](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHostConfiguration.java) |
| `api.FleetClaimByKeysReq` | [ApiFleetClaimByKeysReq](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimByKeysReq.java) |
| `api.FleetClaimReq` | [ApiFleetClaimReq](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimReq.java) |
| `api.FleetClaimResponse` | [ApiFleetClaimResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimResponse.java) |
| `api.FleetCreateResponse` | [ApiFleetCreateResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetCreateResponse.java) |
| `api.FleetGetResponse` | [ApiFleetGetResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetGetResponse.java) |
| `api.FleetListItemResponse` | [ApiFleetListItemResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetListItemResponse.java) |
| `api.FleetListResponse` | [ApiFleetListResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetListResponse.java) |
| `api.FleetParameters` | [ApiFleetParameters](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetParameters.java) |
| `api.FleetRegionalServerCounts` | [ApiFleetRegionalServerCounts](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetRegionalServerCounts.java) |
| `api.FleetServerHistoryEventResponse` | [ApiFleetServerHistoryEventResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerHistoryEventResponse.java) |
| `api.FleetServerHistoryResponse` | [ApiFleetServerHistoryResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerHistoryResponse.java) |
| `api.FleetServerInfoResponse` | [ApiFleetServerInfoResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerInfoResponse.java) |
| `api.FleetServersResponse` | [ApiFleetServersResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServersResponse.java) |
| `api.ImageDeploymentProfile` | [ApiImageDeploymentProfile](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageDeploymentProfile.java) |
| `api.ImageDetails` | [ApiImageDetails](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageDetails.java) |
| `api.ImageList` | [ApiImageList](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageList.java) |
| `api.ImageListItem` | [ApiImageListItem](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageListItem.java) |
| `api.ImageUpdate` | [ApiImageUpdate](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageUpdate.java) |
| `api.InstanceTypeDescriptionResponse` | [ApiInstanceTypeDescriptionResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiInstanceTypeDescriptionResponse.java) |
| `api.PortConfiguration` | [ApiPortConfiguration](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiPortConfiguration.java) |
| `api.ReferencingFleet` | [ApiReferencingFleet](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiReferencingFleet.java) |
| `api.RegionConfig` | [ApiRegionConfig](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiRegionConfig.java) |
| `api.RegionsResponse` | [ApiRegionsResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiRegionsResponse.java) |
| `api.Timeout` | [ApiTimeout](../../src/main/java/net/accelbyte/sdk/api/ams/models/ApiTimeout.java) |
| `response.ErrorResponse` | [ResponseErrorResponse](../../src/main/java/net/accelbyte/sdk/api/ams/models/ResponseErrorResponse.java) |

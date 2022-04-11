# Dsmc Service Index

&nbsp;  

## Operations

### Config Wrapper:  [Config](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/Config.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/admin/configs` | GET | ListConfig | [ListConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/ListConfig.java) |
| `/dsmcontroller/admin/configs` | POST | SaveConfig | [SaveConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/SaveConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs` | GET | GetConfig | [GetConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/GetConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs` | POST | CreateConfig | [CreateConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/CreateConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs` | DELETE | DeleteConfig | [DeleteConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/DeleteConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs` | PATCH | UpdateConfig | [UpdateConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/UpdateConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/cache` | DELETE | ClearCache | [ClearCache](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/ClearCache.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/ports/{name}` | POST | AddPort | [AddPort](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/AddPort.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/ports/{name}` | DELETE | DeletePort | [DeletePort](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/DeletePort.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/ports/{name}` | PATCH | UpdatePort | [UpdatePort](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/UpdatePort.java) |
| `/dsmcontroller/admin/v1/namespaces/{namespace}/configs/export` | GET | ExportConfigV1 | [ExportConfigV1](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/ExportConfigV1.java) |
| `/dsmcontroller/admin/v1/namespaces/{namespace}/configs/import` | POST | ImportConfigV1 | [ImportConfigV1](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/config/ImportConfigV1.java) |

### Image Config Wrapper:  [ImageConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/ImageConfig.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/admin/images` | PUT | UpdateImage | [UpdateImage](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/UpdateImage.java) |
| `/dsmcontroller/admin/images` | POST | CreateImage | [CreateImage](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/CreateImage.java) |
| `/dsmcontroller/admin/images/import` | POST | ImportImages | [ImportImages](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/ImportImages.java) |
| `/dsmcontroller/admin/images/patches` | POST | CreateImagePatch | [CreateImagePatch](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/CreateImagePatch.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images` | GET | ListImages | [ListImages](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/ListImages.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images` | DELETE | DeleteImage | [DeleteImage](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/DeleteImage.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images/export` | GET | ExportImages | [ExportImages](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/ExportImages.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images/limit` | GET | GetImageLimit | [GetImageLimit](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/GetImageLimit.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images/patches` | DELETE | DeleteImagePatch | [DeleteImagePatch](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/DeleteImagePatch.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images/versions/{version}` | GET | GetImageDetail | [GetImageDetail](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/GetImageDetail.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images/versions/{version}/patches` | GET | GetImagePatches | [GetImagePatches](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/GetImagePatches.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/images/versions/{version}/patches/{versionPatch}` | GET | GetImagePatchDetail | [GetImagePatchDetail](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/GetImagePatchDetail.java) |
| `/dsmcontroller/namespaces/{namespace}/images/versions/{version}` | GET | ImageDetailClient | [ImageDetailClient](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/image_config/ImageDetailClient.java) |

### Deployment Config Wrapper:  [DeploymentConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/DeploymentConfig.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments` | GET | GetAllDeployment | [GetAllDeployment](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/GetAllDeployment.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}` | GET | GetDeployment | [GetDeployment](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/GetDeployment.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}` | POST | CreateDeployment | [CreateDeployment](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/CreateDeployment.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}` | DELETE | DeleteDeployment | [DeleteDeployment](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/DeleteDeployment.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}` | PATCH | UpdateDeployment | [UpdateDeployment](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/UpdateDeployment.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/regions/{region}` | POST | CreateRootRegionOverride | [CreateRootRegionOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/CreateRootRegionOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/regions/{region}` | DELETE | DeleteRootRegionOverride | [DeleteRootRegionOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/DeleteRootRegionOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/regions/{region}` | PATCH | UpdateRootRegionOverride | [UpdateRootRegionOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/UpdateRootRegionOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/version/{version}` | POST | CreateDeploymentOverride | [CreateDeploymentOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/CreateDeploymentOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}` | DELETE | DeleteDeploymentOverride | [DeleteDeploymentOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/DeleteDeploymentOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}` | PATCH | UpdateDeploymentOverride | [UpdateDeploymentOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/UpdateDeploymentOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}/regions/{region}` | POST | CreateOverrideRegionOverride | [CreateOverrideRegionOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/CreateOverrideRegionOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}/regions/{region}` | DELETE | DeleteOverrideRegionOverride | [DeleteOverrideRegionOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/DeleteOverrideRegionOverride.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}/regions/{region}` | PATCH | UpdateOverrideRegionOverride | [UpdateOverrideRegionOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/deployment_config/UpdateOverrideRegionOverride.java) |

### Pod Config Wrapper:  [PodConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/PodConfig.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/admin/namespaces/{namespace}/configs/pods` | GET | GetAllPodConfig | [GetAllPodConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/pod_config/GetAllPodConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/pods/{name}` | GET | GetPodConfig | [GetPodConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/pod_config/GetPodConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/pods/{name}` | POST | CreatePodConfig | [CreatePodConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/pod_config/CreatePodConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/pods/{name}` | DELETE | DeletePodConfig | [DeletePodConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/pod_config/DeletePodConfig.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/configs/pods/{name}` | PATCH | UpdatePodConfig | [UpdatePodConfig](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/pod_config/UpdatePodConfig.java) |

### Admin Wrapper:  [Admin](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/Admin.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/admin/namespaces/{namespace}/servers` | GET | ListServer | [ListServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/ListServer.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/count` | GET | CountServer | [CountServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/CountServer.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/count/detailed` | GET | CountServerDetailed | [CountServerDetailed](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/CountServerDetailed.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/local` | GET | ListLocalServer | [ListLocalServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/ListLocalServer.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/local/{name}` | DELETE | DeleteLocalServer | [DeleteLocalServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/DeleteLocalServer.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/{podName}` | GET | GetServer | [GetServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/GetServer.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/{podName}` | DELETE | DeleteServer | [DeleteServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/DeleteServer.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/servers/{podName}/logs` | GET | GetServerLogs | [GetServerLogs](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/GetServerLogs.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/sessions` | GET | ListSession | [ListSession](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/ListSession.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/sessions/count` | GET | CountSession | [CountSession](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/CountSession.java) |
| `/dsmcontroller/admin/namespaces/{namespace}/sessions/{sessionID}` | DELETE | DeleteSession | [DeleteSession](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/admin/DeleteSession.java) |

### Server Wrapper:  [Server](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/Server.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/namespaces/{namespace}/servers/local/deregister` | POST | DeregisterLocalServer | [DeregisterLocalServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/server/DeregisterLocalServer.java) |
| `/dsmcontroller/namespaces/{namespace}/servers/local/register` | POST | RegisterLocalServer | [RegisterLocalServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/server/RegisterLocalServer.java) |
| `/dsmcontroller/namespaces/{namespace}/servers/register` | POST | RegisterServer | [RegisterServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/server/RegisterServer.java) |
| `/dsmcontroller/namespaces/{namespace}/servers/shutdown` | POST | ShutdownServer | [ShutdownServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/server/ShutdownServer.java) |
| `/dsmcontroller/namespaces/{namespace}/servers/{podName}/session` | GET | GetServerSession | [GetServerSession](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/server/GetServerSession.java) |

### Session Wrapper:  [Session](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/Session.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/namespaces/{namespace}/sessions` | POST | CreateSession | [CreateSession](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/session/CreateSession.java) |
| `/dsmcontroller/namespaces/{namespace}/sessions/claim` | POST | ClaimServer | [ClaimServer](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/session/ClaimServer.java) |
| `/dsmcontroller/namespaces/{namespace}/sessions/{sessionID}` | GET | GetSession | [GetSession](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/session/GetSession.java) |

### Public Wrapper:  [Public](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/Public.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/public/provider/default` | GET | GetDefaultProvider | [GetDefaultProvider](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/public_/GetDefaultProvider.java) |
| `/dsmcontroller/public/providers` | GET | ListProviders | [ListProviders](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/public_/ListProviders.java) |
| `/dsmcontroller/public/providers/regions/{region}` | GET | ListProvidersByRegion | [ListProvidersByRegion](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/public_/ListProvidersByRegion.java) |

### Dsmc Operations Wrapper:  [DsmcOperations](../src/main/java/net/accelbyte/sdk/api/dsmc/wrappers/DsmcOperations.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/dsmcontroller/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../src/main/java/net/accelbyte/sdk/api/dsmc/operations/dsmc_operations/PublicGetMessages.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../src/main/java/net/accelbyte/sdk/api/dsmc/models/LogAppMessageDeclaration.java) |
| `models.ClaimSessionRequest` | [ModelsClaimSessionRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsClaimSessionRequest.java) |
| `models.CountServerResponse` | [ModelsCountServerResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCountServerResponse.java) |
| `models.CountSessionResponse` | [ModelsCountSessionResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCountSessionResponse.java) |
| `models.CreateDSMConfigRequest` | [ModelsCreateDSMConfigRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateDSMConfigRequest.java) |
| `models.CreateDeploymentOverrideRequest` | [ModelsCreateDeploymentOverrideRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateDeploymentOverrideRequest.java) |
| `models.CreateDeploymentRequest` | [ModelsCreateDeploymentRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateDeploymentRequest.java) |
| `models.CreateImagePatchRequest` | [ModelsCreateImagePatchRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateImagePatchRequest.java) |
| `models.CreateImageRequest` | [ModelsCreateImageRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateImageRequest.java) |
| `models.CreatePodConfigRequest` | [ModelsCreatePodConfigRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreatePodConfigRequest.java) |
| `models.CreatePortRequest` | [ModelsCreatePortRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreatePortRequest.java) |
| `models.CreateRegionOverrideRequest` | [ModelsCreateRegionOverrideRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateRegionOverrideRequest.java) |
| `models.CreateSessionRequest` | [ModelsCreateSessionRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsCreateSessionRequest.java) |
| `models.DSMConfigExport` | [ModelsDSMConfigExport](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDSMConfigExport.java) |
| `models.DSMConfigRecord` | [ModelsDSMConfigRecord](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDSMConfigRecord.java) |
| `models.DefaultProvider` | [ModelsDefaultProvider](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDefaultProvider.java) |
| `models.DeploymentConfigOverride` | [ModelsDeploymentConfigOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDeploymentConfigOverride.java) |
| `models.DeploymentWithOverride` | [ModelsDeploymentWithOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDeploymentWithOverride.java) |
| `models.DeregisterLocalServerRequest` | [ModelsDeregisterLocalServerRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDeregisterLocalServerRequest.java) |
| `models.DetailedCountServerResponse` | [ModelsDetailedCountServerResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsDetailedCountServerResponse.java) |
| `models.GetImageDetailResponse` | [ModelsGetImageDetailResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsGetImageDetailResponse.java) |
| `models.GetImageLimitResponse` | [ModelsGetImageLimitResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsGetImageLimitResponse.java) |
| `models.GetImageLimitResponseData` | [ModelsGetImageLimitResponseData](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsGetImageLimitResponseData.java) |
| `models.GetImagePatchDetailResponse` | [ModelsGetImagePatchDetailResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsGetImagePatchDetailResponse.java) |
| `models.ImageRecord` | [ModelsImageRecord](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsImageRecord.java) |
| `models.ImageRecordUpdate` | [ModelsImageRecordUpdate](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsImageRecordUpdate.java) |
| `models.ImportResponse` | [ModelsImportResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsImportResponse.java) |
| `models.ListConfigResponse` | [ModelsListConfigResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListConfigResponse.java) |
| `models.ListDeploymentResponse` | [ModelsListDeploymentResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListDeploymentResponse.java) |
| `models.ListImagePatchesResponse` | [ModelsListImagePatchesResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListImagePatchesResponse.java) |
| `models.ListImageResponse` | [ModelsListImageResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListImageResponse.java) |
| `models.ListPodConfigResponse` | [ModelsListPodConfigResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListPodConfigResponse.java) |
| `models.ListServerResponse` | [ModelsListServerResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListServerResponse.java) |
| `models.ListSessionResponse` | [ModelsListSessionResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsListSessionResponse.java) |
| `models.MatchResult.notification_payload` | [ModelsMatchResultNotificationPayload](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsMatchResultNotificationPayload.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsPagingCursor.java) |
| `models.PatchImageRecord` | [ModelsPatchImageRecord](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsPatchImageRecord.java) |
| `models.PodConfigRecord` | [ModelsPodConfigRecord](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsPodConfigRecord.java) |
| `models.PodCountConfigOverride` | [ModelsPodCountConfigOverride](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsPodCountConfigOverride.java) |
| `models.RegisterLocalServerRequest` | [ModelsRegisterLocalServerRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsRegisterLocalServerRequest.java) |
| `models.RegisterServerRequest` | [ModelsRegisterServerRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsRegisterServerRequest.java) |
| `models.RequestMatchMember` | [ModelsRequestMatchMember](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsRequestMatchMember.java) |
| `models.RequestMatchParty` | [ModelsRequestMatchParty](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsRequestMatchParty.java) |
| `models.RequestMatchingAlly` | [ModelsRequestMatchingAlly](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsRequestMatchingAlly.java) |
| `models.Server` | [ModelsServer](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsServer.java) |
| `models.ServerLogs` | [ModelsServerLogs](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsServerLogs.java) |
| `models.ServerSessionResponse` | [ModelsServerSessionResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsServerSessionResponse.java) |
| `models.Session` | [ModelsSession](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsSession.java) |
| `models.SessionResponse` | [ModelsSessionResponse](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsSessionResponse.java) |
| `models.ShutdownServerRequest` | [ModelsShutdownServerRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsShutdownServerRequest.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsStatusHistory.java) |
| `models.UpdateDSMConfigRequest` | [ModelsUpdateDSMConfigRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsUpdateDSMConfigRequest.java) |
| `models.UpdateDeploymentOverrideRequest` | [ModelsUpdateDeploymentOverrideRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsUpdateDeploymentOverrideRequest.java) |
| `models.UpdateDeploymentRequest` | [ModelsUpdateDeploymentRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsUpdateDeploymentRequest.java) |
| `models.UpdatePodConfigRequest` | [ModelsUpdatePodConfigRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsUpdatePodConfigRequest.java) |
| `models.UpdatePortRequest` | [ModelsUpdatePortRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsUpdatePortRequest.java) |
| `models.UpdateRegionOverrideRequest` | [ModelsUpdateRegionOverrideRequest](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ModelsUpdateRegionOverrideRequest.java) |
| `response.Error` | [ResponseError](../src/main/java/net/accelbyte/sdk/api/dsmc/models/ResponseError.java) |

# Dslogmanager Service Index

&nbsp;  

## Operations

### Admin Wrapper:  [Admin](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/Admin.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/admin/namespaces/{namespace}/servers/{podName}/logs` | GET | GetServerLogs | [GetServerLogs](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/admin/GetServerLogs.java) | [GetServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/admin/GetServerLogs.java) |

### Terminated Servers Wrapper:  [TerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/TerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/namespaces/{namespace}/servers/search` | GET | ListTerminatedServers | [ListTerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/terminated_servers/ListTerminatedServers.java) | [ListTerminatedServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/terminated_servers/ListTerminatedServers.java) |
| `/dslogmanager/namespaces/{namespace}/servers/{podName}/logs/download` | GET | DownloadServerLogs | [DownloadServerLogs](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/terminated_servers/DownloadServerLogs.java) | [DownloadServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/terminated_servers/DownloadServerLogs.java) |
| `/dslogmanager/namespaces/{namespace}/servers/{podName}/logs/exists` | GET | CheckServerLogs | [CheckServerLogs](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/terminated_servers/CheckServerLogs.java) | [CheckServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/terminated_servers/CheckServerLogs.java) |

### All Terminated Servers Wrapper:  [AllTerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/AllTerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/servers/logs/download` | POST | BatchDownloadServerLogs | [BatchDownloadServerLogs](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/all_terminated_servers/BatchDownloadServerLogs.java) | [BatchDownloadServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/all_terminated_servers/BatchDownloadServerLogs.java) |
| `/dslogmanager/servers/search` | GET | ListAllTerminatedServers | [ListAllTerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/all_terminated_servers/ListAllTerminatedServers.java) | [ListAllTerminatedServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/all_terminated_servers/ListAllTerminatedServers.java) |

### Dslogmanager Operations Wrapper:  [DslogmanagerOperations](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/DslogmanagerOperations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/dslogmanager_operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/dslogmanager_operations/PublicGetMessages.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/LogAppMessageDeclaration.java) |
| `models.AllocationEvent` | [ModelsAllocationEvent](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsAllocationEvent.java) |
| `models.BatchDownloadLogsRequest` | [ModelsBatchDownloadLogsRequest](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsBatchDownloadLogsRequest.java) |
| `models.DownloadLogsRequest` | [ModelsDownloadLogsRequest](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsDownloadLogsRequest.java) |
| `models.ListTerminatedServersResponse` | [ModelsListTerminatedServersResponse](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsListTerminatedServersResponse.java) |
| `models.LogFileStatus` | [ModelsLogFileStatus](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsLogFileStatus.java) |
| `models.MatchResult` | [ModelsMatchResult](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsMatchResult.java) |
| `models.NotifPayloadServerStatusChange` | [ModelsNotifPayloadServerStatusChange](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsNotifPayloadServerStatusChange.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsPagingCursor.java) |
| `models.RequestMatchMember` | [ModelsRequestMatchMember](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsRequestMatchMember.java) |
| `models.RequestMatchParty` | [ModelsRequestMatchParty](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsRequestMatchParty.java) |
| `models.RequestMatchingAlly` | [ModelsRequestMatchingAlly](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsRequestMatchingAlly.java) |
| `models.Server` | [ModelsServer](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsServer.java) |
| `models.ServerLogs` | [ModelsServerLogs](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsServerLogs.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsStatusHistory.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ResponseError.java) |

# Dsartifact Service Index

&nbsp;  

## Operations

### Artifact Upload Process Queue Wrapper:  [ArtifactUploadProcessQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/ArtifactUploadProcessQueue.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/artifacts/nodes/ipaddresses` | GET | ListNodesIPAddress | [ListNodesIPAddress](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListNodesIPAddress.java) | [ListNodesIPAddress](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListNodesIPAddress.java) |
| `/dsartifact/artifacts/nodes/ipaddresses` | DELETE | DeleteNodeByID | [DeleteNodeByID](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/DeleteNodeByID.java) | [DeleteNodeByID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/DeleteNodeByID.java) |
| `/dsartifact/artifacts/queues` | GET | ListQueue | [ListQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListQueue.java) | [ListQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListQueue.java) |
| `/dsartifact/artifacts/queues/active` | GET | GetActiveQueue | [GetActiveQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/GetActiveQueue.java) | [GetActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/GetActiveQueue.java) |
| `/dsartifact/artifacts/queues/active` | PUT | SetActiveQueue | [SetActiveQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/SetActiveQueue.java) | [SetActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/SetActiveQueue.java) |
| `/dsartifact/artifacts/queues/active` | DELETE | DeleteActiveQueue | [DeleteActiveQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/DeleteActiveQueue.java) | [DeleteActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/DeleteActiveQueue.java) |
| `/dsartifact/artifacts/queues/failed` | PUT | ReportFailedUpload | [ReportFailedUpload](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ReportFailedUpload.java) | [ReportFailedUpload](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ReportFailedUpload.java) |
| `/dsartifact/namespaces/{namespace}/artifacts/queues` | DELETE | DeleteQueue | [DeleteQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/DeleteQueue.java) | [DeleteQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/DeleteQueue.java) |
| `/dsartifact/namespaces/{namespace}/artifacts/queues/active/all` | GET | ListAllActiveQueue | [ListAllActiveQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListAllActiveQueue.java) | [ListAllActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListAllActiveQueue.java) |
| `/dsartifact/namespaces/{namespace}/artifacts/queues/all` | GET | ListAllQueue | [ListAllQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListAllQueue.java) | [ListAllQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListAllQueue.java) |

### Terminated Servers Wrapper:  [TerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/TerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/namespaces/{namespace}/servers/search` | GET | ListTerminatedServersWithNamespace | [ListTerminatedServersWithNamespace](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/terminated_servers/ListTerminatedServersWithNamespace.java) | [ListTerminatedServersWithNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/terminated_servers/ListTerminatedServersWithNamespace.java) |

### Download Server Artifact Wrapper:  [DownloadServerArtifact](../../src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/DownloadServerArtifact.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/namespaces/{namespace}/servers/{podName}/artifacts/download` | GET | DownloadServerArtifacts | [DownloadServerArtifacts](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/download_server_artifact/DownloadServerArtifacts.java) | [DownloadServerArtifacts](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/download_server_artifact/DownloadServerArtifacts.java) |
| `/dsartifact/namespaces/{namespace}/servers/{podName}/artifacts/exists` | GET | CheckServerArtifact | [CheckServerArtifact](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/download_server_artifact/CheckServerArtifact.java) | [CheckServerArtifact](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/download_server_artifact/CheckServerArtifact.java) |

### All Terminated Servers Wrapper:  [AllTerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/AllTerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/servers/search` | GET | ListTerminatedServers | [ListTerminatedServers](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/all_terminated_servers/ListTerminatedServers.java) | [ListTerminatedServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/all_terminated_servers/ListTerminatedServers.java) |

### Operations Wrapper:  [Operations](../../src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../src/main/java/net/accelbyte/sdk/api/dsartifact/operations/operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/operations/PublicGetMessages.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/LogAppMessageDeclaration.java) |
| `models.AllQueueResult` | [ModelsAllQueueResult](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsAllQueueResult.java) |
| `models.ArtifactFileStatus` | [ModelsArtifactFileStatus](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsArtifactFileStatus.java) |
| `models.ListAllQueueResponse` | [ModelsListAllQueueResponse](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListAllQueueResponse.java) |
| `models.ListNodesIPAddress` | [ModelsListNodesIPAddress](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListNodesIPAddress.java) |
| `models.ListQueueResponse` | [ModelsListQueueResponse](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListQueueResponse.java) |
| `models.ListTerminatedServersResponse` | [ModelsListTerminatedServersResponse](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListTerminatedServersResponse.java) |
| `models.MatchResult` | [ModelsMatchResult](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsMatchResult.java) |
| `models.NotifPayloadServerStatusChange` | [ModelsNotifPayloadServerStatusChange](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsNotifPayloadServerStatusChange.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsPagingCursor.java) |
| `models.Queue` | [ModelsQueue](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsQueue.java) |
| `models.QueueResult` | [ModelsQueueResult](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsQueueResult.java) |
| `models.RequestMatchMember` | [ModelsRequestMatchMember](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsRequestMatchMember.java) |
| `models.RequestMatchParty` | [ModelsRequestMatchParty](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsRequestMatchParty.java) |
| `models.RequestMatchingAlly` | [ModelsRequestMatchingAlly](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsRequestMatchingAlly.java) |
| `models.Server` | [ModelsServer](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsServer.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsStatusHistory.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/dsartifact/models/ResponseError.java) |

# Qosm Service Index

&nbsp;  

## Operations

### Admin Wrapper:  [Admin](../../src/main/java/net/accelbyte/sdk/api/qosm/wrappers/Admin.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/qosm/admin/namespaces/{namespace}/servers/{region}` | PATCH | UpdateServerConfig | [UpdateServerConfig](../../src/main/java/net/accelbyte/sdk/api/qosm/operations/admin/UpdateServerConfig.java) | [UpdateServerConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/qosm/admin/UpdateServerConfig.java) |
| `/qosm/admin/servers/{region}` | DELETE | DeleteServer | [DeleteServer](../../src/main/java/net/accelbyte/sdk/api/qosm/operations/admin/DeleteServer.java) | [DeleteServer](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/qosm/admin/DeleteServer.java) |
| `/qosm/admin/servers/{region}/alias` | POST | SetServerAlias | [SetServerAlias](../../src/main/java/net/accelbyte/sdk/api/qosm/operations/admin/SetServerAlias.java) | [SetServerAlias](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/qosm/admin/SetServerAlias.java) |

### Public Wrapper:  [Public](../../src/main/java/net/accelbyte/sdk/api/qosm/wrappers/Public.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/qosm/public/namespaces/{namespace}/qos` | GET | ListServerPerNamespace | [ListServerPerNamespace](../../src/main/java/net/accelbyte/sdk/api/qosm/operations/public_/ListServerPerNamespace.java) | [ListServerPerNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/qosm/public_/ListServerPerNamespace.java) |
| `/qosm/public/qos` | GET | ListServer | [ListServer](../../src/main/java/net/accelbyte/sdk/api/qosm/operations/public_/ListServer.java) | [ListServer](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/qosm/public_/ListServer.java) |

### Server Wrapper:  [Server](../../src/main/java/net/accelbyte/sdk/api/qosm/wrappers/Server.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/qosm/servers/heartbeat` | POST | Heartbeat | [Heartbeat](../../src/main/java/net/accelbyte/sdk/api/qosm/operations/server/Heartbeat.java) | [Heartbeat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/qosm/server/Heartbeat.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.HeartbeatRequest` | [ModelsHeartbeatRequest](../../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsHeartbeatRequest.java) |
| `models.ListServerResponse` | [ModelsListServerResponse](../../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsListServerResponse.java) |
| `models.Server` | [ModelsServer](../../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsServer.java) |
| `models.SetAliasRequest` | [ModelsSetAliasRequest](../../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsSetAliasRequest.java) |
| `models.UpdateServerRequest` | [ModelsUpdateServerRequest](../../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsUpdateServerRequest.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/qosm/models/ResponseError.java) |

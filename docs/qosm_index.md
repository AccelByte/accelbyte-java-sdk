# Qosm Service Index

&nbsp;  

## Operations

### Admin Wrapper:  [Admin](../src/main/java/net/accelbyte/sdk/api/qosm/wrappers/Admin.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/qosm/admin/servers/{region}` | DELETE | DeleteServer | [DeleteServer](../src/main/java/net/accelbyte/sdk/api/qosm/operations/admin/DeleteServer.java) |
| `/qosm/admin/servers/{region}/alias` | POST | SetServerAlias | [SetServerAlias](../src/main/java/net/accelbyte/sdk/api/qosm/operations/admin/SetServerAlias.java) |

### Public Wrapper:  [Public](../src/main/java/net/accelbyte/sdk/api/qosm/wrappers/Public.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/qosm/public/qos` | GET | ListServer | [ListServer](../src/main/java/net/accelbyte/sdk/api/qosm/operations/public_/ListServer.java) |

### Server Wrapper:  [Server](../src/main/java/net/accelbyte/sdk/api/qosm/wrappers/Server.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/qosm/servers/heartbeat` | POST | Heartbeat | [Heartbeat](../src/main/java/net/accelbyte/sdk/api/qosm/operations/server/Heartbeat.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.HeartbeatRequest` | [ModelsHeartbeatRequest](../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsHeartbeatRequest.java) |
| `models.ListServerResponse` | [ModelsListServerResponse](../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsListServerResponse.java) |
| `models.Server` | [ModelsServer](../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsServer.java) |
| `models.SetAliasRequest` | [ModelsSetAliasRequest](../src/main/java/net/accelbyte/sdk/api/qosm/models/ModelsSetAliasRequest.java) |
| `response.Error` | [ResponseError](../src/main/java/net/accelbyte/sdk/api/qosm/models/ResponseError.java) |
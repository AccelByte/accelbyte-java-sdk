# Cloudsave Service Index

&nbsp;  

## Operations

### AdminGameRecord Wrapper:  [AdminGameRecord](../src/main/java/net/accelbyte/sdk/api/cloudsave/wrappers/AdminGameRecord.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/cloudsave/v1/admin/namespaces/{namespace}/records` | GET | ListGameRecordsHandlerV1 | [ListGameRecordsHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_game_record/ListGameRecordsHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/records/{key}` | GET | AdminGetGameRecordHandlerV1 | [AdminGetGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_game_record/AdminGetGameRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/records/{key}` | PUT | AdminPutGameRecordHandlerV1 | [AdminPutGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_game_record/AdminPutGameRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/records/{key}` | POST | AdminPostGameRecordHandlerV1 | [AdminPostGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_game_record/AdminPostGameRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/records/{key}` | DELETE | AdminDeleteGameRecordHandlerV1 | [AdminDeleteGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_game_record/AdminDeleteGameRecordHandlerV1.java) |

### AdminPlayerRecord Wrapper:  [AdminPlayerRecord](../src/main/java/net/accelbyte/sdk/api/cloudsave/wrappers/AdminPlayerRecord.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/cloudsave/v1/admin/namespaces/{namespace}/users/records` | GET | ListPlayerRecordHandlerV1 | [ListPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/ListPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records` | GET | AdminRetrievePlayerRecords | [AdminRetrievePlayerRecords](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminRetrievePlayerRecords.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}` | GET | AdminGetPlayerRecordHandlerV1 | [AdminGetPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminGetPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}` | PUT | AdminPutPlayerRecordHandlerV1 | [AdminPutPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminPutPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}` | POST | AdminPostPlayerRecordHandlerV1 | [AdminPostPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminPostPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}` | DELETE | AdminDeletePlayerRecordHandlerV1 | [AdminDeletePlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminDeletePlayerRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}/public` | GET | AdminGetPlayerPublicRecordHandlerV1 | [AdminGetPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminGetPlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}/public` | PUT | AdminPutPlayerPublicRecordHandlerV1 | [AdminPutPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminPutPlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}/public` | POST | AdminPostPlayerPublicRecordHandlerV1 | [AdminPostPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminPostPlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}/public` | DELETE | AdminDeletePlayerPublicRecordHandlerV1 | [AdminDeletePlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/admin_player_record/AdminDeletePlayerPublicRecordHandlerV1.java) |

### ConcurrentRecord Wrapper:  [ConcurrentRecord](../src/main/java/net/accelbyte/sdk/api/cloudsave/wrappers/ConcurrentRecord.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/cloudsave/v1/namespaces/{namespace}/concurrent/records/{key}` | PUT | PutGameRecordConcurrentHandlerV1 | [PutGameRecordConcurrentHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/concurrent_record/PutGameRecordConcurrentHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/concurrent/records/{key}/public` | PUT | PutPlayerPublicRecordConcurrentHandlerV1 | [PutPlayerPublicRecordConcurrentHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/concurrent_record/PutPlayerPublicRecordConcurrentHandlerV1.java) |

### PublicGameRecord Wrapper:  [PublicGameRecord](../src/main/java/net/accelbyte/sdk/api/cloudsave/wrappers/PublicGameRecord.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/cloudsave/v1/namespaces/{namespace}/records/{key}` | GET | GetGameRecordHandlerV1 | [GetGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_game_record/GetGameRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/records/{key}` | PUT | PutGameRecordHandlerV1 | [PutGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_game_record/PutGameRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/records/{key}` | POST | PostGameRecordHandlerV1 | [PostGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_game_record/PostGameRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/records/{key}` | DELETE | DeleteGameRecordHandlerV1 | [DeleteGameRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_game_record/DeleteGameRecordHandlerV1.java) |

### PublicPlayerRecord Wrapper:  [PublicPlayerRecord](../src/main/java/net/accelbyte/sdk/api/cloudsave/wrappers/PublicPlayerRecord.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/cloudsave/v1/namespaces/{namespace}/users/bulk/records/{key}/public` | POST | BulkGetPlayerPublicRecordHandlerV1 | [BulkGetPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/BulkGetPlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/me/records/{key}/public` | DELETE | PublicDeletePlayerPublicRecordHandlerV1 | [PublicDeletePlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/PublicDeletePlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}` | GET | GetPlayerRecordHandlerV1 | [GetPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/GetPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}` | PUT | PutPlayerRecordHandlerV1 | [PutPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/PutPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}` | POST | PostPlayerRecordHandlerV1 | [PostPlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/PostPlayerRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}` | DELETE | DeletePlayerRecordHandlerV1 | [DeletePlayerRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/DeletePlayerRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}/public` | GET | GetPlayerPublicRecordHandlerV1 | [GetPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/GetPlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}/public` | PUT | PutPlayerPublicRecordHandlerV1 | [PutPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/PutPlayerPublicRecordHandlerV1.java) |
| `/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}/public` | POST | PostPlayerPublicRecordHandlerV1 | [PostPlayerPublicRecordHandlerV1](../src/main/java/net/accelbyte/sdk/api/cloudsave/operations/public_player_record/PostPlayerPublicRecordHandlerV1.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.BulkGetPlayerRecordResponse` | [ModelsBulkGetPlayerRecordResponse](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsBulkGetPlayerRecordResponse.java) |
| `models.BulkUserIDsRequest` | [ModelsBulkUserIDsRequest](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsBulkUserIDsRequest.java) |
| `models.ConcurrentRecordRequest` | [ModelsConcurrentRecordRequest](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsConcurrentRecordRequest.java) |
| `models.GameRecordRequest` | [ModelsGameRecordRequest](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsGameRecordRequest.java) |
| `models.GameRecordResponse` | [ModelsGameRecordResponse](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsGameRecordResponse.java) |
| `models.ListGameRecordKeysResponse` | [ModelsListGameRecordKeysResponse](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsListGameRecordKeysResponse.java) |
| `models.ListPlayerRecordKeysResponse` | [ModelsListPlayerRecordKeysResponse](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsListPlayerRecordKeysResponse.java) |
| `models.Pagination` | [ModelsPagination](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsPagination.java) |
| `models.PlayerRecordKeyInfo` | [ModelsPlayerRecordKeyInfo](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsPlayerRecordKeyInfo.java) |
| `models.PlayerRecordRequest` | [ModelsPlayerRecordRequest](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsPlayerRecordRequest.java) |
| `models.PlayerRecordResponse` | [ModelsPlayerRecordResponse](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsPlayerRecordResponse.java) |
| `models.ResponseError` | [ModelsResponseError](../src/main/java/net/accelbyte/sdk/api/cloudsave/models/ModelsResponseError.java) |
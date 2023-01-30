# Gametelemetry Service Index

&nbsp;  

## Operations

### telemetry Wrapper:  [Telemetry](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/wrappers/Telemetry.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/game-telemetry/v1/admin/namespaces/{namespace}/events` | GET | GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet | [GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/telemetry/GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.java) | [GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/telemetry/GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.java) |

### Gametelemetry Operations Wrapper:  [GametelemetryOperations](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/wrappers/GametelemetryOperations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/game-telemetry/v1/protected/events` | POST | ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost | [ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/gametelemetry_operations/ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.java) | [ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/gametelemetry_operations/ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.java) |
| `/game-telemetry/v1/protected/steamIds/{steamId}/playtime` | GET | ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet | [ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/gametelemetry_operations/ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.java) | [ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/gametelemetry_operations/ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.java) |
| `/game-telemetry/v1/protected/steamIds/{steamId}/playtime/{playtime}` | PUT | ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut | [ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/gametelemetry_operations/ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.java) | [ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/gametelemetry_operations/ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `HTTPValidationError` | [HTTPValidationError](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/models/HTTPValidationError.java) |
| `TelemetryBody` | [TelemetryBody](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/models/TelemetryBody.java) |
| `ValidationError` | [ValidationError](../../src/main/java/net/accelbyte/sdk/api/gametelemetry/models/ValidationError.java) |

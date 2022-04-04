# Gametelemetry Service Index

&nbsp;  

## Operations

### Operations Wrapper:  [Operations](../src/main/java/net/accelbyte/sdk/api/gametelemetry/wrappers/Operations.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/game-telemetry/v1/protected/events` | POST | ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost | [ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost](../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/operations/ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.java) |
| `/game-telemetry/v1/protected/steamIds/{steamId}/playtime` | GET | ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet | [ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet](../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/operations/ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.java) |
| `/game-telemetry/v1/protected/steamIds/{steamId}/playtime/{playtime}` | PUT | ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut | [ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut](../src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/operations/ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `HTTPValidationError` | [HTTPValidationError](../src/main/java/net/accelbyte/sdk/api/gametelemetry/models/HTTPValidationError.java) |
| `TelemetryBody` | [TelemetryBody](../src/main/java/net/accelbyte/sdk/api/gametelemetry/models/TelemetryBody.java) |
| `ValidationError` | [ValidationError](../src/main/java/net/accelbyte/sdk/api/gametelemetry/models/ValidationError.java) |

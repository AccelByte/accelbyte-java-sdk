<a name="v0.59.0"></a>
## [v0.59.0] - 2024-03-13

### BREAKING CHANGE

### Game Telemetry
The following operations have been updated:
- operation `net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet`
   - return type changed from `Map<String, ?>` to `PlayTimeResponse`
- operation `net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut`
  - return type changed from `void` to `PlayTimeResponse`
- operation `net.accelbyte.sdk.api.gametelemetry.operations.telemetry.GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet`
  - return type changed from `Map<String, ?>` to `PlayTimeResponse`
- operation `net.accelbyte.sdk.api.gametelemetry.operations.telemetry.GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet`
  - return type changed from `void` to `ListBaseResponseStr`

### Lobby
The following models have been updated:
- model `net.accelbyte.sdk.api.lobby.ws_models.MessageNotif`
  - field `sentAt` changed from `Integer` to `String`
- model `net.accelbyte.sdk.api.lobby.ws_models.PartyChatNotif`
  - field `sentAt` changed from `Integer` to `String`
- model `net.accelbyte.sdk.api.lobby.ws_models.PartyChatRequest`
  - field `receivedAt` changed from `Integer` to `String`
- model `net.accelbyte.sdk.api.lobby.ws_models.PartyDataUpdateNotif`
  - field `receivedAt` changed from `Integer` to `String`
- model `net.accelbyte.sdk.api.lobby.ws_models.PersonalChatNotif`
  - field `receivedAt` changed from `Integer` to `String`
- model `net.accelbyte.sdk.api.lobby.ws_models.PersonalChatRequest`
  - field `receivedAt` changed from `Integer` to `String`

### Session
The following models have been updated:
- model `net.accelbyte.sdk.api.session.operations.recent_player.PublicGetRecentPlayer`
  - input parameter `userId` is removed
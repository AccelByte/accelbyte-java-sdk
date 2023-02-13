# Sessionbrowser Service Index

&nbsp;  

## Operations

### Session Wrapper:  [Session](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/wrappers/Session.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession` | GET | AdminQuerySession | [AdminQuerySession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminQuerySession.java) | [AdminQuerySession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminQuerySession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/count` | GET | GetTotalActiveSession | [GetTotalActiveSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetTotalActiveSession.java) | [GetTotalActiveSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetTotalActiveSession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/custom-game` | GET | GetActiveCustomGameSessions | [GetActiveCustomGameSessions](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetActiveCustomGameSessions.java) | [GetActiveCustomGameSessions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetActiveCustomGameSessions.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/matchmaking-game` | GET | GetActiveMatchmakingGameSessions | [GetActiveMatchmakingGameSessions](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetActiveMatchmakingGameSessions.java) | [GetActiveMatchmakingGameSessions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetActiveMatchmakingGameSessions.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/{sessionID}` | GET | AdminGetSession | [AdminGetSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminGetSession.java) | [AdminGetSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminGetSession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/{sessionID}` | DELETE | AdminDeleteSession | [AdminDeleteSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminDeleteSession.java) | [AdminDeleteSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminDeleteSession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/sessions/history/search` | GET | AdminSearchSessionsV2 | [AdminSearchSessionsV2](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminSearchSessionsV2.java) | [AdminSearchSessionsV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminSearchSessionsV2.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/sessions/{matchID}/history/detailed` | GET | GetSessionHistoryDetailed | [GetSessionHistoryDetailed](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetSessionHistoryDetailed.java) | [GetSessionHistoryDetailed](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetSessionHistoryDetailed.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession` | GET | UserQuerySession | [UserQuerySession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/UserQuerySession.java) | [UserQuerySession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/UserQuerySession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession` | POST | CreateSession | [CreateSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/CreateSession.java) | [CreateSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/CreateSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/bulk` | GET | GetSessionByUserIDs | [GetSessionByUserIDs](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetSessionByUserIDs.java) | [GetSessionByUserIDs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetSessionByUserIDs.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}` | GET | GetSession | [GetSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetSession.java) | [GetSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}` | PUT | UpdateSession | [UpdateSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/UpdateSession.java) | [UpdateSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/UpdateSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}` | DELETE | DeleteSession | [DeleteSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/DeleteSession.java) | [DeleteSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/DeleteSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/join` | POST | JoinSession | [JoinSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/JoinSession.java) | [JoinSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/JoinSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/localds` | DELETE | DeleteSessionLocalDS | [DeleteSessionLocalDS](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/DeleteSessionLocalDS.java) | [DeleteSessionLocalDS](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/DeleteSessionLocalDS.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/player` | POST | AddPlayerToSession | [AddPlayerToSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AddPlayerToSession.java) | [AddPlayerToSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AddPlayerToSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/player/{userID}` | DELETE | RemovePlayerFromSession | [RemovePlayerFromSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/RemovePlayerFromSession.java) | [RemovePlayerFromSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/RemovePlayerFromSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/settings` | PUT | UpdateSettings | [UpdateSettings](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/UpdateSettings.java) | [UpdateSettings](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/UpdateSettings.java) |
| `/sessionbrowser/namespaces/{namespace}/recentplayer/{userID}` | GET | GetRecentPlayer | [GetRecentPlayer](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetRecentPlayer.java) | [GetRecentPlayer](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetRecentPlayer.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.ActiveCustomGameResponse` | [ModelsActiveCustomGameResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsActiveCustomGameResponse.java) |
| `models.ActiveMatchmakingGameResponse` | [ModelsActiveMatchmakingGameResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsActiveMatchmakingGameResponse.java) |
| `models.AddPlayerRequest` | [ModelsAddPlayerRequest](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsAddPlayerRequest.java) |
| `models.AddPlayerResponse` | [ModelsAddPlayerResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsAddPlayerResponse.java) |
| `models.AdminSessionResponse` | [ModelsAdminSessionResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsAdminSessionResponse.java) |
| `models.CountActiveSessionResponse` | [ModelsCountActiveSessionResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsCountActiveSessionResponse.java) |
| `models.CreateSessionRequest` | [ModelsCreateSessionRequest](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsCreateSessionRequest.java) |
| `models.CustomGameResponse` | [ModelsCustomGameResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsCustomGameResponse.java) |
| `models.GameSession` | [ModelsGameSession](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGameSession.java) |
| `models.GameSessionSetting` | [ModelsGameSessionSetting](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGameSessionSetting.java) |
| `models.GetSessionHistoryDetailedResponseItem` | [ModelsGetSessionHistoryDetailedResponseItem](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGetSessionHistoryDetailedResponseItem.java) |
| `models.GetSessionHistorySearchResponseItemV2` | [ModelsGetSessionHistorySearchResponseItemV2](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGetSessionHistorySearchResponseItemV2.java) |
| `models.GetSessionHistorySearchResponseV2` | [ModelsGetSessionHistorySearchResponseV2](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGetSessionHistorySearchResponseV2.java) |
| `models.JoinGameSessionRequest` | [ModelsJoinGameSessionRequest](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsJoinGameSessionRequest.java) |
| `models.MatchAttributes` | [ModelsMatchAttributes](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchAttributes.java) |
| `models.MatchMaking` | [ModelsMatchMaking](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchMaking.java) |
| `models.MatchingAlly` | [ModelsMatchingAlly](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchingAlly.java) |
| `models.MatchingParty` | [ModelsMatchingParty](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchingParty.java) |
| `models.Pagination` | [ModelsPagination](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsPagination.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsPagingCursor.java) |
| `models.PartyMember` | [ModelsPartyMember](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsPartyMember.java) |
| `models.RecentPlayerHistory` | [ModelsRecentPlayerHistory](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsRecentPlayerHistory.java) |
| `models.RecentPlayerQueryResponse` | [ModelsRecentPlayerQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsRecentPlayerQueryResponse.java) |
| `models.Server` | [ModelsServer](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsServer.java) |
| `models.SessionByUserIDsResponse` | [ModelsSessionByUserIDsResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionByUserIDsResponse.java) |
| `models.SessionPlayerHistory` | [ModelsSessionPlayerHistory](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionPlayerHistory.java) |
| `models.SessionPlayerJoining` | [ModelsSessionPlayerJoining](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionPlayerJoining.java) |
| `models.SessionQueryResponse` | [ModelsSessionQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionQueryResponse.java) |
| `models.SessionResponse` | [ModelsSessionResponse](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionResponse.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsStatusHistory.java) |
| `models.UpdateSessionRequest` | [ModelsUpdateSessionRequest](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsUpdateSessionRequest.java) |
| `models.UpdateSettingsRequest` | [ModelsUpdateSettingsRequest](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsUpdateSettingsRequest.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ResponseError.java) |
| `restapi.ErrorResponseV2` | [RestapiErrorResponseV2](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/RestapiErrorResponseV2.java) |
| `restapi.ErrorV1` | [RestapiErrorV1](../../src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/RestapiErrorV1.java) |

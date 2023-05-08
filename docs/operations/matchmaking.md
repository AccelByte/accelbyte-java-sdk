# Matchmaking Service Index

&nbsp;  

## Operations

### Matchmaking Operations Wrapper:  [MatchmakingOperations](../../src/main/java/net/accelbyte/sdk/api/matchmaking/wrappers/MatchmakingOperations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/healthz` | GET | GetHealthcheckInfo | [GetHealthcheckInfo](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking_operations/GetHealthcheckInfo.java) | [GetHealthcheckInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking_operations/GetHealthcheckInfo.java) |
| `/matchmaking/healthz` | GET | HandlerV3Healthz | [HandlerV3Healthz](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking_operations/HandlerV3Healthz.java) | [HandlerV3Healthz](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking_operations/HandlerV3Healthz.java) |
| `/matchmaking/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking_operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking_operations/PublicGetMessages.java) |
| `/matchmaking/version` | GET | VersionCheckHandler | [VersionCheckHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking_operations/VersionCheckHandler.java) | [VersionCheckHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking_operations/VersionCheckHandler.java) |

### Matchmaking Wrapper:  [Matchmaking](../../src/main/java/net/accelbyte/sdk/api/matchmaking/wrappers/Matchmaking.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/matchmaking/namespaces/{namespace}/channels` | GET | GetAllChannelsHandler | [GetAllChannelsHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetAllChannelsHandler.java) | [GetAllChannelsHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetAllChannelsHandler.java) |
| `/matchmaking/namespaces/{namespace}/channels` | POST | CreateChannelHandler | [CreateChannelHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/CreateChannelHandler.java) | [CreateChannelHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/CreateChannelHandler.java) |
| `/matchmaking/namespaces/{namespace}/channels/{channelName}/metrics` | GET | GetMatchPoolMetric | [GetMatchPoolMetric](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetMatchPoolMetric.java) | [GetMatchPoolMetric](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetMatchPoolMetric.java) |
| `/matchmaking/namespaces/{namespace}/channels/{channel}` | DELETE | DeleteChannelHandler | [DeleteChannelHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/DeleteChannelHandler.java) | [DeleteChannelHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/DeleteChannelHandler.java) |
| `/matchmaking/namespaces/{namespace}/matchresult` | POST | StoreMatchResults | [StoreMatchResults](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/StoreMatchResults.java) | [StoreMatchResults](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/StoreMatchResults.java) |
| `/matchmaking/namespaces/{namespace}/rebalance` | POST | Rebalance | [Rebalance](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/Rebalance.java) | [Rebalance](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/Rebalance.java) |
| `/matchmaking/namespaces/{namespace}/sessions` | POST | QueueSessionHandler | [QueueSessionHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/QueueSessionHandler.java) | [QueueSessionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/QueueSessionHandler.java) |
| `/matchmaking/namespaces/{namespace}/sessions/dequeue` | POST | DequeueSessionHandler | [DequeueSessionHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/DequeueSessionHandler.java) | [DequeueSessionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/DequeueSessionHandler.java) |
| `/matchmaking/namespaces/{namespace}/sessions/{matchID}/status` | GET | QuerySessionHandler | [QuerySessionHandler](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/QuerySessionHandler.java) | [QuerySessionHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/QuerySessionHandler.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/all/parties` | GET | GetAllPartyInAllChannel | [GetAllPartyInAllChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetAllPartyInAllChannel.java) | [GetAllPartyInAllChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetAllPartyInAllChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/all/sessions/bulk` | GET | BulkGetSessions | [BulkGetSessions](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/BulkGetSessions.java) | [BulkGetSessions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/BulkGetSessions.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/export` | GET | ExportChannels | [ExportChannels](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/ExportChannels.java) | [ExportChannels](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/ExportChannels.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/import` | POST | ImportChannels | [ImportChannels](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/ImportChannels.java) | [ImportChannels](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/ImportChannels.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}` | GET | GetSingleMatchmakingChannel | [GetSingleMatchmakingChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetSingleMatchmakingChannel.java) | [GetSingleMatchmakingChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetSingleMatchmakingChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}` | PATCH | UpdateMatchmakingChannel | [UpdateMatchmakingChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/UpdateMatchmakingChannel.java) | [UpdateMatchmakingChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/UpdateMatchmakingChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/parties` | GET | GetAllPartyInChannel | [GetAllPartyInChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetAllPartyInChannel.java) | [GetAllPartyInChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetAllPartyInChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/sessions` | GET | GetAllSessionsInChannel | [GetAllSessionsInChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetAllSessionsInChannel.java) | [GetAllSessionsInChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetAllSessionsInChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/sessions/{matchID}` | POST | AddUserIntoSessionInChannel | [AddUserIntoSessionInChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/AddUserIntoSessionInChannel.java) | [AddUserIntoSessionInChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/AddUserIntoSessionInChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/sessions/{matchID}` | DELETE | DeleteSessionInChannel | [DeleteSessionInChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/DeleteSessionInChannel.java) | [DeleteSessionInChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/DeleteSessionInChannel.java) |
| `/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/sessions/{matchID}/users/{userID}` | DELETE | DeleteUserFromSessionInChannel | [DeleteUserFromSessionInChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/DeleteUserFromSessionInChannel.java) | [DeleteUserFromSessionInChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/DeleteUserFromSessionInChannel.java) |
| [DEPRECATED] `/matchmaking/v1/admin/namespaces/{namespace}/sessions/history/search` | GET | SearchSessions | [SearchSessions](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/SearchSessions.java) | [SearchSessions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/SearchSessions.java) |
| [DEPRECATED] `/matchmaking/v1/admin/namespaces/{namespace}/sessions/{matchID}/history/detailed` | GET | GetSessionHistoryDetailed | [GetSessionHistoryDetailed](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/GetSessionHistoryDetailed.java) | [GetSessionHistoryDetailed](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/GetSessionHistoryDetailed.java) |
| `/matchmaking/v1/public/namespaces/{namespace}/channels` | GET | PublicGetAllMatchmakingChannel | [PublicGetAllMatchmakingChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/PublicGetAllMatchmakingChannel.java) | [PublicGetAllMatchmakingChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/PublicGetAllMatchmakingChannel.java) |
| `/matchmaking/v1/public/namespaces/{namespace}/channels/{channelName}` | GET | PublicGetSingleMatchmakingChannel | [PublicGetSingleMatchmakingChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/PublicGetSingleMatchmakingChannel.java) | [PublicGetSingleMatchmakingChannel](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/PublicGetSingleMatchmakingChannel.java) |
| [DEPRECATED] `/matchmaking/v2/admin/namespaces/{namespace}/sessions/history/search` | GET | SearchSessionsV2 | [SearchSessionsV2](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/matchmaking/SearchSessionsV2.java) | [SearchSessionsV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/matchmaking/SearchSessionsV2.java) |

### Social Matchmaking Wrapper:  [SocialMatchmaking](../../src/main/java/net/accelbyte/sdk/api/matchmaking/wrappers/SocialMatchmaking.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/matchmaking/social/playtime/namespaces/{namespace}/weight` | PATCH | UpdatePlayTimeWeight | [UpdatePlayTimeWeight](../../src/main/java/net/accelbyte/sdk/api/matchmaking/operations/social_matchmaking/UpdatePlayTimeWeight.java) | [UpdatePlayTimeWeight](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/matchmaking/social_matchmaking/UpdatePlayTimeWeight.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/LogAppMessageDeclaration.java) |
| `models.AllianceFlexingRule` | [ModelsAllianceFlexingRule](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsAllianceFlexingRule.java) |
| `models.AllianceRule` | [ModelsAllianceRule](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsAllianceRule.java) |
| `models.AllianceRuleV1` | [ModelsAllianceRuleV1](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsAllianceRuleV1.java) |
| `models.Channel` | [ModelsChannel](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsChannel.java) |
| `models.ChannelRequest` | [ModelsChannelRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsChannelRequest.java) |
| `models.ChannelV1` | [ModelsChannelV1](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsChannelV1.java) |
| `models.Combination` | [ModelsCombination](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsCombination.java) |
| `models.CreateChannelResponse` | [ModelsCreateChannelResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsCreateChannelResponse.java) |
| `models.DequeueRequest` | [ModelsDequeueRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsDequeueRequest.java) |
| `models.FlexingRule` | [ModelsFlexingRule](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsFlexingRule.java) |
| `models.GetChannelsResponse` | [ModelsGetChannelsResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsGetChannelsResponse.java) |
| `models.ImportConfigResponse` | [ModelsImportConfigResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsImportConfigResponse.java) |
| `models.MatchAddUserIntoSessionRequest` | [ModelsMatchAddUserIntoSessionRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchAddUserIntoSessionRequest.java) |
| `models.MatchOption` | [ModelsMatchOption](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchOption.java) |
| `models.MatchOptionRule` | [ModelsMatchOptionRule](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchOptionRule.java) |
| `models.MatchResultRequest` | [ModelsMatchResultRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchResultRequest.java) |
| `models.MatchResultResponse` | [ModelsMatchResultResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchResultResponse.java) |
| `models.MatchingAlly` | [ModelsMatchingAlly](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchingAlly.java) |
| `models.MatchingParty` | [ModelsMatchingParty](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchingParty.java) |
| `models.MatchingRule` | [ModelsMatchingRule](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchingRule.java) |
| `models.MatchmakingResult` | [ModelsMatchmakingResult](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsMatchmakingResult.java) |
| `models.Pagination` | [ModelsPagination](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsPagination.java) |
| `models.PartyMember` | [ModelsPartyMember](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsPartyMember.java) |
| `models.PlayerResultRequest` | [ModelsPlayerResultRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsPlayerResultRequest.java) |
| `models.PlayerResultResponse` | [ModelsPlayerResultResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsPlayerResultResponse.java) |
| `models.RebalanceRequest` | [ModelsRebalanceRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsRebalanceRequest.java) |
| `models.RebalanceResponse` | [ModelsRebalanceResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsRebalanceResponse.java) |
| `models.ResultAttributeRequest` | [ModelsResultAttributeRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsResultAttributeRequest.java) |
| `models.ResultAttributeResponse` | [ModelsResultAttributeResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsResultAttributeResponse.java) |
| `models.Role` | [ModelsRole](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsRole.java) |
| `models.RuleSet` | [ModelsRuleSet](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsRuleSet.java) |
| `models.RuleSetV1` | [ModelsRuleSetV1](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsRuleSetV1.java) |
| `models.SubGameMode` | [ModelsSubGameMode](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsSubGameMode.java) |
| `models.TicketMetricResultRecord` | [ModelsTicketMetricResultRecord](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsTicketMetricResultRecord.java) |
| `models.UpdateAllianceRule` | [ModelsUpdateAllianceRule](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsUpdateAllianceRule.java) |
| `models.UpdateChannelRequest` | [ModelsUpdateChannelRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsUpdateChannelRequest.java) |
| `models.UpdatePlayTimeWeightRequest` | [ModelsUpdatePlayTimeWeightRequest](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsUpdatePlayTimeWeightRequest.java) |
| `models.UpdatePlayerPlaytimeWeightResponse` | [ModelsUpdatePlayerPlaytimeWeightResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsUpdatePlayerPlaytimeWeightResponse.java) |
| `models.UpdateRuleset` | [ModelsUpdateRuleset](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsUpdateRuleset.java) |
| `models.UpdateRuleset.sub_game_modes` | [ModelsUpdateRulesetSubGameModes](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ModelsUpdateRulesetSubGameModes.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ResponseError.java) |
| `response.ErrorV1` | [ResponseErrorV1](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ResponseErrorV1.java) |
| `service.GetSessionHistoryDetailedResponseItem` | [ServiceGetSessionHistoryDetailedResponseItem](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ServiceGetSessionHistoryDetailedResponseItem.java) |
| `service.GetSessionHistorySearchResponse` | [ServiceGetSessionHistorySearchResponse](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ServiceGetSessionHistorySearchResponse.java) |
| `service.GetSessionHistorySearchResponseItem` | [ServiceGetSessionHistorySearchResponseItem](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ServiceGetSessionHistorySearchResponseItem.java) |
| `service.GetSessionHistorySearchResponseItemV2` | [ServiceGetSessionHistorySearchResponseItemV2](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ServiceGetSessionHistorySearchResponseItemV2.java) |
| `service.GetSessionHistorySearchResponseV2` | [ServiceGetSessionHistorySearchResponseV2](../../src/main/java/net/accelbyte/sdk/api/matchmaking/models/ServiceGetSessionHistorySearchResponseV2.java) |

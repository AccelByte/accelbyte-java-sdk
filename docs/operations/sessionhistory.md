# Sessionhistory Service Index

&nbsp;  

## Operations

### Operations Wrapper:  [Operations](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/healthz` | GET | GetHealthcheckInfo | [GetHealthcheckInfo](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/operations/GetHealthcheckInfo.java) | [GetHealthcheckInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/operations/GetHealthcheckInfo.java) |
| `/sessionhistory/healthz` | GET | GetHealthcheckInfoV1 | [GetHealthcheckInfoV1](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/operations/GetHealthcheckInfoV1.java) | [GetHealthcheckInfoV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/operations/GetHealthcheckInfoV1.java) |

### Config Wrapper:  [Config](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/wrappers/Config.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/sessionhistory/v1/admin/config/env` | GET | AdminGetEnvConfig | [AdminGetEnvConfig](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/config/AdminGetEnvConfig.java) | [AdminGetEnvConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/config/AdminGetEnvConfig.java) |
| `/sessionhistory/v1/admin/config/env` | PATCH | AdminPatchUpdateEnvConfig | [AdminPatchUpdateEnvConfig](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/config/AdminPatchUpdateEnvConfig.java) | [AdminPatchUpdateEnvConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/config/AdminPatchUpdateEnvConfig.java) |
| `/sessionhistory/v1/admin/config/log` | GET | AdminGetLogConfig | [AdminGetLogConfig](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/config/AdminGetLogConfig.java) | [AdminGetLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/config/AdminGetLogConfig.java) |
| `/sessionhistory/v1/admin/config/log` | PATCH | AdminPatchUpdateLogConfig | [AdminPatchUpdateLogConfig](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/config/AdminPatchUpdateLogConfig.java) | [AdminPatchUpdateLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/config/AdminPatchUpdateLogConfig.java) |

### Game Session Detail Wrapper:  [GameSessionDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/wrappers/GameSessionDetail.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/sessionhistory/v1/admin/namespaces/{namespace}/gamesessions` | GET | AdminQueryGameSessionDetail | [AdminQueryGameSessionDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminQueryGameSessionDetail.java) | [AdminQueryGameSessionDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminQueryGameSessionDetail.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/gamesessions/{sessionId}` | GET | GetGameSessionDetail | [GetGameSessionDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/GetGameSessionDetail.java) | [GetGameSessionDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/GetGameSessionDetail.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/matchmaking` | GET | AdminQueryMatchmakingDetail | [AdminQueryMatchmakingDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminQueryMatchmakingDetail.java) | [AdminQueryMatchmakingDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminQueryMatchmakingDetail.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/matchmaking/session/{sessionId}` | GET | AdminGetMatchmakingDetailBySessionID | [AdminGetMatchmakingDetailBySessionID](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminGetMatchmakingDetailBySessionID.java) | [AdminGetMatchmakingDetailBySessionID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminGetMatchmakingDetailBySessionID.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/matchmaking/ticket/{ticketId}` | GET | AdminGetMatchmakingDetailByTicketID | [AdminGetMatchmakingDetailByTicketID](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminGetMatchmakingDetailByTicketID.java) | [AdminGetMatchmakingDetailByTicketID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminGetMatchmakingDetailByTicketID.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/parties` | GET | AdminQueryPartyDetail | [AdminQueryPartyDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminQueryPartyDetail.java) | [AdminQueryPartyDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminQueryPartyDetail.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/parties/{sessionId}` | GET | GetPartyDetail | [GetPartyDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/GetPartyDetail.java) | [GetPartyDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/GetPartyDetail.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/tickets` | GET | AdminQueryTicketDetail | [AdminQueryTicketDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminQueryTicketDetail.java) | [AdminQueryTicketDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminQueryTicketDetail.java) |
| `/sessionhistory/v1/admin/namespaces/{namespace}/tickets/{ticketId}` | GET | AdminTicketDetailGetByTicketID | [AdminTicketDetailGetByTicketID](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/AdminTicketDetailGetByTicketID.java) | [AdminTicketDetailGetByTicketID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/AdminTicketDetailGetByTicketID.java) |
| `/sessionhistory/v1/public/namespaces/{namespace}/users/me/gamesessions` | GET | PublicQueryGameSessionMe | [PublicQueryGameSessionMe](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/game_session_detail/PublicQueryGameSessionMe.java) | [PublicQueryGameSessionMe](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/game_session_detail/PublicQueryGameSessionMe.java) |

### XRay Wrapper:  [XRay](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/wrappers/XRay.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}` | GET | QueryXrayMatchPool | [QueryXrayMatchPool](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryXrayMatchPool.java) | [QueryXrayMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryXrayMatchPool.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}/pods/{podName}/ticks` | GET | QueryDetailTickMatchPool | [QueryDetailTickMatchPool](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryDetailTickMatchPool.java) | [QueryDetailTickMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryDetailTickMatchPool.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}/pods/{podName}/ticks/{tickId}/matches` | GET | QueryDetailTickMatchPoolMatches | [QueryDetailTickMatchPoolMatches](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryDetailTickMatchPoolMatches.java) | [QueryDetailTickMatchPoolMatches](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryDetailTickMatchPoolMatches.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}/pods/{podName}/ticks/{tickId}/tickets` | GET | QueryDetailTickMatchPoolTicket | [QueryDetailTickMatchPoolTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryDetailTickMatchPoolTicket.java) | [QueryDetailTickMatchPoolTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryDetailTickMatchPoolTicket.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/matches/{matchId}/histories` | GET | QueryMatchHistories | [QueryMatchHistories](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryMatchHistories.java) | [QueryMatchHistories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryMatchHistories.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/matches/{matchId}/ticket-histories` | GET | QueryMatchTicketHistories | [QueryMatchTicketHistories](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryMatchTicketHistories.java) | [QueryMatchTicketHistories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryMatchTicketHistories.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/matches/{matchId}/tickets` | GET | QueryXrayMatch | [QueryXrayMatch](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryXrayMatch.java) | [QueryXrayMatch](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryXrayMatch.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/acquiring-ds` | GET | QueryAcquiringDS | [QueryAcquiringDS](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryAcquiringDS.java) | [QueryAcquiringDS](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryAcquiringDS.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/acquiring-ds-wait-time-avg` | GET | QueryAcquiringDSWaitTimeAvg | [QueryAcquiringDSWaitTimeAvg](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryAcquiringDSWaitTimeAvg.java) | [QueryAcquiringDSWaitTimeAvg](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryAcquiringDSWaitTimeAvg.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/match-length-duration-avg` | GET | QueryMatchLengthDurationpAvg | [QueryMatchLengthDurationpAvg](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryMatchLengthDurationpAvg.java) | [QueryMatchLengthDurationpAvg](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryMatchLengthDurationpAvg.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/match-length-duration-p99` | GET | QueryMatchLengthDurationp99 | [QueryMatchLengthDurationp99](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryMatchLengthDurationp99.java) | [QueryMatchLengthDurationp99](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryMatchLengthDurationp99.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-active-session` | GET | QueryTotalActiveSession | [QueryTotalActiveSession](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalActiveSession.java) | [QueryTotalActiveSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalActiveSession.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-match` | GET | QueryTotalMatchmakingMatch | [QueryTotalMatchmakingMatch](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalMatchmakingMatch.java) | [QueryTotalMatchmakingMatch](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalMatchmakingMatch.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-player-persession-avg` | GET | QueryTotalPlayerPersession | [QueryTotalPlayerPersession](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalPlayerPersession.java) | [QueryTotalPlayerPersession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalPlayerPersession.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-ticket-canceled` | GET | QueryTotalMatchmakingCanceled | [QueryTotalMatchmakingCanceled](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalMatchmakingCanceled.java) | [QueryTotalMatchmakingCanceled](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalMatchmakingCanceled.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-ticket-created` | GET | QueryTotalMatchmakingCreated | [QueryTotalMatchmakingCreated](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalMatchmakingCreated.java) | [QueryTotalMatchmakingCreated](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalMatchmakingCreated.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-ticket-expired` | GET | QueryTotalMatchmakingExpired | [QueryTotalMatchmakingExpired](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalMatchmakingExpired.java) | [QueryTotalMatchmakingExpired](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalMatchmakingExpired.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/metrics/total-ticket-match` | GET | QueryTotalMatchmakingMatchTicket | [QueryTotalMatchmakingMatchTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryTotalMatchmakingMatchTicket.java) | [QueryTotalMatchmakingMatchTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryTotalMatchmakingMatchTicket.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/tickets` | POST | CreateXrayTicketObservability | [CreateXrayTicketObservability](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/CreateXrayTicketObservability.java) | [CreateXrayTicketObservability](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/CreateXrayTicketObservability.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/tickets/bulk` | POST | CreateXrayBulkTicketObservability | [CreateXrayBulkTicketObservability](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/CreateXrayBulkTicketObservability.java) | [CreateXrayBulkTicketObservability](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/CreateXrayBulkTicketObservability.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/tickets/{ticketId}` | GET | QueryXrayTimelineByTicketID | [QueryXrayTimelineByTicketID](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryXrayTimelineByTicketID.java) | [QueryXrayTimelineByTicketID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryXrayTimelineByTicketID.java) |
| `/sessionhistory/v2/admin/namespaces/{namespace}/xray/users/{userId}/tickets` | GET | QueryXrayTimelineByUserID | [QueryXrayTimelineByUserID](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/operations/x_ray/QueryXrayTimelineByUserID.java) | [QueryXrayTimelineByUserID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionhistory/x_ray/QueryXrayTimelineByUserID.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `apimodels.AcquiringDS` | [ApimodelsAcquiringDS](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsAcquiringDS.java) |
| `apimodels.AcquiringDsWaitTime` | [ApimodelsAcquiringDsWaitTime](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsAcquiringDsWaitTime.java) |
| `apimodels.CanceledMatchmakingTicket` | [ApimodelsCanceledMatchmakingTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsCanceledMatchmakingTicket.java) |
| `apimodels.CreatedMatchmakingTicket` | [ApimodelsCreatedMatchmakingTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsCreatedMatchmakingTicket.java) |
| `apimodels.EventMatchHistory` | [ApimodelsEventMatchHistory](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsEventMatchHistory.java) |
| `apimodels.ExpiredMatchmakingTicket` | [ApimodelsExpiredMatchmakingTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsExpiredMatchmakingTicket.java) |
| `apimodels.GameSessionDetail` | [ApimodelsGameSessionDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsGameSessionDetail.java) |
| `apimodels.GameSessionDetailQueryResponse` | [ApimodelsGameSessionDetailQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsGameSessionDetailQueryResponse.java) |
| `apimodels.History` | [ApimodelsHistory](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsHistory.java) |
| `apimodels.MatchLengthDuration` | [ApimodelsMatchLengthDuration](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsMatchLengthDuration.java) |
| `apimodels.MatchMatchmaking` | [ApimodelsMatchMatchmaking](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsMatchMatchmaking.java) |
| `apimodels.MatchMatchmakingTicket` | [ApimodelsMatchMatchmakingTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsMatchMatchmakingTicket.java) |
| `apimodels.MatchmakingDetail` | [ApimodelsMatchmakingDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsMatchmakingDetail.java) |
| `apimodels.MatchmakingDetailQueryResponse` | [ApimodelsMatchmakingDetailQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsMatchmakingDetailQueryResponse.java) |
| `apimodels.MatchmakingHistory` | [ApimodelsMatchmakingHistory](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsMatchmakingHistory.java) |
| `apimodels.Pagination` | [ApimodelsPagination](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsPagination.java) |
| `apimodels.PartyDetail` | [ApimodelsPartyDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsPartyDetail.java) |
| `apimodels.PartyDetailQueryResponse` | [ApimodelsPartyDetailQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsPartyDetailQueryResponse.java) |
| `apimodels.PartyHistory` | [ApimodelsPartyHistory](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsPartyHistory.java) |
| `apimodels.TicketDetailQueryResponse` | [ApimodelsTicketDetailQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsTicketDetailQueryResponse.java) |
| `apimodels.TicketObservabilityDetail` | [ApimodelsTicketObservabilityDetail](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsTicketObservabilityDetail.java) |
| `apimodels.TicketObservabilityHistory` | [ApimodelsTicketObservabilityHistory](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsTicketObservabilityHistory.java) |
| `apimodels.TotalActiveSession` | [ApimodelsTotalActiveSession](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsTotalActiveSession.java) |
| `apimodels.TotalPlayerPersession` | [ApimodelsTotalPlayerPersession](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsTotalPlayerPersession.java) |
| `apimodels.XRayAcquiringDsQueryResponse` | [ApimodelsXRayAcquiringDsQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayAcquiringDsQueryResponse.java) |
| `apimodels.XRayAcquiringDsWaitTimeQueryResponse` | [ApimodelsXRayAcquiringDsWaitTimeQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayAcquiringDsWaitTimeQueryResponse.java) |
| `apimodels.XRayBulkTicketObservabilityRequest` | [ApimodelsXRayBulkTicketObservabilityRequest](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayBulkTicketObservabilityRequest.java) |
| `apimodels.XRayBulkTicketObservabilityResponse` | [ApimodelsXRayBulkTicketObservabilityResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayBulkTicketObservabilityResponse.java) |
| `apimodels.XRayCanceledMatchmakingTicketQueryResponse` | [ApimodelsXRayCanceledMatchmakingTicketQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayCanceledMatchmakingTicketQueryResponse.java) |
| `apimodels.XRayCreatedMatchmakingTicketQueryResponse` | [ApimodelsXRayCreatedMatchmakingTicketQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayCreatedMatchmakingTicketQueryResponse.java) |
| `apimodels.XRayExpiredMatchmakingTicketQueryResponse` | [ApimodelsXRayExpiredMatchmakingTicketQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayExpiredMatchmakingTicketQueryResponse.java) |
| `apimodels.XRayMatchHistorQueryResponse` | [ApimodelsXRayMatchHistorQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchHistorQueryResponse.java) |
| `apimodels.XRayMatchLengthDurationQueryResponse` | [ApimodelsXRayMatchLengthDurationQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchLengthDurationQueryResponse.java) |
| `apimodels.XRayMatchMatchmakingQueryResponse` | [ApimodelsXRayMatchMatchmakingQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchMatchmakingQueryResponse.java) |
| `apimodels.XRayMatchMatchmakingTicketQueryResponse` | [ApimodelsXRayMatchMatchmakingTicketQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchMatchmakingTicketQueryResponse.java) |
| `apimodels.XRayMatchPoolPodTickMatchResponse` | [ApimodelsXRayMatchPoolPodTickMatchResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchPoolPodTickMatchResponse.java) |
| `apimodels.XRayMatchPoolPodTickQueryResponse` | [ApimodelsXRayMatchPoolPodTickQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchPoolPodTickQueryResponse.java) |
| `apimodels.XRayMatchPoolPodTickResult` | [ApimodelsXRayMatchPoolPodTickResult](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchPoolPodTickResult.java) |
| `apimodels.XRayMatchPoolPodTickTicketResponse` | [ApimodelsXRayMatchPoolPodTickTicketResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchPoolPodTickTicketResponse.java) |
| `apimodels.XRayMatchPoolQueryResponse` | [ApimodelsXRayMatchPoolQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchPoolQueryResponse.java) |
| `apimodels.XRayMatchPoolResult` | [ApimodelsXRayMatchPoolResult](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchPoolResult.java) |
| `apimodels.XRayMatchTicketHistory` | [ApimodelsXRayMatchTicketHistory](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchTicketHistory.java) |
| `apimodels.XRayMatchTicketHistoryQueryResponse` | [ApimodelsXRayMatchTicketHistoryQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchTicketHistoryQueryResponse.java) |
| `apimodels.XRayMatchesQueryResponse` | [ApimodelsXRayMatchesQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayMatchesQueryResponse.java) |
| `apimodels.XRayTicketMatchesResult` | [ApimodelsXRayTicketMatchesResult](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketMatchesResult.java) |
| `apimodels.XRayTicketObservabilityRequest` | [ApimodelsXRayTicketObservabilityRequest](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketObservabilityRequest.java) |
| `apimodels.XRayTicketObservabilityResponse` | [ApimodelsXRayTicketObservabilityResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketObservabilityResponse.java) |
| `apimodels.XRayTicketQueryResponse` | [ApimodelsXRayTicketQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketQueryResponse.java) |
| `apimodels.XRayTicketResult` | [ApimodelsXRayTicketResult](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTicketResult.java) |
| `apimodels.XRayTotalActiveSessionQueryResponse` | [ApimodelsXRayTotalActiveSessionQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTotalActiveSessionQueryResponse.java) |
| `apimodels.XRayTotalPlayerPersessionAVGQueryResponse` | [ApimodelsXRayTotalPlayerPersessionAVGQueryResponse](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ApimodelsXRayTotalPlayerPersessionAVGQueryResponse.java) |
| `envconfig.Configuration` | [EnvconfigConfiguration](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/EnvconfigConfiguration.java) |
| `logconfig.Configuration` | [LogconfigConfiguration](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/LogconfigConfiguration.java) |
| `models.AllianceRule` | [ModelsAllianceRule](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsAllianceRule.java) |
| `models.BackfillProposal` | [ModelsBackfillProposal](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsBackfillProposal.java) |
| `models.BackfillTicket` | [ModelsBackfillTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsBackfillTicket.java) |
| `models.DSInformation` | [ModelsDSInformation](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsDSInformation.java) |
| `models.GameServer` | [ModelsGameServer](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsGameServer.java) |
| `models.GameSession` | [ModelsGameSession](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsGameSession.java) |
| `models.GameSessionTeam` | [ModelsGameSessionTeam](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsGameSessionTeam.java) |
| `models.Match` | [ModelsMatch](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatch.java) |
| `models.MatchTicket` | [ModelsMatchTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatchTicket.java) |
| `models.MatchingAlly` | [ModelsMatchingAlly](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatchingAlly.java) |
| `models.MatchingParty` | [ModelsMatchingParty](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatchingParty.java) |
| `models.MatchingRule` | [ModelsMatchingRule](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatchingRule.java) |
| `models.MatchmakingResult` | [ModelsMatchmakingResult](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsMatchmakingResult.java) |
| `models.Party` | [ModelsParty](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsParty.java) |
| `models.PartyMember` | [ModelsPartyMember](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsPartyMember.java) |
| `models.PartyMembers` | [ModelsPartyMembers](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsPartyMembers.java) |
| `models.PartyTeam` | [ModelsPartyTeam](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsPartyTeam.java) |
| `models.PlayerData` | [ModelsPlayerData](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsPlayerData.java) |
| `models.ProposedProposal` | [ModelsProposedProposal](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsProposedProposal.java) |
| `models.SessionConfig` | [ModelsSessionConfig](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsSessionConfig.java) |
| `models.SessionConfiguration` | [ModelsSessionConfiguration](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsSessionConfiguration.java) |
| `models.Team` | [ModelsTeam](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsTeam.java) |
| `models.Ticket` | [ModelsTicket](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsTicket.java) |
| `models.TicketData` | [ModelsTicketData](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsTicketData.java) |
| `models.TicketObservability` | [ModelsTicketObservability](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsTicketObservability.java) |
| `models.TicketStatus` | [ModelsTicketStatus](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsTicketStatus.java) |
| `models.User` | [ModelsUser](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ModelsUser.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/sessionhistory/models/ResponseError.java) |

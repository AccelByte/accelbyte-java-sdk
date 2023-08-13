# Match2 Service Index

&nbsp;  

## Operations

### Operations Wrapper:  [Operations](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/healthz` | GET | GetHealthcheckInfo | [GetHealthcheckInfo](../../src/main/java/net/accelbyte/sdk/api/match2/operations/operations/GetHealthcheckInfo.java) | [GetHealthcheckInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/operations/GetHealthcheckInfo.java) |
| `/match2/healthz` | GET | GetHealthcheckInfoV1 | [GetHealthcheckInfoV1](../../src/main/java/net/accelbyte/sdk/api/match2/operations/operations/GetHealthcheckInfoV1.java) | [GetHealthcheckInfoV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/operations/GetHealthcheckInfoV1.java) |
| `/match2/version` | GET | VersionCheckHandler | [VersionCheckHandler](../../src/main/java/net/accelbyte/sdk/api/match2/operations/operations/VersionCheckHandler.java) | [VersionCheckHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/operations/VersionCheckHandler.java) |

### Environment-Variables Wrapper:  [EnvironmentVariables](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/EnvironmentVariables.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/environment-variables` | GET | EnvironmentVariableList | [EnvironmentVariableList](../../src/main/java/net/accelbyte/sdk/api/match2/operations/environment_variables/EnvironmentVariableList.java) | [EnvironmentVariableList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/environment_variables/EnvironmentVariableList.java) |

### Backfill Wrapper:  [Backfill](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/Backfill.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/backfill` | POST | CreateBackfill | [CreateBackfill](../../src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/CreateBackfill.java) | [CreateBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/CreateBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/proposal` | GET | GetBackfillProposal | [GetBackfillProposal](../../src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/GetBackfillProposal.java) | [GetBackfillProposal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/GetBackfillProposal.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}` | GET | GetBackfill | [GetBackfill](../../src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/GetBackfill.java) | [GetBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/GetBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}` | DELETE | DeleteBackfill | [DeleteBackfill](../../src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/DeleteBackfill.java) | [DeleteBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/DeleteBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}/proposal/accept` | PUT | AcceptBackfill | [AcceptBackfill](../../src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/AcceptBackfill.java) | [AcceptBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/AcceptBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}/proposal/reject` | PUT | RejectBackfill | [RejectBackfill](../../src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/RejectBackfill.java) | [RejectBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/RejectBackfill.java) |

### Match-Functions Wrapper:  [MatchFunctions](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/MatchFunctions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/match-functions` | GET | MatchFunctionList | [MatchFunctionList](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/MatchFunctionList.java) | [MatchFunctionList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/MatchFunctionList.java) |
| `/match2/v1/namespaces/{namespace}/match-functions` | POST | CreateMatchFunction | [CreateMatchFunction](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/CreateMatchFunction.java) | [CreateMatchFunction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/CreateMatchFunction.java) |
| `/match2/v1/namespaces/{namespace}/match-functions/{name}` | PUT | UpdateMatchFunction | [UpdateMatchFunction](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/UpdateMatchFunction.java) | [UpdateMatchFunction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/UpdateMatchFunction.java) |
| `/match2/v1/namespaces/{namespace}/match-functions/{name}` | DELETE | DeleteMatchFunction | [DeleteMatchFunction](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/DeleteMatchFunction.java) | [DeleteMatchFunction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/DeleteMatchFunction.java) |

### Match-Pools Wrapper:  [MatchPools](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/MatchPools.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/match-pools` | GET | MatchPoolList | [MatchPoolList](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/MatchPoolList.java) | [MatchPoolList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/MatchPoolList.java) |
| `/match2/v1/namespaces/{namespace}/match-pools` | POST | CreateMatchPool | [CreateMatchPool](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/CreateMatchPool.java) | [CreateMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/CreateMatchPool.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}` | GET | MatchPoolDetails | [MatchPoolDetails](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/MatchPoolDetails.java) | [MatchPoolDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/MatchPoolDetails.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}` | PUT | UpdateMatchPool | [UpdateMatchPool](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/UpdateMatchPool.java) | [UpdateMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/UpdateMatchPool.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}` | DELETE | DeleteMatchPool | [DeleteMatchPool](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/DeleteMatchPool.java) | [DeleteMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/DeleteMatchPool.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}/metrics` | GET | MatchPoolMetric | [MatchPoolMetric](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/MatchPoolMetric.java) | [MatchPoolMetric](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/MatchPoolMetric.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}/metrics/player` | GET | GetPlayerMetric | [GetPlayerMetric](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/GetPlayerMetric.java) | [GetPlayerMetric](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/GetPlayerMetric.java) |

### Match-Tickets Wrapper:  [MatchTickets](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/MatchTickets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/match-tickets` | POST | CreateMatchTicket | [CreateMatchTicket](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/CreateMatchTicket.java) | [CreateMatchTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/CreateMatchTicket.java) |
| `/match2/v1/namespaces/{namespace}/match-tickets/me` | GET | GetMyMatchTickets | [GetMyMatchTickets](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/GetMyMatchTickets.java) | [GetMyMatchTickets](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/GetMyMatchTickets.java) |
| `/match2/v1/namespaces/{namespace}/match-tickets/{ticketid}` | GET | MatchTicketDetails | [MatchTicketDetails](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/MatchTicketDetails.java) | [MatchTicketDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/MatchTicketDetails.java) |
| `/match2/v1/namespaces/{namespace}/match-tickets/{ticketid}` | DELETE | DeleteMatchTicket | [DeleteMatchTicket](../../src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/DeleteMatchTicket.java) | [DeleteMatchTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/DeleteMatchTicket.java) |

### Rule-Sets Wrapper:  [RuleSets](../../src/main/java/net/accelbyte/sdk/api/match2/wrappers/RuleSets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/rulesets` | GET | RuleSetList | [RuleSetList](../../src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/RuleSetList.java) | [RuleSetList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/RuleSetList.java) |
| `/match2/v1/namespaces/{namespace}/rulesets` | POST | CreateRuleSet | [CreateRuleSet](../../src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/CreateRuleSet.java) | [CreateRuleSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/CreateRuleSet.java) |
| `/match2/v1/namespaces/{namespace}/rulesets/{ruleset}` | GET | RuleSetDetails | [RuleSetDetails](../../src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/RuleSetDetails.java) | [RuleSetDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/RuleSetDetails.java) |
| `/match2/v1/namespaces/{namespace}/rulesets/{ruleset}` | PUT | UpdateRuleSet | [UpdateRuleSet](../../src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/UpdateRuleSet.java) | [UpdateRuleSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/UpdateRuleSet.java) |
| `/match2/v1/namespaces/{namespace}/rulesets/{ruleset}` | DELETE | DeleteRuleSet | [DeleteRuleSet](../../src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/DeleteRuleSet.java) | [DeleteRuleSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/DeleteRuleSet.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `api.BackFillAcceptRequest` | [ApiBackFillAcceptRequest](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackFillAcceptRequest.java) |
| `api.BackFillCreateRequest` | [ApiBackFillCreateRequest](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackFillCreateRequest.java) |
| `api.BackfillCreateResponse` | [ApiBackfillCreateResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackfillCreateResponse.java) |
| `api.BackfillGetResponse` | [ApiBackfillGetResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackfillGetResponse.java) |
| `api.BackfillProposalResponse` | [ApiBackfillProposalResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackfillProposalResponse.java) |
| `api.ListEnvironmentVariablesResponse` | [ApiListEnvironmentVariablesResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiListEnvironmentVariablesResponse.java) |
| `api.ListMatchFunctionsResponse` | [ApiListMatchFunctionsResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiListMatchFunctionsResponse.java) |
| `api.ListMatchPoolsResponse` | [ApiListMatchPoolsResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiListMatchPoolsResponse.java) |
| `api.ListRuleSetsResponse` | [ApiListRuleSetsResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiListRuleSetsResponse.java) |
| `api.Match` | [ApiMatch](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatch.java) |
| `api.MatchFunctionConfig` | [ApiMatchFunctionConfig](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchFunctionConfig.java) |
| `api.MatchFunctionOverride` | [ApiMatchFunctionOverride](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchFunctionOverride.java) |
| `api.MatchFunctionRequest` | [ApiMatchFunctionRequest](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchFunctionRequest.java) |
| `api.MatchPool` | [ApiMatchPool](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchPool.java) |
| `api.MatchPoolConfig` | [ApiMatchPoolConfig](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchPoolConfig.java) |
| `api.MatchRuleSetNameData` | [ApiMatchRuleSetNameData](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchRuleSetNameData.java) |
| `api.MatchTicketRequest` | [ApiMatchTicketRequest](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketRequest.java) |
| `api.MatchTicketResponse` | [ApiMatchTicketResponse](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketResponse.java) |
| `api.MatchTicketStatus` | [ApiMatchTicketStatus](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketStatus.java) |
| `api.MatchTicketStatuses` | [ApiMatchTicketStatuses](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketStatuses.java) |
| `api.Party` | [ApiParty](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiParty.java) |
| `api.PlayerData` | [ApiPlayerData](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiPlayerData.java) |
| `api.PlayerMetricRecord` | [ApiPlayerMetricRecord](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiPlayerMetricRecord.java) |
| `api.ProposedProposal` | [ApiProposedProposal](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiProposedProposal.java) |
| `api.RuleSetPayload` | [ApiRuleSetPayload](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiRuleSetPayload.java) |
| `api.Team` | [ApiTeam](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiTeam.java) |
| `api.Ticket` | [ApiTicket](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiTicket.java) |
| `api.TicketMetricResultRecord` | [ApiTicketMetricResultRecord](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiTicketMetricResultRecord.java) |
| `api.backFillRejectRequest` | [ApiBackFillRejectRequest](../../src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackFillRejectRequest.java) |
| `config.EnvironmentVariable` | [ConfigEnvironmentVariable](../../src/main/java/net/accelbyte/sdk/api/match2/models/ConfigEnvironmentVariable.java) |
| `matchmaker.Party` | [MatchmakerParty](../../src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerParty.java) |
| `matchmaker.Team` | [MatchmakerTeam](../../src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerTeam.java) |
| `models.Configuration` | [ModelsConfiguration](../../src/main/java/net/accelbyte/sdk/api/match2/models/ModelsConfiguration.java) |
| `models.DSInformation` | [ModelsDSInformation](../../src/main/java/net/accelbyte/sdk/api/match2/models/ModelsDSInformation.java) |
| `models.GameSession` | [ModelsGameSession](../../src/main/java/net/accelbyte/sdk/api/match2/models/ModelsGameSession.java) |
| `models.Pagination` | [ModelsPagination](../../src/main/java/net/accelbyte/sdk/api/match2/models/ModelsPagination.java) |
| `models.Server` | [ModelsServer](../../src/main/java/net/accelbyte/sdk/api/match2/models/ModelsServer.java) |
| `models.User` | [ModelsUser](../../src/main/java/net/accelbyte/sdk/api/match2/models/ModelsUser.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/match2/models/ResponseError.java) |

<a name="v0.60.0"></a>
## [v0.60.0] - 2024-03-26

### BREAKING CHANGE

### Challenge
The following operations have been updated:
- operation `net.accelbyte.sdk.api.challenge.operations.challenge_list.PublicGetScheduledGoals`
  - return type changed from `List<ModelGoalResponse>` to `ModelGetGoalsResponse`

### Matchmaking
The following models have been removed:
- model `net.accelbyte.sdk.api.matchmaking.models.ModelsRuleSet`
  - enum `TicketFlexingSelection` is removed
  - Method `getTicketFlexingSelectionAsEnum` and `setTicketFlexingSelectionFromEnum` are removed
- model `net.accelbyte.sdk.api.matchmaking.models.ModelsRuleSetV1`
  - enum `TicketFlexingSelection` is removed
  - Method `getTicketFlexingSelectionAsEnum` and `setTicketFlexingSelectionFromEnum` are removed
- model `net.accelbyte.sdk.api.matchmaking.models.ModelsSelectionRule`
  - enum `Selection` is removed
  - Method `getSelectionAsEnum` and `setSelectionFromEnum` are removed
- model `net.accelbyte.sdk.api.matchmaking.models.ModelsSortTicket`
  - enum `SearchResult` is removed 
  - Method `getSearchResultAsEnum` and `setSearchResultFromEnum` are removed
  - enum `TicketQueue` is removed
  - Method `getTicketQueueAsEnum` and `setTicketQueueFromEnum` are removed
- model `net.accelbyte.sdk.api.matchmaking.models.ModelsSortTicketRule`
  - enum `SearchResult` is removed
  - Method `getSearchResultAsEnum` and `setSearchResultFromEnum` are removed
  - enum `TicketQueue` is removed
  - Method `getTicketQueueAsEnum` and `setTicketQueueFromEnum` are removed
- model `net.accelbyte.sdk.api.matchmaking.models.ModelsUpdateRuleset`
  - enum `TicketFlexingSelection` is removed
  - Method `getTicketFlexingSelectionAsEnum` and `setTicketFlexingSelectionFromEnum` are removed
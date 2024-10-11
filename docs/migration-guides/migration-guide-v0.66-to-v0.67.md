<a name="v0.67.0"></a>
## [v0.67.0] - 2024-10-10

### BREAKING CHANGE

### AMS
The following have been updated:
- Model `net.accelbyte.sdk.api.ams.models.ApiInstanceTypeDescriptionResponse` renamed to `net.accelbyte.sdk.api.ams.models.ApiAvailableInstanceType `
  - field `capacity` is now required
  - field `ownerAccountId` is now required
  - field `provider` is now required
- Model `net.accelbyte.sdk.api.ams.models.DSHistoryEvent`
  - field `sessionId` is now required
- Model `net.accelbyte.sdk.api.ams.models.DSHostConfiguration`
  - field `instanceProvider` is now required
- Model `net.accelbyte.sdk.api.ams.models.DevelopmentServerConfigurationCreateRequest`
  - field `expiresAt` is now required
- Model `net.accelbyte.sdk.api.ams.models.FleetListItemResponse`
  - field `instanceProvider` is now required
- Model `net.accelbyte.sdk.api.ams.models.ApiFleetParameters`
  - field `dsHostConfiguration` is change from type `ApiDSHostConfiguration` to type `ApiDSHostConfigurationParameters` 
- Operation `net.accelbyte.sdk.api.ams.operations.fleets.FleetServers`
  - field type `count` is changed from type `String` to type `Integer`

### Challenge
The following models have been updated:
- Model `net.accelbyte.sdk.api.challenge.models.ModelUserReward`
  - enum `STATUS` constant `CLAIM` is renamed to `CLAIMED` 

### IAM
- Operation `net.accelbyte.sdk.api.iam.models.AccountCreateTestUsersRequestV4`
  - field `count` is now required

### Match2
The following have been updated:
- Model `net.accelbyte.sdk.api.match2.models.MatchmakerTicket`
  - field `ExcludedSessions` is now required
  - field `MatchedAt` is now required

### Session History
- Model `net.accelbyte.sdk.api.sessionhistory.models.ApimodelsXRayTicketObservabilityRequest`
  - field `partyID` is now removed
  - field `ticketID` is now required

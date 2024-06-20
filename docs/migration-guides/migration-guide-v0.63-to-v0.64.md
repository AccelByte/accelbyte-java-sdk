<a name="v0.64.0"></a>
## [v0.64.0] - 2024-06-19

### BREAKING CHANGE

### AMS
The following models have been updated:
- Model `net.accelbyte.sdk.api.ams.models.ApiImageDetails` has a new required field `deleteAt`
- Model `net.accelbyte.sdk.api.ams.models.ApiImageListItem` has a new required field `deleteAt`

The following operations have been updated:
- `net.accelbyte.sdk.api.ams.operations.images.ImageGet` required permission changed from `ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [READ]` to `ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [READ]`
- `net.accelbyte.sdk.api.ams.operations.images.ImageList` required permission changed from `ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [READ]` to `ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [READ]`
- `net.accelbyte.sdk.api.ams.operations.images.ImagePatch` required permission changed from `ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [UPDATE]` to `ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [UPDATE]`

### Challenge
The following models have been updated:
- Model `net.accelbyte.sdk.api.challenge.models.ModelsUpdateChallengeRequest` is now renamed into `ModelUpdateChallengeRequest`
- Model `net.accelbyte.sdk.api.challenge.models.ModelUpdateGoalRequest` have existing fields now marked as `NON_NULL`:
  - `description`
  - `requirementGroups`
  - `rewards`
  - `tags`

### IAM
The following models have been updated:
- Model `net.accelbyte.sdk.api.iam.models.Validation` has a new required field `profanityFilter`

The following operations have been updated:
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GenerateTokenByNewHeadlessAccountV3` now requires authentication method `Basic` instead of `Bearer`
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.RequestTargetTokenResponseV3` now requires authentication method `Basic` instead of `Bearer`
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.PlatformTokenGrantV4` now requires authentication method `Basic` instead of `Bearer`
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.TokenGrantV4` now requires authentication method `Basic` instead of `Bearer`

- Operation `net.accelbyte.sdk.cli.api.iam.users_v4.AdminDisableMyAuthenticatorV4` now requires `body` payload
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.AdminDisableMyBackupCodesV4` now requires `body` payload
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.AdminDisableMyEmailV4` now requires `body` payload
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicDisableMyAuthenticatorV4` now requires `body` payload.
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicDisableMyBackupCodesV4` now requires `body` payload.
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicDisableMyEmailV4` now requires `body` payload

### Inventory
The following models have been updated:
- Model `ApimodelsPurchaseValidationReq` have existing fields now marked as `NON_NULL`:
  - `stackable`

The following operations have been updated:
- Operation `net.accelbyte.sdk.api.inventory.operations.admin_items.AdminListItems` and `net.accelbyte.sdk.api.inventory.operations.public_items.PublicListItems`
  - field `qtyGte` has been removed
  - enum `SortBy` has removed the following enum constants:
    - `Qty`
    - `Qtyasc`
    - `Qtydesc`

### Match2
The following models have been updated:
- Model `net.accelbyte.sdk.api.match2.models.MatchmakerTicket` has new required fields `isActive` and `ticketInformation`.

### Operations
The following operations have been updated:
- Operations `net.accelbyte.sdk.api.platform.operations.item.QueryItemsV1 ` is now renamed into `net.accelbyte.sdk.api.platform.operations.item.QueryItemsV2`
  - field `itemType` type is changed from `String` to `List<String>`
- Operations `net.accelbyte.sdk.api.platform.operations.payment_config.GetPaymentMerchantConfig` field `id` has been replaced by `namespace`

### Gdpr
The following models have been updated:
- Model `net.accelbyte.sdk.api.gdpr.models.DtoServiceConfigDTO` have existing fields now marked as `NON_NULL`:
  - `url`

### Lobby
The following WS models have been updated:
- Model `net.accelbyte.sdk.api.lobby.ws_models.ConnectNotif` name key for lobby session id has been changed from `lobbySessionId` to `lobbySessionID`
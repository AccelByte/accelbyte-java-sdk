# Seasonpass Service Index

&nbsp;  

## Operations

### Export Wrapper:  [Export](../../src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Export.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespace/{namespace}/export` | GET | ExportSeason | [ExportSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/export/ExportSeason.java) | [ExportSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/export/ExportSeason.java) |

### Season Wrapper:  [Season](../../src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Season.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons` | GET | QuerySeasons | [QuerySeasons](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/QuerySeasons.java) | [QuerySeasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/QuerySeasons.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons` | POST | CreateSeason | [CreateSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/CreateSeason.java) | [CreateSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/CreateSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/current` | GET | GetCurrentSeason | [GetCurrentSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetCurrentSeason.java) | [GetCurrentSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetCurrentSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/current/users/bulk/progression` | POST | BulkGetUserSeasonProgression | [BulkGetUserSeasonProgression](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/BulkGetUserSeasonProgression.java) | [BulkGetUserSeasonProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/BulkGetUserSeasonProgression.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}` | GET | GetSeason | [GetSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetSeason.java) | [GetSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}` | DELETE | DeleteSeason | [DeleteSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/DeleteSeason.java) | [DeleteSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/DeleteSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}` | PATCH | UpdateSeason | [UpdateSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/UpdateSeason.java) | [UpdateSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/UpdateSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/clone` | POST | CloneSeason | [CloneSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/CloneSeason.java) | [CloneSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/CloneSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/full` | GET | GetFullSeason | [GetFullSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetFullSeason.java) | [GetFullSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetFullSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/publish` | PUT | PublishSeason | [PublishSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublishSeason.java) | [PublishSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublishSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/retire` | PUT | RetireSeason | [RetireSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/RetireSeason.java) | [RetireSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/RetireSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/unpublish` | PUT | UnpublishSeason | [UnpublishSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/UnpublishSeason.java) | [UnpublishSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/UnpublishSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons` | GET | GetUserParticipatedSeasons | [GetUserParticipatedSeasons](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetUserParticipatedSeasons.java) | [GetUserParticipatedSeasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetUserParticipatedSeasons.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/passes/ownership/any` | GET | ExistsAnyPassByPassCodes | [ExistsAnyPassByPassCodes](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/ExistsAnyPassByPassCodes.java) | [ExistsAnyPassByPassCodes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/ExistsAnyPassByPassCodes.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/progression` | GET | GetCurrentUserSeasonProgression | [GetCurrentUserSeasonProgression](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetCurrentUserSeasonProgression.java) | [GetCurrentUserSeasonProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetCurrentUserSeasonProgression.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/purchasable` | POST | CheckSeasonPurchasable | [CheckSeasonPurchasable](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/CheckSeasonPurchasable.java) | [CheckSeasonPurchasable](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/CheckSeasonPurchasable.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/reset` | DELETE | ResetUserSeason | [ResetUserSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/ResetUserSeason.java) | [ResetUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/ResetUserSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/exp/history` | GET | QueryUserExpGrantHistory | [QueryUserExpGrantHistory](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/QueryUserExpGrantHistory.java) | [QueryUserExpGrantHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/QueryUserExpGrantHistory.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/exp/history/tags` | GET | QueryUserExpGrantHistoryTag | [QueryUserExpGrantHistoryTag](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/QueryUserExpGrantHistoryTag.java) | [QueryUserExpGrantHistoryTag](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/QueryUserExpGrantHistoryTag.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/{seasonId}/data` | GET | GetUserSeason | [GetUserSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetUserSeason.java) | [GetUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetUserSeason.java) |
| `/seasonpass/public/namespaces/{namespace}/seasons/current` | GET | PublicGetCurrentSeason | [PublicGetCurrentSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublicGetCurrentSeason.java) | [PublicGetCurrentSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublicGetCurrentSeason.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/current/data` | GET | PublicGetCurrentUserSeason | [PublicGetCurrentUserSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublicGetCurrentUserSeason.java) | [PublicGetCurrentUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublicGetCurrentUserSeason.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/{seasonId}/data` | GET | PublicGetUserSeason | [PublicGetUserSeason](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublicGetUserSeason.java) | [PublicGetUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublicGetUserSeason.java) |

### Pass Wrapper:  [Pass](../../src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Pass.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes` | GET | QueryPasses | [QueryPasses](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/QueryPasses.java) | [QueryPasses](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/QueryPasses.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes` | POST | CreatePass | [CreatePass](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/CreatePass.java) | [CreatePass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/CreatePass.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}` | GET | GetPass | [GetPass](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/GetPass.java) | [GetPass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/GetPass.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}` | DELETE | DeletePass | [DeletePass](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/DeletePass.java) | [DeletePass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/DeletePass.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}` | PATCH | UpdatePass | [UpdatePass](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/UpdatePass.java) | [UpdatePass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/UpdatePass.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/passes` | POST | GrantUserPass | [GrantUserPass](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/GrantUserPass.java) | [GrantUserPass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/GrantUserPass.java) |

### Reward Wrapper:  [Reward](../../src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Reward.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards` | GET | QueryRewards | [QueryRewards](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/QueryRewards.java) | [QueryRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/QueryRewards.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards` | POST | CreateReward | [CreateReward](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/CreateReward.java) | [CreateReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/CreateReward.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards/{code}` | GET | GetReward | [GetReward](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/GetReward.java) | [GetReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/GetReward.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards/{code}` | DELETE | DeleteReward | [DeleteReward](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/DeleteReward.java) | [DeleteReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/DeleteReward.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards/{code}` | PATCH | UpdateReward | [UpdateReward](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/UpdateReward.java) | [UpdateReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/UpdateReward.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/current/rewards` | POST | PublicClaimUserReward | [PublicClaimUserReward](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/PublicClaimUserReward.java) | [PublicClaimUserReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/PublicClaimUserReward.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/current/rewards/bulk` | POST | PublicBulkClaimUserRewards | [PublicBulkClaimUserRewards](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/PublicBulkClaimUserRewards.java) | [PublicBulkClaimUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/PublicBulkClaimUserRewards.java) |

### Tier Wrapper:  [Tier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Tier.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers` | GET | QueryTiers | [QueryTiers](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/QueryTiers.java) | [QueryTiers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/QueryTiers.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers` | POST | CreateTier | [CreateTier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/CreateTier.java) | [CreateTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/CreateTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers/{id}` | PUT | UpdateTier | [UpdateTier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/UpdateTier.java) | [UpdateTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/UpdateTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers/{id}` | DELETE | DeleteTier | [DeleteTier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/DeleteTier.java) | [DeleteTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/DeleteTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers/{id}/reorder` | PUT | ReorderTier | [ReorderTier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/ReorderTier.java) | [ReorderTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/ReorderTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/exp` | POST | GrantUserExp | [GrantUserExp](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/GrantUserExp.java) | [GrantUserExp](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/GrantUserExp.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/tiers` | POST | GrantUserTier | [GrantUserTier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/GrantUserTier.java) | [GrantUserTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/GrantUserTier.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `BulkUserProgressionRequest` | [BulkUserProgressionRequest](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/BulkUserProgressionRequest.java) |
| `ClaimableRewards` | [ClaimableRewards](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ClaimableRewards.java) |
| `ClaimableUserSeasonInfo` | [ClaimableUserSeasonInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ClaimableUserSeasonInfo.java) |
| `ErrorEntity` | [ErrorEntity](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ErrorEntity.java) |
| `ExcessStrategy` | [ExcessStrategy](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ExcessStrategy.java) |
| `ExpGrantHistoryInfo` | [ExpGrantHistoryInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ExpGrantHistoryInfo.java) |
| `ExpGrantHistoryPagingSlicedResult` | [ExpGrantHistoryPagingSlicedResult](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ExpGrantHistoryPagingSlicedResult.java) |
| `FieldValidationError` | [FieldValidationError](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/FieldValidationError.java) |
| `FullSeasonInfo` | [FullSeasonInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/FullSeasonInfo.java) |
| `Image` | [Image](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/Image.java) |
| `ListSeasonInfo` | [ListSeasonInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListSeasonInfo.java) |
| `ListSeasonInfoPagingSlicedResult` | [ListSeasonInfoPagingSlicedResult](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListSeasonInfoPagingSlicedResult.java) |
| `ListUserSeasonInfo` | [ListUserSeasonInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListUserSeasonInfo.java) |
| `ListUserSeasonInfoPagingSlicedResult` | [ListUserSeasonInfoPagingSlicedResult](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListUserSeasonInfoPagingSlicedResult.java) |
| `Localization` | [Localization](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/Localization.java) |
| `LocalizedPassInfo` | [LocalizedPassInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/LocalizedPassInfo.java) |
| `LocalizedSeasonInfo` | [LocalizedSeasonInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/LocalizedSeasonInfo.java) |
| `Ownership` | [Ownership](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/Ownership.java) |
| `Paging` | [Paging](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/Paging.java) |
| `PassCreate` | [PassCreate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/PassCreate.java) |
| `PassInfo` | [PassInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/PassInfo.java) |
| `PassUpdate` | [PassUpdate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/PassUpdate.java) |
| `ReasonTagsResult` | [ReasonTagsResult](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ReasonTagsResult.java) |
| `RewardCreate` | [RewardCreate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardCreate.java) |
| `RewardCurrency` | [RewardCurrency](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardCurrency.java) |
| `RewardInfo` | [RewardInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardInfo.java) |
| `RewardUpdate` | [RewardUpdate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardUpdate.java) |
| `SeasonCloneRequest` | [SeasonCloneRequest](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonCloneRequest.java) |
| `SeasonCreate` | [SeasonCreate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonCreate.java) |
| `SeasonInfo` | [SeasonInfo](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonInfo.java) |
| `SeasonSummary` | [SeasonSummary](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonSummary.java) |
| `SeasonUpdate` | [SeasonUpdate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonUpdate.java) |
| `Tier` | [Tier](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/Tier.java) |
| `TierCreate` | [TierCreate](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierCreate.java) |
| `TierInput` | [TierInput](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierInput.java) |
| `TierPagingSlicedResult` | [TierPagingSlicedResult](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierPagingSlicedResult.java) |
| `TierReorder` | [TierReorder](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierReorder.java) |
| `UserExpGrant` | [UserExpGrant](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserExpGrant.java) |
| `UserPassGrant` | [UserPassGrant](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserPassGrant.java) |
| `UserPurchasable` | [UserPurchasable](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserPurchasable.java) |
| `UserRewardClaim` | [UserRewardClaim](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserRewardClaim.java) |
| `UserSeasonSummary` | [UserSeasonSummary](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserSeasonSummary.java) |
| `UserTierGrant` | [UserTierGrant](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserTierGrant.java) |
| `ValidationErrorEntity` | [ValidationErrorEntity](../../src/main/java/net/accelbyte/sdk/api/seasonpass/models/ValidationErrorEntity.java) |

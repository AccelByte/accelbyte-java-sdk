# Achievement Service Index

&nbsp;  

## Operations

### Achievements Wrapper:  [Achievements](../../src/main/java/net/accelbyte/sdk/api/achievement/wrappers/Achievements.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/achievements` | GET | AdminListAchievements | [AdminListAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminListAchievements.java) | [AdminListAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminListAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements` | POST | AdminCreateNewAchievement | [AdminCreateNewAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminCreateNewAchievement.java) | [AdminCreateNewAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminCreateNewAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/export` | GET | ExportAchievements | [ExportAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/ExportAchievements.java) | [ExportAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/ExportAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/import` | POST | ImportAchievements | [ImportAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/ImportAchievements.java) | [ImportAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/ImportAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | GET | AdminGetAchievement | [AdminGetAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminGetAchievement.java) | [AdminGetAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminGetAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | PUT | AdminUpdateAchievement | [AdminUpdateAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminUpdateAchievement.java) | [AdminUpdateAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminUpdateAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | DELETE | AdminDeleteAchievement | [AdminDeleteAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminDeleteAchievement.java) | [AdminDeleteAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminDeleteAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | PATCH | AdminUpdateAchievementListOrder | [AdminUpdateAchievementListOrder](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminUpdateAchievementListOrder.java) | [AdminUpdateAchievementListOrder](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminUpdateAchievementListOrder.java) |
| `/achievement/v1/public/namespaces/{namespace}/achievements` | GET | PublicListAchievements | [PublicListAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/PublicListAchievements.java) | [PublicListAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/PublicListAchievements.java) |
| `/achievement/v1/public/namespaces/{namespace}/achievements/{achievementCode}` | GET | PublicGetAchievement | [PublicGetAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/PublicGetAchievement.java) | [PublicGetAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/PublicGetAchievement.java) |

### Global Achievements Wrapper:  [GlobalAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/wrappers/GlobalAchievements.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/global/achievements` | GET | AdminListGlobalAchievements | [AdminListGlobalAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/AdminListGlobalAchievements.java) | [AdminListGlobalAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/AdminListGlobalAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/global/achievements/{achievementCode}/contributors` | GET | AdminListGlobalAchievementContributors | [AdminListGlobalAchievementContributors](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/AdminListGlobalAchievementContributors.java) | [AdminListGlobalAchievementContributors](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/AdminListGlobalAchievementContributors.java) |
| `/achievement/v1/admin/namespaces/{namespace}/global/achievements/{achievementCode}/reset` | DELETE | ResetGlobalAchievement | [ResetGlobalAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ResetGlobalAchievement.java) | [ResetGlobalAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ResetGlobalAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/global/achievements` | GET | AdminListUserContributions | [AdminListUserContributions](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/AdminListUserContributions.java) | [AdminListUserContributions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/AdminListUserContributions.java) |
| `/achievement/v1/public/namespaces/{namespace}/global/achievements` | GET | PublicListGlobalAchievements | [PublicListGlobalAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/PublicListGlobalAchievements.java) | [PublicListGlobalAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/PublicListGlobalAchievements.java) |
| `/achievement/v1/public/namespaces/{namespace}/global/achievements/{achievementCode}/contributors` | GET | ListGlobalAchievementContributors | [ListGlobalAchievementContributors](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ListGlobalAchievementContributors.java) | [ListGlobalAchievementContributors](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ListGlobalAchievementContributors.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/global/achievements` | GET | ListUserContributions | [ListUserContributions](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ListUserContributions.java) | [ListUserContributions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ListUserContributions.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/global/achievements/{achievementCode}/claim` | POST | ClaimGlobalAchievementReward | [ClaimGlobalAchievementReward](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ClaimGlobalAchievementReward.java) | [ClaimGlobalAchievementReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ClaimGlobalAchievementReward.java) |

### Tags Wrapper:  [Tags](../../src/main/java/net/accelbyte/sdk/api/achievement/wrappers/Tags.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/tags` | GET | AdminListTags | [AdminListTags](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/tags/AdminListTags.java) | [AdminListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/tags/AdminListTags.java) |
| `/achievement/v1/public/namespaces/{namespace}/tags` | GET | PublicListTags | [PublicListTags](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/tags/PublicListTags.java) | [PublicListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/tags/PublicListTags.java) |

### User Achievements Wrapper:  [UserAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/wrappers/UserAchievements.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements` | GET | AdminListUserAchievements | [AdminListUserAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminListUserAchievements.java) | [AdminListUserAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminListUserAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements/{achievementCode}/reset` | DELETE | AdminResetAchievement | [AdminResetAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminResetAchievement.java) | [AdminResetAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminResetAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements/{achievementCode}/unlock` | PUT | AdminUnlockAchievement | [AdminUnlockAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminUnlockAchievement.java) | [AdminUnlockAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminUnlockAchievement.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/achievements` | GET | PublicListUserAchievements | [PublicListUserAchievements](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/PublicListUserAchievements.java) | [PublicListUserAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/PublicListUserAchievements.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/achievements/{achievementCode}/unlock` | PUT | PublicUnlockAchievement | [PublicUnlockAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/PublicUnlockAchievement.java) | [PublicUnlockAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/PublicUnlockAchievement.java) |

### Anonymization Wrapper:  [Anonymization](../../src/main/java/net/accelbyte/sdk/api/achievement/wrappers/Anonymization.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/anonymization/achievements` | DELETE | AdminAnonymizeUserAchievement | [AdminAnonymizeUserAchievement](../../src/main/java/net/accelbyte/sdk/api/achievement/operations/anonymization/AdminAnonymizeUserAchievement.java) | [AdminAnonymizeUserAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/anonymization/AdminAnonymizeUserAchievement.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.AchievementOrderUpdateRequest` | [ModelsAchievementOrderUpdateRequest](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementOrderUpdateRequest.java) |
| `models.AchievementRequest` | [ModelsAchievementRequest](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementRequest.java) |
| `models.AchievementResponse` | [ModelsAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementResponse.java) |
| `models.AchievementUpdateRequest` | [ModelsAchievementUpdateRequest](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementUpdateRequest.java) |
| `models.AdditionalInfo` | [ModelsAdditionalInfo](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAdditionalInfo.java) |
| `models.ContributorResponse` | [ModelsContributorResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsContributorResponse.java) |
| `models.GlobalAchievementResponse` | [ModelsGlobalAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsGlobalAchievementResponse.java) |
| `models.Icon` | [ModelsIcon](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsIcon.java) |
| `models.PaginatedAchievementResponse` | [ModelsPaginatedAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedAchievementResponse.java) |
| `models.PaginatedContributorResponse` | [ModelsPaginatedContributorResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedContributorResponse.java) |
| `models.PaginatedGlobalAchievementResponse` | [ModelsPaginatedGlobalAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedGlobalAchievementResponse.java) |
| `models.PaginatedTagResponse` | [ModelsPaginatedTagResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedTagResponse.java) |
| `models.PaginatedUserAchievementResponse` | [ModelsPaginatedUserAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedUserAchievementResponse.java) |
| `models.PaginatedUserContributionResponse` | [ModelsPaginatedUserContributionResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedUserContributionResponse.java) |
| `models.Pagination` | [ModelsPagination](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPagination.java) |
| `models.PublicAchievementResponse` | [ModelsPublicAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPublicAchievementResponse.java) |
| `models.PublicAchievementsResponse` | [ModelsPublicAchievementsResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPublicAchievementsResponse.java) |
| `models.TagResponse` | [ModelsTagResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsTagResponse.java) |
| `models.UserAchievementResponse` | [ModelsUserAchievementResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsUserAchievementResponse.java) |
| `models.UserContributionResponse` | [ModelsUserContributionResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsUserContributionResponse.java) |
| `response.Error` | [ResponseError](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ResponseError.java) |
| `service.ImportConfigResponse` | [ServiceImportConfigResponse](../../src/main/java/net/accelbyte/sdk/api/achievement/models/ServiceImportConfigResponse.java) |

# Platform Service Index

&nbsp;  

## Operations

### FulfillmentScript Wrapper:  [FulfillmentScript](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/FulfillmentScript.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/fulfillment/scripts` | GET | ListFulfillmentScripts | [ListFulfillmentScripts](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment_script/ListFulfillmentScripts.java) |
| `/platform/admin/fulfillment/scripts/tests/eval` | POST | TestFulfillmentScriptEval | [TestFulfillmentScriptEval](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment_script/TestFulfillmentScriptEval.java) |
| `/platform/admin/fulfillment/scripts/{id}` | GET | GetFulfillmentScript | [GetFulfillmentScript](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment_script/GetFulfillmentScript.java) |
| `/platform/admin/fulfillment/scripts/{id}` | POST | CreateFulfillmentScript | [CreateFulfillmentScript](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment_script/CreateFulfillmentScript.java) |
| `/platform/admin/fulfillment/scripts/{id}` | DELETE | DeleteFulfillmentScript | [DeleteFulfillmentScript](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment_script/DeleteFulfillmentScript.java) |
| `/platform/admin/fulfillment/scripts/{id}` | PATCH | UpdateFulfillmentScript | [UpdateFulfillmentScript](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment_script/UpdateFulfillmentScript.java) |

### Campaign Wrapper:  [Campaign](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Campaign.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/campaigns` | GET | QueryCampaigns | [QueryCampaigns](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/QueryCampaigns.java) |
| `/platform/admin/namespaces/{namespace}/campaigns` | POST | CreateCampaign | [CreateCampaign](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/CreateCampaign.java) |
| `/platform/admin/namespaces/{namespace}/campaigns/{campaignId}` | GET | GetCampaign | [GetCampaign](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/GetCampaign.java) |
| `/platform/admin/namespaces/{namespace}/campaigns/{campaignId}` | PUT | UpdateCampaign | [UpdateCampaign](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/UpdateCampaign.java) |
| `/platform/admin/namespaces/{namespace}/campaigns/{campaignId}/dynamic` | GET | GetCampaignDynamic | [GetCampaignDynamic](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/GetCampaignDynamic.java) |
| `/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}` | GET | QueryCodes | [QueryCodes](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/QueryCodes.java) |
| `/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}` | POST | CreateCodes | [CreateCodes](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/CreateCodes.java) |
| `/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}/codes.csv` | GET | Download | [Download](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/Download.java) |
| `/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}/disable/bulk` | PUT | BulkDisableCodes | [BulkDisableCodes](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/BulkDisableCodes.java) |
| `/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}/enable/bulk` | PUT | BulkEnableCodes | [BulkEnableCodes](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/BulkEnableCodes.java) |
| `/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}/history` | GET | QueryRedeemHistory | [QueryRedeemHistory](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/QueryRedeemHistory.java) |
| `/platform/admin/namespaces/{namespace}/codes/{code}` | GET | GetCode | [GetCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/GetCode.java) |
| `/platform/admin/namespaces/{namespace}/codes/{code}/disable` | PUT | DisableCode | [DisableCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/DisableCode.java) |
| `/platform/admin/namespaces/{namespace}/codes/{code}/enable` | PUT | EnableCode | [EnableCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/EnableCode.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/redemption` | POST | ApplyUserRedemption | [ApplyUserRedemption](../src/main/java/net/accelbyte/sdk/api/platform/operations/campaign/ApplyUserRedemption.java) |

### Category Wrapper:  [Category](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Category.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/categories` | GET | GetRootCategories | [GetRootCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/GetRootCategories.java) |
| `/platform/admin/namespaces/{namespace}/categories` | POST | CreateCategory | [CreateCategory](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/CreateCategory.java) |
| `/platform/admin/namespaces/{namespace}/categories/basic` | GET | ListCategoriesBasic | [ListCategoriesBasic](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/ListCategoriesBasic.java) |
| `/platform/admin/namespaces/{namespace}/categories/{categoryPath}` | GET | GetCategory | [GetCategory](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/GetCategory.java) |
| `/platform/admin/namespaces/{namespace}/categories/{categoryPath}` | PUT | UpdateCategory | [UpdateCategory](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/UpdateCategory.java) |
| `/platform/admin/namespaces/{namespace}/categories/{categoryPath}` | DELETE | DeleteCategory | [DeleteCategory](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/DeleteCategory.java) |
| `/platform/admin/namespaces/{namespace}/categories/{categoryPath}/children` | GET | GetChildCategories | [GetChildCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/GetChildCategories.java) |
| `/platform/admin/namespaces/{namespace}/categories/{categoryPath}/descendants` | GET | GetDescendantCategories | [GetDescendantCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/GetDescendantCategories.java) |
| `/platform/public/namespaces/{namespace}/categories` | GET | PublicGetRootCategories | [PublicGetRootCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/PublicGetRootCategories.java) |
| `/platform/public/namespaces/{namespace}/categories/download` | GET | DownloadCategories | [DownloadCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/DownloadCategories.java) |
| `/platform/public/namespaces/{namespace}/categories/{categoryPath}` | GET | PublicGetCategory | [PublicGetCategory](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/PublicGetCategory.java) |
| `/platform/public/namespaces/{namespace}/categories/{categoryPath}/children` | GET | PublicGetChildCategories | [PublicGetChildCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/PublicGetChildCategories.java) |
| `/platform/public/namespaces/{namespace}/categories/{categoryPath}/descendants` | GET | PublicGetDescendantCategories | [PublicGetDescendantCategories](../src/main/java/net/accelbyte/sdk/api/platform/operations/category/PublicGetDescendantCategories.java) |

### Currency Wrapper:  [Currency](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Currency.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/currencies` | GET | ListCurrencies | [ListCurrencies](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/ListCurrencies.java) |
| `/platform/admin/namespaces/{namespace}/currencies` | POST | CreateCurrency | [CreateCurrency](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/CreateCurrency.java) |
| `/platform/admin/namespaces/{namespace}/currencies/{currencyCode}` | PUT | UpdateCurrency | [UpdateCurrency](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/UpdateCurrency.java) |
| `/platform/admin/namespaces/{namespace}/currencies/{currencyCode}` | DELETE | DeleteCurrency | [DeleteCurrency](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/DeleteCurrency.java) |
| `/platform/admin/namespaces/{namespace}/currencies/{currencyCode}/config` | GET | GetCurrencyConfig | [GetCurrencyConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/GetCurrencyConfig.java) |
| `/platform/admin/namespaces/{namespace}/currencies/{currencyCode}/summary` | GET | GetCurrencySummary | [GetCurrencySummary](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/GetCurrencySummary.java) |
| `/platform/public/namespaces/{namespace}/currencies` | GET | PublicListCurrencies | [PublicListCurrencies](../src/main/java/net/accelbyte/sdk/api/platform/operations/currency/PublicListCurrencies.java) |

### DLC Wrapper:  [DLC](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/DLC.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/dlc/config/item` | GET | GetDLCItemConfig | [GetDLCItemConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/GetDLCItemConfig.java) |
| `/platform/admin/namespaces/{namespace}/dlc/config/item` | PUT | UpdateDLCItemConfig | [UpdateDLCItemConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/UpdateDLCItemConfig.java) |
| `/platform/admin/namespaces/{namespace}/dlc/config/item` | DELETE | DeleteDLCItemConfig | [DeleteDLCItemConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/DeleteDLCItemConfig.java) |
| `/platform/admin/namespaces/{namespace}/dlc/config/platformMap` | GET | GetPlatformDLCConfig | [GetPlatformDLCConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/GetPlatformDLCConfig.java) |
| `/platform/admin/namespaces/{namespace}/dlc/config/platformMap` | PUT | UpdatePlatformDLCConfig | [UpdatePlatformDLCConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/UpdatePlatformDLCConfig.java) |
| `/platform/admin/namespaces/{namespace}/dlc/config/platformMap` | DELETE | DeletePlatformDLCConfig | [DeletePlatformDLCConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/DeletePlatformDLCConfig.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/dlc/psn/sync` | PUT | PublicSyncPsnDlcInventory | [PublicSyncPsnDlcInventory](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/PublicSyncPsnDlcInventory.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/dlc/steam/sync` | PUT | SyncSteamDLC | [SyncSteamDLC](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/SyncSteamDLC.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/dlc/xbl/sync` | PUT | SyncXboxDLC | [SyncXboxDLC](../src/main/java/net/accelbyte/sdk/api/platform/operations/dlc/SyncXboxDLC.java) |

### Entitlement Wrapper:  [Entitlement](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Entitlement.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/entitlements` | GET | QueryEntitlements | [QueryEntitlements](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/QueryEntitlements.java) |
| `/platform/admin/namespaces/{namespace}/entitlements/{entitlementId}` | GET | GetEntitlement | [GetEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements` | GET | QueryUserEntitlements | [QueryUserEntitlements](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/QueryUserEntitlements.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements` | POST | GrantUserEntitlement | [GrantUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GrantUserEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/byAppId` | GET | GetUserAppEntitlementByAppId | [GetUserAppEntitlementByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserAppEntitlementByAppId.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/byAppType` | GET | QueryUserEntitlementsByAppType | [QueryUserEntitlementsByAppType](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/QueryUserEntitlementsByAppType.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/byItemId` | GET | GetUserEntitlementByItemId | [GetUserEntitlementByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserEntitlementByItemId.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/bySku` | GET | GetUserEntitlementBySku | [GetUserEntitlementBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserEntitlementBySku.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/ownership/any` | GET | ExistsAnyUserActiveEntitlement | [ExistsAnyUserActiveEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/ExistsAnyUserActiveEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/ownership/anyOf` | GET | ExistsAnyUserActiveEntitlementByItemIds | [ExistsAnyUserActiveEntitlementByItemIds](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/ExistsAnyUserActiveEntitlementByItemIds.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/ownership/byAppId` | GET | GetUserAppEntitlementOwnershipByAppId | [GetUserAppEntitlementOwnershipByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserAppEntitlementOwnershipByAppId.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/ownership/byItemId` | GET | GetUserEntitlementOwnershipByItemId | [GetUserEntitlementOwnershipByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserEntitlementOwnershipByItemId.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/ownership/bySku` | GET | GetUserEntitlementOwnershipBySku | [GetUserEntitlementOwnershipBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserEntitlementOwnershipBySku.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/revoke/byIds` | PUT | RevokeUserEntitlements | [RevokeUserEntitlements](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/RevokeUserEntitlements.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}` | GET | GetUserEntitlement | [GetUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}` | PUT | UpdateUserEntitlement | [UpdateUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/UpdateUserEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/decrement` | PUT | ConsumeUserEntitlement | [ConsumeUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/ConsumeUserEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/disable` | PUT | DisableUserEntitlement | [DisableUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/DisableUserEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/enable` | PUT | EnableUserEntitlement | [EnableUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/EnableUserEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/history` | GET | GetUserEntitlementHistories | [GetUserEntitlementHistories](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/GetUserEntitlementHistories.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/revoke` | PUT | RevokeUserEntitlement | [RevokeUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/RevokeUserEntitlement.java) |
| `/platform/public/namespaces/{namespace}/users/me/entitlements/ownership/any` | GET | PublicExistsAnyMyActiveEntitlement | [PublicExistsAnyMyActiveEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicExistsAnyMyActiveEntitlement.java) |
| `/platform/public/namespaces/{namespace}/users/me/entitlements/ownership/byAppId` | GET | PublicGetMyAppEntitlementOwnershipByAppId | [PublicGetMyAppEntitlementOwnershipByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetMyAppEntitlementOwnershipByAppId.java) |
| `/platform/public/namespaces/{namespace}/users/me/entitlements/ownership/byItemId` | GET | PublicGetMyEntitlementOwnershipByItemId | [PublicGetMyEntitlementOwnershipByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetMyEntitlementOwnershipByItemId.java) |
| `/platform/public/namespaces/{namespace}/users/me/entitlements/ownership/bySku` | GET | PublicGetMyEntitlementOwnershipBySku | [PublicGetMyEntitlementOwnershipBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetMyEntitlementOwnershipBySku.java) |
| `/platform/public/namespaces/{namespace}/users/me/entitlements/ownershipToken` | GET | PublicGetEntitlementOwnershipToken | [PublicGetEntitlementOwnershipToken](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetEntitlementOwnershipToken.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements` | GET | PublicQueryUserEntitlements | [PublicQueryUserEntitlements](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicQueryUserEntitlements.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/byAppId` | GET | PublicGetUserAppEntitlementByAppId | [PublicGetUserAppEntitlementByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserAppEntitlementByAppId.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/byAppType` | GET | PublicQueryUserEntitlementsByAppType | [PublicQueryUserEntitlementsByAppType](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicQueryUserEntitlementsByAppType.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/byItemId` | GET | PublicGetUserEntitlementByItemId | [PublicGetUserEntitlementByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserEntitlementByItemId.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/bySku` | GET | PublicGetUserEntitlementBySku | [PublicGetUserEntitlementBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserEntitlementBySku.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/any` | GET | PublicExistsAnyUserActiveEntitlement | [PublicExistsAnyUserActiveEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicExistsAnyUserActiveEntitlement.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/byAppId` | GET | PublicGetUserAppEntitlementOwnershipByAppId | [PublicGetUserAppEntitlementOwnershipByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserAppEntitlementOwnershipByAppId.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/byItemId` | GET | PublicGetUserEntitlementOwnershipByItemId | [PublicGetUserEntitlementOwnershipByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserEntitlementOwnershipByItemId.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/bySku` | GET | PublicGetUserEntitlementOwnershipBySku | [PublicGetUserEntitlementOwnershipBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserEntitlementOwnershipBySku.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}` | GET | PublicGetUserEntitlement | [PublicGetUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicGetUserEntitlement.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/decrement` | PUT | PublicConsumeUserEntitlement | [PublicConsumeUserEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/entitlement/PublicConsumeUserEntitlement.java) |

### Fulfillment Wrapper:  [Fulfillment](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Fulfillment.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/fulfillment/history` | GET | QueryFulfillmentHistories | [QueryFulfillmentHistories](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment/QueryFulfillmentHistories.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/fulfillment` | POST | FulfillItem | [FulfillItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment/FulfillItem.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/fulfillment/code` | POST | RedeemCode | [RedeemCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment/RedeemCode.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/fulfillment/rewards` | POST | FulfillRewards | [FulfillRewards](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment/FulfillRewards.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/fulfillment/code` | POST | PublicRedeemCode | [PublicRedeemCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/fulfillment/PublicRedeemCode.java) |

### IAP Wrapper:  [IAP](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/IAP.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/iap/config/apple` | GET | GetAppleIAPConfig | [GetAppleIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetAppleIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/apple` | PUT | UpdateAppleIAPConfig | [UpdateAppleIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateAppleIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/apple` | DELETE | DeleteAppleIAPConfig | [DeleteAppleIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteAppleIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/epicgames` | GET | GetEpicGamesIAPConfig | [GetEpicGamesIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetEpicGamesIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/epicgames` | PUT | UpdateEpicGamesIAPConfig | [UpdateEpicGamesIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateEpicGamesIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/epicgames` | DELETE | DeleteEpicGamesIAPConfig | [DeleteEpicGamesIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteEpicGamesIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/google` | GET | GetGoogleIAPConfig | [GetGoogleIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetGoogleIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/google` | PUT | UpdateGoogleIAPConfig | [UpdateGoogleIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateGoogleIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/google` | DELETE | DeleteGoogleIAPConfig | [DeleteGoogleIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteGoogleIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/google/cert` | PUT | UpdateGoogleP12File | [UpdateGoogleP12File](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateGoogleP12File.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/item` | GET | GetIAPItemConfig | [GetIAPItemConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetIAPItemConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/item` | PUT | UpdateIAPItemConfig | [UpdateIAPItemConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateIAPItemConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/item` | DELETE | DeleteIAPItemConfig | [DeleteIAPItemConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteIAPItemConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/playstation` | GET | GetPlayStationIAPConfig | [GetPlayStationIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetPlayStationIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/playstation` | PUT | UpdatePlaystationIAPConfig | [UpdatePlaystationIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdatePlaystationIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/playstation` | DELETE | DeletePlaystationIAPConfig | [DeletePlaystationIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeletePlaystationIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/stadia` | GET | GetStadiaIAPConfig | [GetStadiaIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetStadiaIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/stadia` | DELETE | DeleteStadiaIAPConfig | [DeleteStadiaIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteStadiaIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/stadia/cert` | PUT | UpdateStadiaJsonConfigFile | [UpdateStadiaJsonConfigFile](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateStadiaJsonConfigFile.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/steam` | GET | GetSteamIAPConfig | [GetSteamIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetSteamIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/steam` | PUT | UpdateSteamIAPConfig | [UpdateSteamIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateSteamIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/steam` | DELETE | DeleteSteamIAPConfig | [DeleteSteamIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteSteamIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/twitch` | GET | GetTwitchIAPConfig | [GetTwitchIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetTwitchIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/twitch` | PUT | UpdateTwitchIAPConfig | [UpdateTwitchIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateTwitchIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/twitch` | DELETE | DeleteTwitchIAPConfig | [DeleteTwitchIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteTwitchIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/xbl` | GET | GetXblIAPConfig | [GetXblIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/GetXblIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/xbl` | PUT | UpdateXblIAPConfig | [UpdateXblIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateXblIAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/xbl` | DELETE | DeleteXblAPConfig | [DeleteXblAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/DeleteXblAPConfig.java) |
| `/platform/admin/namespaces/{namespace}/iap/config/xbl/cert` | PUT | UpdateXblBPCertFile | [UpdateXblBPCertFile](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/UpdateXblBPCertFile.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/iap` | GET | QueryUserIAPOrders | [QueryUserIAPOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/QueryUserIAPOrders.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/iap/all` | GET | QueryAllUserIAPOrders | [QueryAllUserIAPOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/QueryAllUserIAPOrders.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/iap/mock/receipt` | PUT | MockFulfillIAPItem | [MockFulfillIAPItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/MockFulfillIAPItem.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/apple/receipt` | PUT | PublicFulfillAppleIAPItem | [PublicFulfillAppleIAPItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/PublicFulfillAppleIAPItem.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/epicgames/sync` | PUT | SyncEpicGamesInventory | [SyncEpicGamesInventory](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/SyncEpicGamesInventory.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/google/receipt` | PUT | PublicFulfillGoogleIAPItem | [PublicFulfillGoogleIAPItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/PublicFulfillGoogleIAPItem.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/psn/sync` | PUT | PublicReconcilePlayStationStore | [PublicReconcilePlayStationStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/PublicReconcilePlayStationStore.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/stadia/sync` | PUT | SyncStadiaEntitlement | [SyncStadiaEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/SyncStadiaEntitlement.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/steam/sync` | PUT | SyncSteamInventory | [SyncSteamInventory](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/SyncSteamInventory.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/twitch/sync` | PUT | SyncTwitchDropsEntitlement | [SyncTwitchDropsEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/SyncTwitchDropsEntitlement.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/iap/xbl/sync` | PUT | SyncXboxInventory | [SyncXboxInventory](../src/main/java/net/accelbyte/sdk/api/platform/operations/iap/SyncXboxInventory.java) |

### Item Wrapper:  [Item](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Item.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/items` | PUT | SyncInGameItem | [SyncInGameItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/SyncInGameItem.java) |
| `/platform/admin/namespaces/{namespace}/items` | POST | CreateItem | [CreateItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/CreateItem.java) |
| `/platform/admin/namespaces/{namespace}/items/byAppId` | GET | GetItemByAppId | [GetItemByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetItemByAppId.java) |
| `/platform/admin/namespaces/{namespace}/items/byCriteria` | GET | QueryItems | [QueryItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/QueryItems.java) |
| `/platform/admin/namespaces/{namespace}/items/byFeatures/basic` | GET | ListBasicItemsByFeatures | [ListBasicItemsByFeatures](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/ListBasicItemsByFeatures.java) |
| `/platform/admin/namespaces/{namespace}/items/bySku` | GET | GetItemBySku | [GetItemBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetItemBySku.java) |
| `/platform/admin/namespaces/{namespace}/items/bySku/locale` | GET | GetLocaleItemBySku | [GetLocaleItemBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetLocaleItemBySku.java) |
| `/platform/admin/namespaces/{namespace}/items/itemId/bySku` | GET | GetItemIdBySku | [GetItemIdBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetItemIdBySku.java) |
| `/platform/admin/namespaces/{namespace}/items/locale/byIds` | GET | BulkGetLocaleItems | [BulkGetLocaleItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/BulkGetLocaleItems.java) |
| `/platform/admin/namespaces/{namespace}/items/search` | GET | SearchItems | [SearchItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/SearchItems.java) |
| `/platform/admin/namespaces/{namespace}/items/uncategorized` | GET | QueryUncategorizedItems | [QueryUncategorizedItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/QueryUncategorizedItems.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}` | GET | GetItem | [GetItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}` | PUT | UpdateItem | [UpdateItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/UpdateItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}` | DELETE | DeleteItem | [DeleteItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/DeleteItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/acquire` | PUT | AcquireItem | [AcquireItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/AcquireItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/app` | GET | GetApp | [GetApp](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetApp.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/app` | PUT | UpdateApp | [UpdateApp](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/UpdateApp.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/disable` | PUT | DisableItem | [DisableItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/DisableItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/dynamic` | GET | GetItemDynamicData | [GetItemDynamicData](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetItemDynamicData.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/enable` | PUT | EnableItem | [EnableItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/EnableItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/features/{feature}` | PUT | FeatureItem | [FeatureItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/FeatureItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/features/{feature}` | DELETE | DefeatureItem | [DefeatureItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/DefeatureItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/locale` | GET | GetLocaleItem | [GetLocaleItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/GetLocaleItem.java) |
| `/platform/admin/namespaces/{namespace}/items/{itemId}/return` | PUT | ReturnItem | [ReturnItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/ReturnItem.java) |
| `/platform/public/namespaces/{namespace}/items/byAppId` | GET | PublicGetItemByAppId | [PublicGetItemByAppId](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicGetItemByAppId.java) |
| `/platform/public/namespaces/{namespace}/items/byCriteria` | GET | PublicQueryItems | [PublicQueryItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicQueryItems.java) |
| `/platform/public/namespaces/{namespace}/items/bySku` | GET | PublicGetItemBySku | [PublicGetItemBySku](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicGetItemBySku.java) |
| `/platform/public/namespaces/{namespace}/items/locale/byIds` | GET | PublicBulkGetItems | [PublicBulkGetItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicBulkGetItems.java) |
| `/platform/public/namespaces/{namespace}/items/search` | GET | PublicSearchItems | [PublicSearchItems](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicSearchItems.java) |
| `/platform/public/namespaces/{namespace}/items/{itemId}/app/locale` | GET | PublicGetApp | [PublicGetApp](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicGetApp.java) |
| `/platform/public/namespaces/{namespace}/items/{itemId}/dynamic` | GET | PublicGetItemDynamicData | [PublicGetItemDynamicData](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicGetItemDynamicData.java) |
| `/platform/public/namespaces/{namespace}/items/{itemId}/locale` | GET | PublicGetItem | [PublicGetItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/item/PublicGetItem.java) |

### KeyGroup Wrapper:  [KeyGroup](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/KeyGroup.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/keygroups` | GET | QueryKeyGroups | [QueryKeyGroups](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/QueryKeyGroups.java) |
| `/platform/admin/namespaces/{namespace}/keygroups` | POST | CreateKeyGroup | [CreateKeyGroup](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/CreateKeyGroup.java) |
| `/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}` | GET | GetKeyGroup | [GetKeyGroup](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/GetKeyGroup.java) |
| `/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}` | PUT | UpdateKeyGroup | [UpdateKeyGroup](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/UpdateKeyGroup.java) |
| `/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}/dynamic` | GET | GetKeyGroupDynamic | [GetKeyGroupDynamic](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/GetKeyGroupDynamic.java) |
| `/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}/keys` | GET | ListKeys | [ListKeys](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/ListKeys.java) |
| `/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}/keys` | POST | UploadKeys | [UploadKeys](../src/main/java/net/accelbyte/sdk/api/platform/operations/key_group/UploadKeys.java) |

### Order Wrapper:  [Order](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Order.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/orders` | GET | QueryOrders | [QueryOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/QueryOrders.java) |
| `/platform/admin/namespaces/{namespace}/orders/stats` | GET | GetOrderStatistics | [GetOrderStatistics](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/GetOrderStatistics.java) |
| `/platform/admin/namespaces/{namespace}/orders/{orderNo}` | GET | GetOrder | [GetOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/GetOrder.java) |
| `/platform/admin/namespaces/{namespace}/orders/{orderNo}/refund` | PUT | RefundOrder | [RefundOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/RefundOrder.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders` | GET | QueryUserOrders | [QueryUserOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/QueryUserOrders.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/countOfItem` | GET | CountOfPurchasedItem | [CountOfPurchasedItem](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/CountOfPurchasedItem.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}` | GET | GetUserOrder | [GetUserOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/GetUserOrder.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}` | PUT | UpdateUserOrderStatus | [UpdateUserOrderStatus](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/UpdateUserOrderStatus.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}/fulfill` | PUT | FulfillUserOrder | [FulfillUserOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/FulfillUserOrder.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}/grant` | GET | GetUserOrderGrant | [GetUserOrderGrant](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/GetUserOrderGrant.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}/history` | GET | GetUserOrderHistories | [GetUserOrderHistories](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/GetUserOrderHistories.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}/notifications` | POST | ProcessUserOrderNotification | [ProcessUserOrderNotification](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/ProcessUserOrderNotification.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/orders/{orderNo}/receipt.pdf` | GET | DownloadUserOrderReceipt | [DownloadUserOrderReceipt](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/DownloadUserOrderReceipt.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/orders` | GET | PublicQueryUserOrders | [PublicQueryUserOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/PublicQueryUserOrders.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/orders` | POST | PublicCreateUserOrder | [PublicCreateUserOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/PublicCreateUserOrder.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/orders/{orderNo}` | GET | PublicGetUserOrder | [PublicGetUserOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/PublicGetUserOrder.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/orders/{orderNo}/cancel` | PUT | PublicCancelUserOrder | [PublicCancelUserOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/PublicCancelUserOrder.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/orders/{orderNo}/history` | GET | PublicGetUserOrderHistories | [PublicGetUserOrderHistories](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/PublicGetUserOrderHistories.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/orders/{orderNo}/receipt.pdf` | GET | PublicDownloadUserOrderReceipt | [PublicDownloadUserOrderReceipt](../src/main/java/net/accelbyte/sdk/api/platform/operations/order/PublicDownloadUserOrderReceipt.java) |

### PaymentCallbackConfig Wrapper:  [PaymentCallbackConfig](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/PaymentCallbackConfig.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/payment/config/callback` | GET | GetPaymentCallbackConfig | [GetPaymentCallbackConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_callback_config/GetPaymentCallbackConfig.java) |
| `/platform/admin/namespaces/{namespace}/payment/config/callback` | PUT | UpdatePaymentCallbackConfig | [UpdatePaymentCallbackConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_callback_config/UpdatePaymentCallbackConfig.java) |

### Payment Wrapper:  [Payment](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Payment.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/payment/notifications` | GET | QueryPaymentNotifications | [QueryPaymentNotifications](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/QueryPaymentNotifications.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders` | GET | QueryPaymentOrders | [QueryPaymentOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/QueryPaymentOrders.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders/byExtTxId` | GET | ListExtOrderNoByExtTxId | [ListExtOrderNoByExtTxId](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/ListExtOrderNoByExtTxId.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}` | GET | GetPaymentOrder | [GetPaymentOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/GetPaymentOrder.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}` | PUT | ChargePaymentOrder | [ChargePaymentOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/ChargePaymentOrder.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}/simulate-notification` | PUT | SimulatePaymentOrderNotification | [SimulatePaymentOrderNotification](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/SimulatePaymentOrderNotification.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}/status` | GET | GetPaymentOrderChargeStatus | [GetPaymentOrderChargeStatus](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/GetPaymentOrderChargeStatus.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/payment/orders` | POST | CreateUserPaymentOrder | [CreateUserPaymentOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/CreateUserPaymentOrder.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/payment/orders/{paymentOrderNo}/refund` | PUT | RefundUserPaymentOrder | [RefundUserPaymentOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment/RefundUserPaymentOrder.java) |

### Payment(Dedicated) Wrapper:  [PaymentDedicated](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/PaymentDedicated.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/payment/orders` | POST | CreatePaymentOrderByDedicated | [CreatePaymentOrderByDedicated](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_dedicated/CreatePaymentOrderByDedicated.java) |
| `/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}/refund` | PUT | RefundPaymentOrderByDedicated | [RefundPaymentOrderByDedicated](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_dedicated/RefundPaymentOrderByDedicated.java) |
| `/platform/admin/payment/orders` | GET | SyncPaymentOrders | [SyncPaymentOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_dedicated/SyncPaymentOrders.java) |

### Reward Wrapper:  [Reward](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Reward.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/rewards` | POST | CreateReward | [CreateReward](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/CreateReward.java) |
| `/platform/admin/namespaces/{namespace}/rewards/byCriteria` | GET | QueryRewards | [QueryRewards](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/QueryRewards.java) |
| `/platform/admin/namespaces/{namespace}/rewards/export` | GET | ExportRewards | [ExportRewards](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/ExportRewards.java) |
| `/platform/admin/namespaces/{namespace}/rewards/import` | POST | ImportRewards | [ImportRewards](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/ImportRewards.java) |
| `/platform/admin/namespaces/{namespace}/rewards/{rewardId}` | GET | GetReward | [GetReward](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/GetReward.java) |
| `/platform/admin/namespaces/{namespace}/rewards/{rewardId}` | PUT | UpdateReward | [UpdateReward](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/UpdateReward.java) |
| `/platform/admin/namespaces/{namespace}/rewards/{rewardId}` | DELETE | DeleteReward | [DeleteReward](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/DeleteReward.java) |
| `/platform/admin/namespaces/{namespace}/rewards/{rewardId}/match` | PUT | CheckEventCondition | [CheckEventCondition](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/CheckEventCondition.java) |
| `/platform/public/namespaces/{namespace}/rewards/byCode` | GET | GetRewardByCode | [GetRewardByCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/GetRewardByCode.java) |
| `/platform/public/namespaces/{namespace}/rewards/byCriteria` | GET | QueryRewards1 | [QueryRewards1](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/QueryRewards1.java) |
| `/platform/public/namespaces/{namespace}/rewards/{rewardId}` | GET | GetReward1 | [GetReward1](../src/main/java/net/accelbyte/sdk/api/platform/operations/reward/GetReward1.java) |

### Store Wrapper:  [Store](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Store.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/stores` | GET | ListStores | [ListStores](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/ListStores.java) |
| `/platform/admin/namespaces/{namespace}/stores` | POST | CreateStore | [CreateStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/CreateStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/import` | PUT | ImportStore | [ImportStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/ImportStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/published` | GET | GetPublishedStore | [GetPublishedStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/GetPublishedStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/published` | DELETE | DeletePublishedStore | [DeletePublishedStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/DeletePublishedStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/published/backup` | GET | GetPublishedStoreBackup | [GetPublishedStoreBackup](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/GetPublishedStoreBackup.java) |
| `/platform/admin/namespaces/{namespace}/stores/published/rollback` | PUT | RollbackPublishedStore | [RollbackPublishedStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/RollbackPublishedStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/{storeId}` | GET | GetStore | [GetStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/GetStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/{storeId}` | PUT | UpdateStore | [UpdateStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/UpdateStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/{storeId}` | DELETE | DeleteStore | [DeleteStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/DeleteStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/{storeId}/clone` | PUT | CloneStore | [CloneStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/CloneStore.java) |
| `/platform/admin/namespaces/{namespace}/stores/{storeId}/export` | GET | ExportStore | [ExportStore](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/ExportStore.java) |
| `/platform/public/namespaces/{namespace}/stores` | GET | PublicListStores | [PublicListStores](../src/main/java/net/accelbyte/sdk/api/platform/operations/store/PublicListStores.java) |

### Subscription Wrapper:  [Subscription](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Subscription.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/subscriptions` | GET | QuerySubscriptions | [QuerySubscriptions](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/QuerySubscriptions.java) |
| `/platform/admin/namespaces/{namespace}/subscriptions/{subscriptionId}/recurring` | PUT | RecurringChargeSubscription | [RecurringChargeSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/RecurringChargeSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions` | GET | QueryUserSubscriptions | [QueryUserSubscriptions](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/QueryUserSubscriptions.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/activities` | GET | GetUserSubscriptionActivities | [GetUserSubscriptionActivities](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/GetUserSubscriptionActivities.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/platformSubscribe` | POST | PlatformSubscribeSubscription | [PlatformSubscribeSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PlatformSubscribeSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/subscribable/byItemId` | GET | CheckUserSubscriptionSubscribableByItemId | [CheckUserSubscriptionSubscribableByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/CheckUserSubscriptionSubscribableByItemId.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}` | GET | GetUserSubscription | [GetUserSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/GetUserSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}` | DELETE | DeleteUserSubscription | [DeleteUserSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/DeleteUserSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/cancel` | PUT | CancelSubscription | [CancelSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/CancelSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/grant` | PUT | GrantDaysToSubscription | [GrantDaysToSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/GrantDaysToSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/history` | GET | GetUserSubscriptionBillingHistories | [GetUserSubscriptionBillingHistories](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/GetUserSubscriptionBillingHistories.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/notifications` | POST | ProcessUserSubscriptionNotification | [ProcessUserSubscriptionNotification](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/ProcessUserSubscriptionNotification.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions` | GET | PublicQueryUserSubscriptions | [PublicQueryUserSubscriptions](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicQueryUserSubscriptions.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions` | POST | PublicSubscribeSubscription | [PublicSubscribeSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicSubscribeSubscription.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/subscribable/byItemId` | GET | PublicCheckUserSubscriptionSubscribableByItemId | [PublicCheckUserSubscriptionSubscribableByItemId](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicCheckUserSubscriptionSubscribableByItemId.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}` | GET | PublicGetUserSubscription | [PublicGetUserSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicGetUserSubscription.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/billingAccount` | PUT | PublicChangeSubscriptionBillingAccount | [PublicChangeSubscriptionBillingAccount](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicChangeSubscriptionBillingAccount.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/cancel` | PUT | PublicCancelSubscription | [PublicCancelSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicCancelSubscription.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/history` | GET | PublicGetUserSubscriptionBillingHistories | [PublicGetUserSubscriptionBillingHistories](../src/main/java/net/accelbyte/sdk/api/platform/operations/subscription/PublicGetUserSubscriptionBillingHistories.java) |

### Ticket Wrapper:  [Ticket](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Ticket.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/tickets/{boothName}` | GET | GetTicketDynamic | [GetTicketDynamic](../src/main/java/net/accelbyte/sdk/api/platform/operations/ticket/GetTicketDynamic.java) |
| `/platform/admin/namespaces/{namespace}/tickets/{boothName}/decrement` | PUT | DecreaseTicketSale | [DecreaseTicketSale](../src/main/java/net/accelbyte/sdk/api/platform/operations/ticket/DecreaseTicketSale.java) |
| `/platform/admin/namespaces/{namespace}/tickets/{boothName}/id` | GET | GetTicketBoothID | [GetTicketBoothID](../src/main/java/net/accelbyte/sdk/api/platform/operations/ticket/GetTicketBoothID.java) |
| `/platform/admin/namespaces/{namespace}/tickets/{boothName}/increment` | PUT | IncreaseTicketSale | [IncreaseTicketSale](../src/main/java/net/accelbyte/sdk/api/platform/operations/ticket/IncreaseTicketSale.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/tickets/{boothName}` | POST | AcquireUserTicket | [AcquireUserTicket](../src/main/java/net/accelbyte/sdk/api/platform/operations/ticket/AcquireUserTicket.java) |

### Anonymization Wrapper:  [Anonymization](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Anonymization.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/campaign` | DELETE | AnonymizeCampaign | [AnonymizeCampaign](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeCampaign.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/entitlements` | DELETE | AnonymizeEntitlement | [AnonymizeEntitlement](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeEntitlement.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/fulfillment` | DELETE | AnonymizeFulfillment | [AnonymizeFulfillment](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeFulfillment.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/integrations` | DELETE | AnonymizeIntegration | [AnonymizeIntegration](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeIntegration.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/orders` | DELETE | AnonymizeOrder | [AnonymizeOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeOrder.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/payment` | DELETE | AnonymizePayment | [AnonymizePayment](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizePayment.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/subscriptions` | DELETE | AnonymizeSubscription | [AnonymizeSubscription](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeSubscription.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/anonymization/wallets` | DELETE | AnonymizeWallet | [AnonymizeWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/anonymization/AnonymizeWallet.java) |

### Wallet Wrapper:  [Wallet](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/Wallet.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}/check` | GET | CheckWallet | [CheckWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/CheckWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}/credit` | PUT | CreditUserWallet | [CreditUserWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/CreditUserWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}/payment` | PUT | PayWithUserWallet | [PayWithUserWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/PayWithUserWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}` | GET | GetUserWallet | [GetUserWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/GetUserWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}/debit` | PUT | DebitUserWallet | [DebitUserWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/DebitUserWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}/disable` | PUT | DisableUserWallet | [DisableUserWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/DisableUserWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}/enable` | PUT | EnableUserWallet | [EnableUserWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/EnableUserWallet.java) |
| `/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}/transactions` | GET | ListUserWalletTransactions | [ListUserWalletTransactions](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/ListUserWalletTransactions.java) |
| `/platform/admin/namespaces/{namespace}/wallets` | GET | QueryWallets | [QueryWallets](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/QueryWallets.java) |
| `/platform/admin/namespaces/{namespace}/wallets/{walletId}` | GET | GetWallet | [GetWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/GetWallet.java) |
| `/platform/public/namespaces/{namespace}/users/me/wallets/{currencyCode}` | GET | PublicGetMyWallet | [PublicGetMyWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/PublicGetMyWallet.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}` | GET | PublicGetWallet | [PublicGetWallet](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/PublicGetWallet.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}/transactions` | GET | PublicListUserWalletTransactions | [PublicListUserWalletTransactions](../src/main/java/net/accelbyte/sdk/api/platform/operations/wallet/PublicListUserWalletTransactions.java) |

### Order(Dedicated) Wrapper:  [OrderDedicated](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/OrderDedicated.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/orders` | GET | SyncOrders | [SyncOrders](../src/main/java/net/accelbyte/sdk/api/platform/operations/order_dedicated/SyncOrders.java) |

### PaymentConfig Wrapper:  [PaymentConfig](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/PaymentConfig.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/admin/payment/config/merchant/adyenconfig/test` | POST | TestAdyenConfig | [TestAdyenConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestAdyenConfig.java) |
| `/platform/admin/payment/config/merchant/alipayconfig/test` | POST | TestAliPayConfig | [TestAliPayConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestAliPayConfig.java) |
| `/platform/admin/payment/config/merchant/checkoutconfig/test` | POST | TestCheckoutConfig | [TestCheckoutConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestCheckoutConfig.java) |
| `/platform/admin/payment/config/merchant/matched` | GET | DebugMatchedPaymentMerchantConfig | [DebugMatchedPaymentMerchantConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/DebugMatchedPaymentMerchantConfig.java) |
| `/platform/admin/payment/config/merchant/paypalconfig/test` | POST | TestPayPalConfig | [TestPayPalConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestPayPalConfig.java) |
| `/platform/admin/payment/config/merchant/stripeconfig/test` | POST | TestStripeConfig | [TestStripeConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestStripeConfig.java) |
| `/platform/admin/payment/config/merchant/wxpayconfig/test` | POST | TestWxPayConfig | [TestWxPayConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestWxPayConfig.java) |
| `/platform/admin/payment/config/merchant/xsollaconfig/test` | POST | TestXsollaConfig | [TestXsollaConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestXsollaConfig.java) |
| `/platform/admin/payment/config/merchant/{id}` | GET | GetPaymentMerchantConfig | [GetPaymentMerchantConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/GetPaymentMerchantConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/adyenconfig` | PUT | UpdateAdyenConfig | [UpdateAdyenConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateAdyenConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/adyenconfig/test` | GET | TestAdyenConfigById | [TestAdyenConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestAdyenConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/alipayconfig` | PUT | UpdateAliPayConfig | [UpdateAliPayConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateAliPayConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/alipayconfig/test` | GET | TestAliPayConfigById | [TestAliPayConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestAliPayConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/checkoutconfig` | PUT | UpdateCheckoutConfig | [UpdateCheckoutConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateCheckoutConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/checkoutconfig/test` | GET | TestCheckoutConfigById | [TestCheckoutConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestCheckoutConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/paypalconfig` | PUT | UpdatePayPalConfig | [UpdatePayPalConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdatePayPalConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/paypalconfig/test` | GET | TestPayPalConfigById | [TestPayPalConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestPayPalConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/stripeconfig` | PUT | UpdateStripeConfig | [UpdateStripeConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateStripeConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/stripeconfig/test` | GET | TestStripeConfigById | [TestStripeConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestStripeConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/wxpayconfig` | PUT | UpdateWxPayConfig | [UpdateWxPayConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateWxPayConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/wxpayconfig/cert` | PUT | UpdateWxPayConfigCert | [UpdateWxPayConfigCert](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateWxPayConfigCert.java) |
| `/platform/admin/payment/config/merchant/{id}/wxpayconfig/test` | GET | TestWxPayConfigById | [TestWxPayConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestWxPayConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/xsollaconfig` | PUT | UpdateXsollaConfig | [UpdateXsollaConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateXsollaConfig.java) |
| `/platform/admin/payment/config/merchant/{id}/xsollaconfig/test` | GET | TestXsollaConfigById | [TestXsollaConfigById](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/TestXsollaConfigById.java) |
| `/platform/admin/payment/config/merchant/{id}/xsollauiconfig` | PUT | UpdateXsollaUIConfig | [UpdateXsollaUIConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdateXsollaUIConfig.java) |
| `/platform/admin/payment/config/provider` | GET | QueryPaymentProviderConfig | [QueryPaymentProviderConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/QueryPaymentProviderConfig.java) |
| `/platform/admin/payment/config/provider` | POST | CreatePaymentProviderConfig | [CreatePaymentProviderConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/CreatePaymentProviderConfig.java) |
| `/platform/admin/payment/config/provider/aggregate` | GET | GetAggregatePaymentProviders | [GetAggregatePaymentProviders](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/GetAggregatePaymentProviders.java) |
| `/platform/admin/payment/config/provider/matched` | GET | DebugMatchedPaymentProviderConfig | [DebugMatchedPaymentProviderConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/DebugMatchedPaymentProviderConfig.java) |
| `/platform/admin/payment/config/provider/special` | GET | GetSpecialPaymentProviders | [GetSpecialPaymentProviders](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/GetSpecialPaymentProviders.java) |
| `/platform/admin/payment/config/provider/{id}` | PUT | UpdatePaymentProviderConfig | [UpdatePaymentProviderConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdatePaymentProviderConfig.java) |
| `/platform/admin/payment/config/provider/{id}` | DELETE | DeletePaymentProviderConfig | [DeletePaymentProviderConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/DeletePaymentProviderConfig.java) |
| `/platform/admin/payment/config/tax` | GET | GetPaymentTaxConfig | [GetPaymentTaxConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/GetPaymentTaxConfig.java) |
| `/platform/admin/payment/config/tax` | PUT | UpdatePaymentTaxConfig | [UpdatePaymentTaxConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_config/UpdatePaymentTaxConfig.java) |

### PaymentStation Wrapper:  [PaymentStation](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/PaymentStation.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/public/namespaces/{namespace}/payment/customization` | GET | GetPaymentCustomization | [GetPaymentCustomization](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/GetPaymentCustomization.java) |
| `/platform/public/namespaces/{namespace}/payment/link` | POST | PublicGetPaymentUrl | [PublicGetPaymentUrl](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/PublicGetPaymentUrl.java) |
| `/platform/public/namespaces/{namespace}/payment/methods` | GET | PublicGetPaymentMethods | [PublicGetPaymentMethods](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/PublicGetPaymentMethods.java) |
| `/platform/public/namespaces/{namespace}/payment/orders/{paymentOrderNo}/info` | GET | PublicGetUnpaidPaymentOrder | [PublicGetUnpaidPaymentOrder](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/PublicGetUnpaidPaymentOrder.java) |
| `/platform/public/namespaces/{namespace}/payment/orders/{paymentOrderNo}/pay` | POST | Pay | [Pay](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/Pay.java) |
| `/platform/public/namespaces/{namespace}/payment/orders/{paymentOrderNo}/status` | GET | PublicCheckPaymentOrderPaidStatus | [PublicCheckPaymentOrderPaidStatus](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/PublicCheckPaymentOrderPaidStatus.java) |
| `/platform/public/namespaces/{namespace}/payment/publicconfig` | GET | GetPaymentPublicConfig | [GetPaymentPublicConfig](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/GetPaymentPublicConfig.java) |
| `/platform/public/namespaces/{namespace}/payment/qrcode` | GET | PublicGetQRCode | [PublicGetQRCode](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/PublicGetQRCode.java) |
| `/platform/public/namespaces/{namespace}/payment/returnurl` | GET | PublicNormalizePaymentReturnUrl | [PublicNormalizePaymentReturnUrl](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/PublicNormalizePaymentReturnUrl.java) |
| `/platform/public/namespaces/{namespace}/payment/tax` | GET | GetPaymentTaxValue | [GetPaymentTaxValue](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_station/GetPaymentTaxValue.java) |

### PaymentAccount Wrapper:  [PaymentAccount](../src/main/java/net/accelbyte/sdk/api/platform/wrappers/PaymentAccount.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/platform/public/namespaces/{namespace}/users/{userId}/payment/accounts` | GET | PublicGetPaymentAccounts | [PublicGetPaymentAccounts](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_account/PublicGetPaymentAccounts.java) |
| `/platform/public/namespaces/{namespace}/users/{userId}/payment/accounts/{type}/{id}` | DELETE | PublicDeletePaymentAccount | [PublicDeletePaymentAccount](../src/main/java/net/accelbyte/sdk/api/platform/operations/payment_account/PublicDeletePaymentAccount.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `AdditionalData` | [AdditionalData](../src/main/java/net/accelbyte/sdk/api/platform/models/AdditionalData.java) |
| `AdyenConfig` | [AdyenConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/AdyenConfig.java) |
| `AliPayConfig` | [AliPayConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/AliPayConfig.java) |
| `AppEntitlementInfo` | [AppEntitlementInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/AppEntitlementInfo.java) |
| `AppEntitlementPagingSlicedResult` | [AppEntitlementPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/AppEntitlementPagingSlicedResult.java) |
| `AppInfo` | [AppInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/AppInfo.java) |
| `AppLocalization` | [AppLocalization](../src/main/java/net/accelbyte/sdk/api/platform/models/AppLocalization.java) |
| `AppUpdate` | [AppUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/AppUpdate.java) |
| `AppleIAPConfigInfo` | [AppleIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/AppleIAPConfigInfo.java) |
| `AppleIAPConfigRequest` | [AppleIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/AppleIAPConfigRequest.java) |
| `AppleIAPReceipt` | [AppleIAPReceipt](../src/main/java/net/accelbyte/sdk/api/platform/models/AppleIAPReceipt.java) |
| `BasicCategoryInfo` | [BasicCategoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/BasicCategoryInfo.java) |
| `BasicItem` | [BasicItem](../src/main/java/net/accelbyte/sdk/api/platform/models/BasicItem.java) |
| `BillingAccount` | [BillingAccount](../src/main/java/net/accelbyte/sdk/api/platform/models/BillingAccount.java) |
| `BillingHistoryInfo` | [BillingHistoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/BillingHistoryInfo.java) |
| `BillingHistoryPagingSlicedResult` | [BillingHistoryPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/BillingHistoryPagingSlicedResult.java) |
| `BulkOperationResult` | [BulkOperationResult](../src/main/java/net/accelbyte/sdk/api/platform/models/BulkOperationResult.java) |
| `BundledItemInfo` | [BundledItemInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/BundledItemInfo.java) |
| `CampaignCreate` | [CampaignCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/CampaignCreate.java) |
| `CampaignDynamicInfo` | [CampaignDynamicInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/CampaignDynamicInfo.java) |
| `CampaignInfo` | [CampaignInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/CampaignInfo.java) |
| `CampaignPagingSlicedResult` | [CampaignPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/CampaignPagingSlicedResult.java) |
| `CampaignUpdate` | [CampaignUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/CampaignUpdate.java) |
| `CancelRequest` | [CancelRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/CancelRequest.java) |
| `CategoryCreate` | [CategoryCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/CategoryCreate.java) |
| `CategoryInfo` | [CategoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/CategoryInfo.java) |
| `CategoryUpdate` | [CategoryUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/CategoryUpdate.java) |
| `CheckoutConfig` | [CheckoutConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/CheckoutConfig.java) |
| `CodeCreate` | [CodeCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/CodeCreate.java) |
| `CodeCreateResult` | [CodeCreateResult](../src/main/java/net/accelbyte/sdk/api/platform/models/CodeCreateResult.java) |
| `CodeInfo` | [CodeInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/CodeInfo.java) |
| `CodeInfoPagingSlicedResult` | [CodeInfoPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/CodeInfoPagingSlicedResult.java) |
| `ConditionMatchResult` | [ConditionMatchResult](../src/main/java/net/accelbyte/sdk/api/platform/models/ConditionMatchResult.java) |
| `CreditRequest` | [CreditRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/CreditRequest.java) |
| `CreditSummary` | [CreditSummary](../src/main/java/net/accelbyte/sdk/api/platform/models/CreditSummary.java) |
| `CurrencyConfig` | [CurrencyConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/CurrencyConfig.java) |
| `CurrencyCreate` | [CurrencyCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/CurrencyCreate.java) |
| `CurrencyInfo` | [CurrencyInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/CurrencyInfo.java) |
| `CurrencySummary` | [CurrencySummary](../src/main/java/net/accelbyte/sdk/api/platform/models/CurrencySummary.java) |
| `CurrencyUpdate` | [CurrencyUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/CurrencyUpdate.java) |
| `Customization` | [Customization](../src/main/java/net/accelbyte/sdk/api/platform/models/Customization.java) |
| `DLCItem` | [DLCItem](../src/main/java/net/accelbyte/sdk/api/platform/models/DLCItem.java) |
| `DLCItemConfigInfo` | [DLCItemConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/DLCItemConfigInfo.java) |
| `DLCItemConfigUpdate` | [DLCItemConfigUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/DLCItemConfigUpdate.java) |
| `DebitRequest` | [DebitRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/DebitRequest.java) |
| `EntitlementDecrement` | [EntitlementDecrement](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementDecrement.java) |
| `EntitlementGrant` | [EntitlementGrant](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementGrant.java) |
| `EntitlementHistoryInfo` | [EntitlementHistoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementHistoryInfo.java) |
| `EntitlementInfo` | [EntitlementInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementInfo.java) |
| `EntitlementPagingSlicedResult` | [EntitlementPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementPagingSlicedResult.java) |
| `EntitlementSummary` | [EntitlementSummary](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementSummary.java) |
| `EntitlementUpdate` | [EntitlementUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/EntitlementUpdate.java) |
| `EpicGamesIAPConfigInfo` | [EpicGamesIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/EpicGamesIAPConfigInfo.java) |
| `EpicGamesIAPConfigRequest` | [EpicGamesIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/EpicGamesIAPConfigRequest.java) |
| `EpicGamesReconcileRequest` | [EpicGamesReconcileRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/EpicGamesReconcileRequest.java) |
| `EpicGamesReconcileResult` | [EpicGamesReconcileResult](../src/main/java/net/accelbyte/sdk/api/platform/models/EpicGamesReconcileResult.java) |
| `ErrorEntity` | [ErrorEntity](../src/main/java/net/accelbyte/sdk/api/platform/models/ErrorEntity.java) |
| `EventPayload` | [EventPayload](../src/main/java/net/accelbyte/sdk/api/platform/models/EventPayload.java) |
| `ExternalPaymentOrderCreate` | [ExternalPaymentOrderCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/ExternalPaymentOrderCreate.java) |
| `FieldValidationError` | [FieldValidationError](../src/main/java/net/accelbyte/sdk/api/platform/models/FieldValidationError.java) |
| `FulfillCodeRequest` | [FulfillCodeRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillCodeRequest.java) |
| `FulfillmentError` | [FulfillmentError](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentError.java) |
| `FulfillmentHistoryInfo` | [FulfillmentHistoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentHistoryInfo.java) |
| `FulfillmentHistoryPagingSlicedResult` | [FulfillmentHistoryPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentHistoryPagingSlicedResult.java) |
| `FulfillmentItem` | [FulfillmentItem](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentItem.java) |
| `FulfillmentRequest` | [FulfillmentRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentRequest.java) |
| `FulfillmentResult` | [FulfillmentResult](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentResult.java) |
| `FulfillmentScriptContext` | [FulfillmentScriptContext](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentScriptContext.java) |
| `FulfillmentScriptCreate` | [FulfillmentScriptCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentScriptCreate.java) |
| `FulfillmentScriptEvalTestRequest` | [FulfillmentScriptEvalTestRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentScriptEvalTestRequest.java) |
| `FulfillmentScriptEvalTestResult` | [FulfillmentScriptEvalTestResult](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentScriptEvalTestResult.java) |
| `FulfillmentScriptInfo` | [FulfillmentScriptInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentScriptInfo.java) |
| `FulfillmentScriptUpdate` | [FulfillmentScriptUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/FulfillmentScriptUpdate.java) |
| `FullAppInfo` | [FullAppInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/FullAppInfo.java) |
| `FullCategoryInfo` | [FullCategoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/FullCategoryInfo.java) |
| `FullItemInfo` | [FullItemInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/FullItemInfo.java) |
| `FullItemPagingSlicedResult` | [FullItemPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/FullItemPagingSlicedResult.java) |
| `GoogleIAPConfigInfo` | [GoogleIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/GoogleIAPConfigInfo.java) |
| `GoogleIAPConfigRequest` | [GoogleIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/GoogleIAPConfigRequest.java) |
| `GoogleIAPReceipt` | [GoogleIAPReceipt](../src/main/java/net/accelbyte/sdk/api/platform/models/GoogleIAPReceipt.java) |
| `GoogleReceiptResolveResult` | [GoogleReceiptResolveResult](../src/main/java/net/accelbyte/sdk/api/platform/models/GoogleReceiptResolveResult.java) |
| `GrantSubscriptionDaysRequest` | [GrantSubscriptionDaysRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/GrantSubscriptionDaysRequest.java) |
| `HierarchicalCategoryInfo` | [HierarchicalCategoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/HierarchicalCategoryInfo.java) |
| `IAPItemConfigInfo` | [IAPItemConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/IAPItemConfigInfo.java) |
| `IAPItemConfigUpdate` | [IAPItemConfigUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/IAPItemConfigUpdate.java) |
| `IAPItemEntry` | [IAPItemEntry](../src/main/java/net/accelbyte/sdk/api/platform/models/IAPItemEntry.java) |
| `IAPOrderInfo` | [IAPOrderInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/IAPOrderInfo.java) |
| `IAPOrderPagingSlicedResult` | [IAPOrderPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/IAPOrderPagingSlicedResult.java) |
| `Image` | [Image](../src/main/java/net/accelbyte/sdk/api/platform/models/Image.java) |
| `InGameItemSync` | [InGameItemSync](../src/main/java/net/accelbyte/sdk/api/platform/models/InGameItemSync.java) |
| `ItemAcquireRequest` | [ItemAcquireRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemAcquireRequest.java) |
| `ItemAcquireResult` | [ItemAcquireResult](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemAcquireResult.java) |
| `ItemCreate` | [ItemCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemCreate.java) |
| `ItemDynamicDataInfo` | [ItemDynamicDataInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemDynamicDataInfo.java) |
| `ItemId` | [ItemId](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemId.java) |
| `ItemInfo` | [ItemInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemInfo.java) |
| `ItemPagingSlicedResult` | [ItemPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemPagingSlicedResult.java) |
| `ItemReturnRequest` | [ItemReturnRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemReturnRequest.java) |
| `ItemSnapshot` | [ItemSnapshot](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemSnapshot.java) |
| `ItemUpdate` | [ItemUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/ItemUpdate.java) |
| `KeyGroupCreate` | [KeyGroupCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyGroupCreate.java) |
| `KeyGroupDynamicInfo` | [KeyGroupDynamicInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyGroupDynamicInfo.java) |
| `KeyGroupInfo` | [KeyGroupInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyGroupInfo.java) |
| `KeyGroupPagingSlicedResult` | [KeyGroupPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyGroupPagingSlicedResult.java) |
| `KeyGroupUpdate` | [KeyGroupUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyGroupUpdate.java) |
| `KeyInfo` | [KeyInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyInfo.java) |
| `KeyPagingSliceResult` | [KeyPagingSliceResult](../src/main/java/net/accelbyte/sdk/api/platform/models/KeyPagingSliceResult.java) |
| `Localization` | [Localization](../src/main/java/net/accelbyte/sdk/api/platform/models/Localization.java) |
| `MockIAPReceipt` | [MockIAPReceipt](../src/main/java/net/accelbyte/sdk/api/platform/models/MockIAPReceipt.java) |
| `NotificationProcessResult` | [NotificationProcessResult](../src/main/java/net/accelbyte/sdk/api/platform/models/NotificationProcessResult.java) |
| `Order` | [Order](../src/main/java/net/accelbyte/sdk/api/platform/models/Order.java) |
| `OrderCreate` | [OrderCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderCreate.java) |
| `OrderGrantInfo` | [OrderGrantInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderGrantInfo.java) |
| `OrderHistoryInfo` | [OrderHistoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderHistoryInfo.java) |
| `OrderInfo` | [OrderInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderInfo.java) |
| `OrderPagingResult` | [OrderPagingResult](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderPagingResult.java) |
| `OrderPagingSlicedResult` | [OrderPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderPagingSlicedResult.java) |
| `OrderRefundCreate` | [OrderRefundCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderRefundCreate.java) |
| `OrderStatistics` | [OrderStatistics](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderStatistics.java) |
| `OrderSummary` | [OrderSummary](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderSummary.java) |
| `OrderSyncResult` | [OrderSyncResult](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderSyncResult.java) |
| `OrderUpdate` | [OrderUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/OrderUpdate.java) |
| `Ownership` | [Ownership](../src/main/java/net/accelbyte/sdk/api/platform/models/Ownership.java) |
| `OwnershipToken` | [OwnershipToken](../src/main/java/net/accelbyte/sdk/api/platform/models/OwnershipToken.java) |
| `Paging` | [Paging](../src/main/java/net/accelbyte/sdk/api/platform/models/Paging.java) |
| `PayPalConfig` | [PayPalConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/PayPalConfig.java) |
| `PaymentAccount` | [PaymentAccount](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentAccount.java) |
| `PaymentCallbackConfigInfo` | [PaymentCallbackConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentCallbackConfigInfo.java) |
| `PaymentCallbackConfigUpdate` | [PaymentCallbackConfigUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentCallbackConfigUpdate.java) |
| `PaymentMerchantConfigInfo` | [PaymentMerchantConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentMerchantConfigInfo.java) |
| `PaymentMethod` | [PaymentMethod](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentMethod.java) |
| `PaymentNotificationInfo` | [PaymentNotificationInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentNotificationInfo.java) |
| `PaymentNotificationPagingSlicedResult` | [PaymentNotificationPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentNotificationPagingSlicedResult.java) |
| `PaymentOrder` | [PaymentOrder](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrder.java) |
| `PaymentOrderChargeRequest` | [PaymentOrderChargeRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderChargeRequest.java) |
| `PaymentOrderChargeStatus` | [PaymentOrderChargeStatus](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderChargeStatus.java) |
| `PaymentOrderCreate` | [PaymentOrderCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderCreate.java) |
| `PaymentOrderCreateResult` | [PaymentOrderCreateResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderCreateResult.java) |
| `PaymentOrderDetails` | [PaymentOrderDetails](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderDetails.java) |
| `PaymentOrderInfo` | [PaymentOrderInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderInfo.java) |
| `PaymentOrderNotifySimulation` | [PaymentOrderNotifySimulation](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderNotifySimulation.java) |
| `PaymentOrderPagingSlicedResult` | [PaymentOrderPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderPagingSlicedResult.java) |
| `PaymentOrderPaidResult` | [PaymentOrderPaidResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderPaidResult.java) |
| `PaymentOrderRefund` | [PaymentOrderRefund](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderRefund.java) |
| `PaymentOrderRefundResult` | [PaymentOrderRefundResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderRefundResult.java) |
| `PaymentOrderSyncResult` | [PaymentOrderSyncResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentOrderSyncResult.java) |
| `PaymentProcessResult` | [PaymentProcessResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentProcessResult.java) |
| `PaymentProviderConfigEdit` | [PaymentProviderConfigEdit](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentProviderConfigEdit.java) |
| `PaymentProviderConfigInfo` | [PaymentProviderConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentProviderConfigInfo.java) |
| `PaymentProviderConfigPagingSlicedResult` | [PaymentProviderConfigPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentProviderConfigPagingSlicedResult.java) |
| `PaymentRequest` | [PaymentRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentRequest.java) |
| `PaymentTaxConfigEdit` | [PaymentTaxConfigEdit](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentTaxConfigEdit.java) |
| `PaymentTaxConfigInfo` | [PaymentTaxConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentTaxConfigInfo.java) |
| `PaymentToken` | [PaymentToken](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentToken.java) |
| `PaymentUrl` | [PaymentUrl](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentUrl.java) |
| `PaymentUrlCreate` | [PaymentUrlCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/PaymentUrlCreate.java) |
| `PlatformDLCConfigInfo` | [PlatformDLCConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformDLCConfigInfo.java) |
| `PlatformDLCConfigUpdate` | [PlatformDLCConfigUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformDLCConfigUpdate.java) |
| `PlatformDlcEntry` | [PlatformDlcEntry](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformDlcEntry.java) |
| `PlatformReward` | [PlatformReward](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformReward.java) |
| `PlatformRewardCurrency` | [PlatformRewardCurrency](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformRewardCurrency.java) |
| `PlatformRewardItem` | [PlatformRewardItem](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformRewardItem.java) |
| `PlatformSubscribeRequest` | [PlatformSubscribeRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/PlatformSubscribeRequest.java) |
| `PlayStationDLCSyncRequest` | [PlayStationDLCSyncRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/PlayStationDLCSyncRequest.java) |
| `PlayStationIAPConfigInfo` | [PlayStationIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PlayStationIAPConfigInfo.java) |
| `PlayStationReconcileRequest` | [PlayStationReconcileRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/PlayStationReconcileRequest.java) |
| `PlayStationReconcileResult` | [PlayStationReconcileResult](../src/main/java/net/accelbyte/sdk/api/platform/models/PlayStationReconcileResult.java) |
| `PlaystationIAPConfigRequest` | [PlaystationIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/PlaystationIAPConfigRequest.java) |
| `PopulatedItemInfo` | [PopulatedItemInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/PopulatedItemInfo.java) |
| `PurchasedItemCount` | [PurchasedItemCount](../src/main/java/net/accelbyte/sdk/api/platform/models/PurchasedItemCount.java) |
| `Recurring` | [Recurring](../src/main/java/net/accelbyte/sdk/api/platform/models/Recurring.java) |
| `RecurringChargeResult` | [RecurringChargeResult](../src/main/java/net/accelbyte/sdk/api/platform/models/RecurringChargeResult.java) |
| `RedeemHistoryInfo` | [RedeemHistoryInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/RedeemHistoryInfo.java) |
| `RedeemHistoryPagingSlicedResult` | [RedeemHistoryPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/RedeemHistoryPagingSlicedResult.java) |
| `RedeemRequest` | [RedeemRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/RedeemRequest.java) |
| `RedeemResult` | [RedeemResult](../src/main/java/net/accelbyte/sdk/api/platform/models/RedeemResult.java) |
| `RedeemableItem` | [RedeemableItem](../src/main/java/net/accelbyte/sdk/api/platform/models/RedeemableItem.java) |
| `RegionDataItem` | [RegionDataItem](../src/main/java/net/accelbyte/sdk/api/platform/models/RegionDataItem.java) |
| `Requirement` | [Requirement](../src/main/java/net/accelbyte/sdk/api/platform/models/Requirement.java) |
| `RewardCondition` | [RewardCondition](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardCondition.java) |
| `RewardCreate` | [RewardCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardCreate.java) |
| `RewardInfo` | [RewardInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardInfo.java) |
| `RewardItem` | [RewardItem](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardItem.java) |
| `RewardPagingSlicedResult` | [RewardPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardPagingSlicedResult.java) |
| `RewardUpdate` | [RewardUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardUpdate.java) |
| `RewardsRequest` | [RewardsRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/RewardsRequest.java) |
| `Slide` | [Slide](../src/main/java/net/accelbyte/sdk/api/platform/models/Slide.java) |
| `StackableEntitlementInfo` | [StackableEntitlementInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/StackableEntitlementInfo.java) |
| `StadiaIAPConfigInfo` | [StadiaIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/StadiaIAPConfigInfo.java) |
| `StadiaSyncRequest` | [StadiaSyncRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/StadiaSyncRequest.java) |
| `SteamDLCSyncRequest` | [SteamDLCSyncRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/SteamDLCSyncRequest.java) |
| `SteamIAPConfig` | [SteamIAPConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/SteamIAPConfig.java) |
| `SteamIAPConfigInfo` | [SteamIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/SteamIAPConfigInfo.java) |
| `SteamIAPConfigRequest` | [SteamIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/SteamIAPConfigRequest.java) |
| `SteamSyncRequest` | [SteamSyncRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/SteamSyncRequest.java) |
| `StoreBackupInfo` | [StoreBackupInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/StoreBackupInfo.java) |
| `StoreCreate` | [StoreCreate](../src/main/java/net/accelbyte/sdk/api/platform/models/StoreCreate.java) |
| `StoreInfo` | [StoreInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/StoreInfo.java) |
| `StoreUpdate` | [StoreUpdate](../src/main/java/net/accelbyte/sdk/api/platform/models/StoreUpdate.java) |
| `StripeConfig` | [StripeConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/StripeConfig.java) |
| `Subscribable` | [Subscribable](../src/main/java/net/accelbyte/sdk/api/platform/models/Subscribable.java) |
| `SubscribeRequest` | [SubscribeRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/SubscribeRequest.java) |
| `SubscriptionActivityInfo` | [SubscriptionActivityInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/SubscriptionActivityInfo.java) |
| `SubscriptionActivityPagingSlicedResult` | [SubscriptionActivityPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/SubscriptionActivityPagingSlicedResult.java) |
| `SubscriptionInfo` | [SubscriptionInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/SubscriptionInfo.java) |
| `SubscriptionPagingSlicedResult` | [SubscriptionPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/SubscriptionPagingSlicedResult.java) |
| `SubscriptionSummary` | [SubscriptionSummary](../src/main/java/net/accelbyte/sdk/api/platform/models/SubscriptionSummary.java) |
| `TaxResult` | [TaxResult](../src/main/java/net/accelbyte/sdk/api/platform/models/TaxResult.java) |
| `TestResult` | [TestResult](../src/main/java/net/accelbyte/sdk/api/platform/models/TestResult.java) |
| `TicketAcquireRequest` | [TicketAcquireRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketAcquireRequest.java) |
| `TicketAcquireResult` | [TicketAcquireResult](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketAcquireResult.java) |
| `TicketBoothID` | [TicketBoothID](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketBoothID.java) |
| `TicketDynamicInfo` | [TicketDynamicInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketDynamicInfo.java) |
| `TicketSaleDecrementRequest` | [TicketSaleDecrementRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketSaleDecrementRequest.java) |
| `TicketSaleIncrementRequest` | [TicketSaleIncrementRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketSaleIncrementRequest.java) |
| `TicketSaleIncrementResult` | [TicketSaleIncrementResult](../src/main/java/net/accelbyte/sdk/api/platform/models/TicketSaleIncrementResult.java) |
| `TimedOwnership` | [TimedOwnership](../src/main/java/net/accelbyte/sdk/api/platform/models/TimedOwnership.java) |
| `TradeNotification` | [TradeNotification](../src/main/java/net/accelbyte/sdk/api/platform/models/TradeNotification.java) |
| `Transaction` | [Transaction](../src/main/java/net/accelbyte/sdk/api/platform/models/Transaction.java) |
| `TwitchIAPConfigInfo` | [TwitchIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/TwitchIAPConfigInfo.java) |
| `TwitchIAPConfigRequest` | [TwitchIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/TwitchIAPConfigRequest.java) |
| `TwitchSyncRequest` | [TwitchSyncRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/TwitchSyncRequest.java) |
| `ValidationErrorEntity` | [ValidationErrorEntity](../src/main/java/net/accelbyte/sdk/api/platform/models/ValidationErrorEntity.java) |
| `WalletInfo` | [WalletInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/WalletInfo.java) |
| `WalletPagingSlicedResult` | [WalletPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/WalletPagingSlicedResult.java) |
| `WalletTransactionInfo` | [WalletTransactionInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/WalletTransactionInfo.java) |
| `WalletTransactionPagingSlicedResult` | [WalletTransactionPagingSlicedResult](../src/main/java/net/accelbyte/sdk/api/platform/models/WalletTransactionPagingSlicedResult.java) |
| `WxPayConfigInfo` | [WxPayConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/WxPayConfigInfo.java) |
| `WxPayConfigRequest` | [WxPayConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/WxPayConfigRequest.java) |
| `XblDLCSyncRequest` | [XblDLCSyncRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/XblDLCSyncRequest.java) |
| `XblIAPConfigInfo` | [XblIAPConfigInfo](../src/main/java/net/accelbyte/sdk/api/platform/models/XblIAPConfigInfo.java) |
| `XblIAPConfigRequest` | [XblIAPConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/XblIAPConfigRequest.java) |
| `XblReconcileRequest` | [XblReconcileRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/XblReconcileRequest.java) |
| `XblReconcileResult` | [XblReconcileResult](../src/main/java/net/accelbyte/sdk/api/platform/models/XblReconcileResult.java) |
| `XsollaConfig` | [XsollaConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/XsollaConfig.java) |
| `XsollaPaywallConfig` | [XsollaPaywallConfig](../src/main/java/net/accelbyte/sdk/api/platform/models/XsollaPaywallConfig.java) |
| `XsollaPaywallConfigRequest` | [XsollaPaywallConfigRequest](../src/main/java/net/accelbyte/sdk/api/platform/models/XsollaPaywallConfigRequest.java) |

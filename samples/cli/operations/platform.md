## Java Extend SDK CLI Sample App Operation Index for Platform service

### Operation ListFulfillmentScripts

```sh
$ build/install/cli/bin/cli platform listFulfillmentScripts
```

### Operation GetFulfillmentScript

```sh
$ build/install/cli/bin/cli platform getFulfillmentScript \
    --id <id value>
```

### Operation CreateFulfillmentScript

```sh
$ build/install/cli/bin/cli platform createFulfillmentScript \
    --id <id value> \
    --body <json string for request body>
```

### Operation DeleteFulfillmentScript

```sh
$ build/install/cli/bin/cli platform deleteFulfillmentScript \
    --id <id value>
```

### Operation UpdateFulfillmentScript

```sh
$ build/install/cli/bin/cli platform updateFulfillmentScript \
    --id <id value> \
    --body <json string for request body>
```

### Operation ListItemTypeConfigs

```sh
$ build/install/cli/bin/cli platform listItemTypeConfigs
```

### Operation CreateItemTypeConfig

```sh
$ build/install/cli/bin/cli platform createItemTypeConfig \
    --body <json string for request body>
```

### Operation SearchItemTypeConfig

```sh
$ build/install/cli/bin/cli platform searchItemTypeConfig \
    --clazz <clazz value - optional> \
    --itemType <itemType value>
```

### Operation GetItemTypeConfig

```sh
$ build/install/cli/bin/cli platform getItemTypeConfig \
    --id <id value>
```

### Operation UpdateItemTypeConfig

```sh
$ build/install/cli/bin/cli platform updateItemTypeConfig \
    --id <id value> \
    --body <json string for request body>
```

### Operation DeleteItemTypeConfig

```sh
$ build/install/cli/bin/cli platform deleteItemTypeConfig \
    --id <id value>
```

### Operation QueryCampaigns

```sh
$ build/install/cli/bin/cli platform queryCampaigns \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --tag <tag value - optional>
```

### Operation CreateCampaign

```sh
$ build/install/cli/bin/cli platform createCampaign \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetCampaign

```sh
$ build/install/cli/bin/cli platform getCampaign \
    --campaignId <campaignId value> \
    --namespace <namespace value>
```

### Operation UpdateCampaign

```sh
$ build/install/cli/bin/cli platform updateCampaign \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RenameBatch

```sh
$ build/install/cli/bin/cli platform renameBatch \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation QueryCampaignBatchNames

```sh
$ build/install/cli/bin/cli platform queryCampaignBatchNames \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --batchName <batchName value - optional> \
    --limit <limit value - optional>
```

### Operation GetCampaignDynamic

```sh
$ build/install/cli/bin/cli platform getCampaignDynamic \
    --campaignId <campaignId value> \
    --namespace <namespace value>
```

### Operation GetCatalogConfig

```sh
$ build/install/cli/bin/cli platform getCatalogConfig \
    --namespace <namespace value>
```

### Operation UpdateCatalogConfig

```sh
$ build/install/cli/bin/cli platform updateCatalogConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetLootBoxPluginConfig

```sh
$ build/install/cli/bin/cli platform getLootBoxPluginConfig \
    --namespace <namespace value>
```

### Operation UpdateLootBoxPluginConfig

```sh
$ build/install/cli/bin/cli platform updateLootBoxPluginConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteLootBoxPluginConfig

```sh
$ build/install/cli/bin/cli platform deleteLootBoxPluginConfig \
    --namespace <namespace value>
```

### Operation UplodLootBoxPluginConfigCert

```sh
$ build/install/cli/bin/cli platform uplodLootBoxPluginConfigCert \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation GetLootBoxGrpcInfo

```sh
$ build/install/cli/bin/cli platform getLootBoxGrpcInfo \
    --namespace <namespace value> \
    --force <force value - optional>
```

### Operation GetSectionPluginConfig

```sh
$ build/install/cli/bin/cli platform getSectionPluginConfig \
    --namespace <namespace value>
```

### Operation UpdateSectionPluginConfig

```sh
$ build/install/cli/bin/cli platform updateSectionPluginConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteSectionPluginConfig

```sh
$ build/install/cli/bin/cli platform deleteSectionPluginConfig \
    --namespace <namespace value>
```

### Operation UploadSectionPluginConfigCert

```sh
$ build/install/cli/bin/cli platform uploadSectionPluginConfigCert \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation GetRootCategories

```sh
$ build/install/cli/bin/cli platform getRootCategories \
    --namespace <namespace value> \
    --storeId <storeId value - optional>
```

### Operation CreateCategory

```sh
$ build/install/cli/bin/cli platform createCategory \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation ListCategoriesBasic

```sh
$ build/install/cli/bin/cli platform listCategoriesBasic \
    --namespace <namespace value> \
    --storeId <storeId value - optional>
```

### Operation GetCategory

```sh
$ build/install/cli/bin/cli platform getCategory \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --storeId <storeId value - optional>
```

### Operation UpdateCategory

```sh
$ build/install/cli/bin/cli platform updateCategory \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation DeleteCategory

```sh
$ build/install/cli/bin/cli platform deleteCategory \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation GetChildCategories

```sh
$ build/install/cli/bin/cli platform getChildCategories \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --storeId <storeId value - optional>
```

### Operation GetDescendantCategories

```sh
$ build/install/cli/bin/cli platform getDescendantCategories \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --storeId <storeId value - optional>
```

### Operation QueryCodes

```sh
$ build/install/cli/bin/cli platform queryCodes \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --batchName <batchName value - optional> \
    --batchNo <batchNo value - optional> \
    --code <code value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --withBatchName <withBatchName value - optional>
```

### Operation CreateCodes

```sh
$ build/install/cli/bin/cli platform createCodes \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation Download

```sh
$ build/install/cli/bin/cli platform download \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --batchName <batchName value - optional> \
    --batchNo <batchNo value - optional> \
    --withBatchName <withBatchName value - optional>
```

### Operation BulkDisableCodes

```sh
$ build/install/cli/bin/cli platform bulkDisableCodes \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --batchName <batchName value - optional> \
    --batchNo <batchNo value - optional>
```

### Operation BulkEnableCodes

```sh
$ build/install/cli/bin/cli platform bulkEnableCodes \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --batchName <batchName value - optional> \
    --batchNo <batchNo value - optional>
```

### Operation QueryRedeemHistory

```sh
$ build/install/cli/bin/cli platform queryRedeemHistory \
    --campaignId <campaignId value> \
    --namespace <namespace value> \
    --code <code value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --userId <userId value - optional>
```

### Operation GetCode

```sh
$ build/install/cli/bin/cli platform getCode \
    --code <code value> \
    --namespace <namespace value> \
    --redeemable <redeemable value - optional> \
    --withBatchName <withBatchName value - optional>
```

### Operation DisableCode

```sh
$ build/install/cli/bin/cli platform disableCode \
    --code <code value> \
    --namespace <namespace value>
```

### Operation EnableCode

```sh
$ build/install/cli/bin/cli platform enableCode \
    --code <code value> \
    --namespace <namespace value>
```

### Operation ListCurrencies

```sh
$ build/install/cli/bin/cli platform listCurrencies \
    --namespace <namespace value> \
    --currencyType <currencyType value - optional>
```

### Operation CreateCurrency

```sh
$ build/install/cli/bin/cli platform createCurrency \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateCurrency

```sh
$ build/install/cli/bin/cli platform updateCurrency \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteCurrency

```sh
$ build/install/cli/bin/cli platform deleteCurrency \
    --currencyCode <currencyCode value> \
    --namespace <namespace value>
```

### Operation GetCurrencyConfig

```sh
$ build/install/cli/bin/cli platform getCurrencyConfig \
    --currencyCode <currencyCode value> \
    --namespace <namespace value>
```

### Operation GetCurrencySummary

```sh
$ build/install/cli/bin/cli platform getCurrencySummary \
    --currencyCode <currencyCode value> \
    --namespace <namespace value>
```

### Operation GetDLCItemConfigHistory

```sh
$ build/install/cli/bin/cli platform getDLCItemConfigHistory \
    --namespace <namespace value> \
    --dlcId <dlcId value>
```

### Operation RestoreDLCItemConfigHistory

```sh
$ build/install/cli/bin/cli platform restoreDLCItemConfigHistory \
    --id <id value> \
    --namespace <namespace value>
```

### Operation GetDLCItemConfig

```sh
$ build/install/cli/bin/cli platform getDLCItemConfig \
    --namespace <namespace value>
```

### Operation UpdateDLCItemConfig

```sh
$ build/install/cli/bin/cli platform updateDLCItemConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteDLCItemConfig

```sh
$ build/install/cli/bin/cli platform deleteDLCItemConfig \
    --namespace <namespace value>
```

### Operation GetPlatformDLCConfig

```sh
$ build/install/cli/bin/cli platform getPlatformDLCConfig \
    --namespace <namespace value>
```

### Operation UpdatePlatformDLCConfig

```sh
$ build/install/cli/bin/cli platform updatePlatformDLCConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeletePlatformDLCConfig

```sh
$ build/install/cli/bin/cli platform deletePlatformDLCConfig \
    --namespace <namespace value>
```

### Operation QueryEntitlements

```sh
$ build/install/cli/bin/cli platform queryEntitlements \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --appType <appType value - optional> \
    --entitlementClazz <entitlementClazz value - optional> \
    --entitlementName <entitlementName value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --origin <origin value - optional> \
    --userId <userId value - optional>
```

### Operation QueryEntitlementsByItemIds

```sh
$ build/install/cli/bin/cli platform queryEntitlementsByItemIds \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --itemIds <itemIds value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation EnableEntitlementOriginFeature

```sh
$ build/install/cli/bin/cli platform enableEntitlementOriginFeature \
    --namespace <namespace value>
```

### Operation GetEntitlementConfigInfo

```sh
$ build/install/cli/bin/cli platform getEntitlementConfigInfo \
    --namespace <namespace value> \
    --withoutCache <withoutCache value - optional>
```

### Operation GrantEntitlements

```sh
$ build/install/cli/bin/cli platform grantEntitlements \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RevokeEntitlements

```sh
$ build/install/cli/bin/cli platform revokeEntitlements \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetEntitlement

```sh
$ build/install/cli/bin/cli platform getEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value>
```

### Operation QueryFulfillmentHistories

```sh
$ build/install/cli/bin/cli platform queryFulfillmentHistories \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional> \
    --userId <userId value - optional>
```

### Operation QueryIAPClawbackHistory

```sh
$ build/install/cli/bin/cli platform queryIAPClawbackHistory \
    --namespace <namespace value> \
    --endTime <endTime value - optional> \
    --eventType <eventType value - optional> \
    --externalOrderId <externalOrderId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startTime <startTime value - optional> \
    --status <status value - optional> \
    --userId <userId value - optional>
```

### Operation MockPlayStationStreamEvent

```sh
$ build/install/cli/bin/cli platform mockPlayStationStreamEvent \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation MockXblClawbackEvent

```sh
$ build/install/cli/bin/cli platform mockXblClawbackEvent \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetAppleIAPConfig

```sh
$ build/install/cli/bin/cli platform getAppleIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateAppleIAPConfig

```sh
$ build/install/cli/bin/cli platform updateAppleIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteAppleIAPConfig

```sh
$ build/install/cli/bin/cli platform deleteAppleIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateAppleP8File

```sh
$ build/install/cli/bin/cli platform updateAppleP8File \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation GetEpicGamesIAPConfig

```sh
$ build/install/cli/bin/cli platform getEpicGamesIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateEpicGamesIAPConfig

```sh
$ build/install/cli/bin/cli platform updateEpicGamesIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteEpicGamesIAPConfig

```sh
$ build/install/cli/bin/cli platform deleteEpicGamesIAPConfig \
    --namespace <namespace value>
```

### Operation GetGoogleIAPConfig

```sh
$ build/install/cli/bin/cli platform getGoogleIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateGoogleIAPConfig

```sh
$ build/install/cli/bin/cli platform updateGoogleIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteGoogleIAPConfig

```sh
$ build/install/cli/bin/cli platform deleteGoogleIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateGoogleP12File

```sh
$ build/install/cli/bin/cli platform updateGoogleP12File \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation GetIAPItemConfig

```sh
$ build/install/cli/bin/cli platform getIAPItemConfig \
    --namespace <namespace value>
```

### Operation UpdateIAPItemConfig

```sh
$ build/install/cli/bin/cli platform updateIAPItemConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteIAPItemConfig

```sh
$ build/install/cli/bin/cli platform deleteIAPItemConfig \
    --namespace <namespace value>
```

### Operation GetOculusIAPConfig

```sh
$ build/install/cli/bin/cli platform getOculusIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateOculusIAPConfig

```sh
$ build/install/cli/bin/cli platform updateOculusIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteOculusIAPConfig

```sh
$ build/install/cli/bin/cli platform deleteOculusIAPConfig \
    --namespace <namespace value>
```

### Operation GetPlayStationIAPConfig

```sh
$ build/install/cli/bin/cli platform getPlayStationIAPConfig \
    --namespace <namespace value>
```

### Operation UpdatePlaystationIAPConfig

```sh
$ build/install/cli/bin/cli platform updatePlaystationIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeletePlaystationIAPConfig

```sh
$ build/install/cli/bin/cli platform deletePlaystationIAPConfig \
    --namespace <namespace value>
```

### Operation ValidateExistedPlaystationIAPConfig

```sh
$ build/install/cli/bin/cli platform validateExistedPlaystationIAPConfig \
    --namespace <namespace value>
```

### Operation ValidatePlaystationIAPConfig

```sh
$ build/install/cli/bin/cli platform validatePlaystationIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSteamIAPConfig

```sh
$ build/install/cli/bin/cli platform getSteamIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateSteamIAPConfig

```sh
$ build/install/cli/bin/cli platform updateSteamIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteSteamIAPConfig

```sh
$ build/install/cli/bin/cli platform deleteSteamIAPConfig \
    --namespace <namespace value>
```

### Operation GetTwitchIAPConfig

```sh
$ build/install/cli/bin/cli platform getTwitchIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateTwitchIAPConfig

```sh
$ build/install/cli/bin/cli platform updateTwitchIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteTwitchIAPConfig

```sh
$ build/install/cli/bin/cli platform deleteTwitchIAPConfig \
    --namespace <namespace value>
```

### Operation GetXblIAPConfig

```sh
$ build/install/cli/bin/cli platform getXblIAPConfig \
    --namespace <namespace value>
```

### Operation UpdateXblIAPConfig

```sh
$ build/install/cli/bin/cli platform updateXblIAPConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteXblAPConfig

```sh
$ build/install/cli/bin/cli platform deleteXblAPConfig \
    --namespace <namespace value>
```

### Operation UpdateXblBPCertFile

```sh
$ build/install/cli/bin/cli platform updateXblBPCertFile \
    --namespace <namespace value> \
    --file <file value - optional> \
    --password <password value - optional>
```

### Operation QueryThirdPartyNotifications

```sh
$ build/install/cli/bin/cli platform queryThirdPartyNotifications \
    --namespace <namespace value> \
    --endDate <endDate value - optional> \
    --externalId <externalId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --source <source value - optional> \
    --startDate <startDate value - optional> \
    --status <status value - optional> \
    --type <type value - optional>
```

### Operation QueryAbnormalTransactions

```sh
$ build/install/cli/bin/cli platform queryAbnormalTransactions \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --orderId <orderId value - optional> \
    --steamId <steamId value - optional>
```

### Operation AdminGetSteamJobInfo

```sh
$ build/install/cli/bin/cli platform adminGetSteamJobInfo \
    --namespace <namespace value>
```

### Operation AdminResetSteamJobTime

```sh
$ build/install/cli/bin/cli platform adminResetSteamJobTime \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminRefundIAPOrder

```sh
$ build/install/cli/bin/cli platform adminRefundIAPOrder \
    --iapOrderNo <iapOrderNo value> \
    --namespace <namespace value>
```

### Operation QuerySteamReportHistories

```sh
$ build/install/cli/bin/cli platform querySteamReportHistories \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --orderId <orderId value - optional> \
    --processStatus <processStatus value - optional> \
    --steamId <steamId value - optional>
```

### Operation QueryThirdPartySubscription

```sh
$ build/install/cli/bin/cli platform queryThirdPartySubscription \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --groupId <groupId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platform <platform value - optional> \
    --productId <productId value - optional> \
    --userId <userId value - optional>
```

### Operation GetIAPOrderConsumeDetails

```sh
$ build/install/cli/bin/cli platform getIAPOrderConsumeDetails \
    --iapOrderNo <iapOrderNo value> \
    --namespace <namespace value>
```

### Operation DownloadInvoiceDetails

```sh
$ build/install/cli/bin/cli platform downloadInvoiceDetails \
    --namespace <namespace value> \
    --endTime <endTime value> \
    --feature <feature value> \
    --itemId <itemId value> \
    --itemType <itemType value> \
    --startTime <startTime value>
```

### Operation GenerateInvoiceSummary

```sh
$ build/install/cli/bin/cli platform generateInvoiceSummary \
    --namespace <namespace value> \
    --endTime <endTime value> \
    --feature <feature value> \
    --itemId <itemId value> \
    --itemType <itemType value> \
    --startTime <startTime value>
```

### Operation SyncInGameItem

```sh
$ build/install/cli/bin/cli platform syncInGameItem \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation CreateItem

```sh
$ build/install/cli/bin/cli platform createItem \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation GetItemByAppId

```sh
$ build/install/cli/bin/cli platform getItemByAppId \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --storeId <storeId value - optional> \
    --appId <appId value>
```

### Operation QueryItems

```sh
$ build/install/cli/bin/cli platform queryItems \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --appType <appType value - optional> \
    --availableDate <availableDate value - optional> \
    --baseAppId <baseAppId value - optional> \
    --categoryPath <categoryPath value - optional> \
    --features <features value - optional> \
    --includeSubCategoryItem <includeSubCategoryItem value - optional> \
    --itemType <itemType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --sortBy <sortBy value - optional> \
    --storeId <storeId value - optional> \
    --tags <tags value - optional> \
    --targetNamespace <targetNamespace value - optional>
```

### Operation ListBasicItemsByFeatures

```sh
$ build/install/cli/bin/cli platform listBasicItemsByFeatures \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --features <features value - optional>
```

### Operation GetItems

```sh
$ build/install/cli/bin/cli platform getItems \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --storeId <storeId value - optional> \
    --itemIds <itemIds value>
```

### Operation GetItemBySku

```sh
$ build/install/cli/bin/cli platform getItemBySku \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --storeId <storeId value - optional> \
    --sku <sku value>
```

### Operation GetLocaleItemBySku

```sh
$ build/install/cli/bin/cli platform getLocaleItemBySku \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --language <language value - optional> \
    --populateBundle <populateBundle value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --sku <sku value>
```

### Operation GetEstimatedPrice

```sh
$ build/install/cli/bin/cli platform getEstimatedPrice \
    --namespace <namespace value> \
    --platform <platform value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --itemIds <itemIds value> \
    --userId <userId value>
```

### Operation GetItemIdBySku

```sh
$ build/install/cli/bin/cli platform getItemIdBySku \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --storeId <storeId value - optional> \
    --sku <sku value>
```

### Operation GetBulkItemIdBySkus

```sh
$ build/install/cli/bin/cli platform getBulkItemIdBySkus \
    --namespace <namespace value> \
    --sku <sku value - optional> \
    --storeId <storeId value - optional>
```

### Operation BulkGetLocaleItems

```sh
$ build/install/cli/bin/cli platform bulkGetLocaleItems \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --language <language value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --itemIds <itemIds value>
```

### Operation GetAvailablePredicateTypes

```sh
$ build/install/cli/bin/cli platform getAvailablePredicateTypes \
    --namespace <namespace value>
```

### Operation ValidateItemPurchaseCondition

```sh
$ build/install/cli/bin/cli platform validateItemPurchaseCondition \
    --namespace <namespace value> \
    --platform <platform value - optional> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation BulkUpdateRegionData

```sh
$ build/install/cli/bin/cli platform bulkUpdateRegionData \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation SearchItems

```sh
$ build/install/cli/bin/cli platform searchItems \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --itemType <itemType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --storeId <storeId value - optional> \
    --keyword <keyword value> \
    --language <language value>
```

### Operation QueryUncategorizedItems

```sh
$ build/install/cli/bin/cli platform queryUncategorizedItems \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --storeId <storeId value - optional>
```

### Operation GetItem

```sh
$ build/install/cli/bin/cli platform getItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --storeId <storeId value - optional>
```

### Operation UpdateItem

```sh
$ build/install/cli/bin/cli platform updateItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation DeleteItem

```sh
$ build/install/cli/bin/cli platform deleteItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --featuresToCheck <featuresToCheck value - optional> \
    --force <force value - optional> \
    --storeId <storeId value - optional>
```

### Operation AcquireItem

```sh
$ build/install/cli/bin/cli platform acquireItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetApp

```sh
$ build/install/cli/bin/cli platform getApp \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --storeId <storeId value - optional>
```

### Operation UpdateApp

```sh
$ build/install/cli/bin/cli platform updateApp \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation DisableItem

```sh
$ build/install/cli/bin/cli platform disableItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation GetItemDynamicData

```sh
$ build/install/cli/bin/cli platform getItemDynamicData \
    --itemId <itemId value> \
    --namespace <namespace value>
```

### Operation EnableItem

```sh
$ build/install/cli/bin/cli platform enableItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation FeatureItem

```sh
$ build/install/cli/bin/cli platform featureItem \
    --feature <feature value> \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation DefeatureItem

```sh
$ build/install/cli/bin/cli platform defeatureItem \
    --feature <feature value> \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation GetLocaleItem

```sh
$ build/install/cli/bin/cli platform getLocaleItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --language <language value - optional> \
    --populateBundle <populateBundle value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional>
```

### Operation UpdateItemPurchaseCondition

```sh
$ build/install/cli/bin/cli platform updateItemPurchaseCondition \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation QueryItemReferences

```sh
$ build/install/cli/bin/cli platform queryItemReferences \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --featuresToCheck <featuresToCheck value - optional> \
    --storeId <storeId value - optional>
```

### Operation ReturnItem

```sh
$ build/install/cli/bin/cli platform returnItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation QueryKeyGroups

```sh
$ build/install/cli/bin/cli platform queryKeyGroups \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional> \
    --tag <tag value - optional>
```

### Operation CreateKeyGroup

```sh
$ build/install/cli/bin/cli platform createKeyGroup \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetKeyGroup

```sh
$ build/install/cli/bin/cli platform getKeyGroup \
    --keyGroupId <keyGroupId value> \
    --namespace <namespace value>
```

### Operation UpdateKeyGroup

```sh
$ build/install/cli/bin/cli platform updateKeyGroup \
    --keyGroupId <keyGroupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetKeyGroupDynamic

```sh
$ build/install/cli/bin/cli platform getKeyGroupDynamic \
    --keyGroupId <keyGroupId value> \
    --namespace <namespace value>
```

### Operation ListKeys

```sh
$ build/install/cli/bin/cli platform listKeys \
    --keyGroupId <keyGroupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional>
```

### Operation UploadKeys

```sh
$ build/install/cli/bin/cli platform uploadKeys \
    --keyGroupId <keyGroupId value> \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation QueryOrders

```sh
$ build/install/cli/bin/cli platform queryOrders \
    --namespace <namespace value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --orderNos <orderNos value - optional> \
    --sortBy <sortBy value - optional> \
    --startTime <startTime value - optional> \
    --status <status value - optional> \
    --withTotal <withTotal value - optional>
```

### Operation GetOrderStatistics

```sh
$ build/install/cli/bin/cli platform getOrderStatistics \
    --namespace <namespace value>
```

### Operation GetOrder

```sh
$ build/install/cli/bin/cli platform getOrder \
    --namespace <namespace value> \
    --orderNo <orderNo value>
```

### Operation RefundOrder

```sh
$ build/install/cli/bin/cli platform refundOrder \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --body <json string for request body>
```

### Operation GetPaymentMerchantConfig

```sh
$ build/install/cli/bin/cli platform getPaymentMerchantConfig \
    --namespace <namespace value>
```

### Operation UpdatePaymentDomainWhitelistConfig

```sh
$ build/install/cli/bin/cli platform updatePaymentDomainWhitelistConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation QueryPaymentNotifications

```sh
$ build/install/cli/bin/cli platform queryPaymentNotifications \
    --namespace <namespace value> \
    --endDate <endDate value - optional> \
    --externalId <externalId value - optional> \
    --limit <limit value - optional> \
    --notificationSource <notificationSource value - optional> \
    --notificationType <notificationType value - optional> \
    --offset <offset value - optional> \
    --paymentOrderNo <paymentOrderNo value - optional> \
    --startDate <startDate value - optional> \
    --status <status value - optional>
```

### Operation QueryPaymentOrders

```sh
$ build/install/cli/bin/cli platform queryPaymentOrders \
    --namespace <namespace value> \
    --channel <channel value - optional> \
    --extTxId <extTxId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional>
```

### Operation CreatePaymentOrderByDedicated

```sh
$ build/install/cli/bin/cli platform createPaymentOrderByDedicated \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ListExtOrderNoByExtTxId

```sh
$ build/install/cli/bin/cli platform listExtOrderNoByExtTxId \
    --namespace <namespace value> \
    --extTxId <extTxId value>
```

### Operation GetPaymentOrder

```sh
$ build/install/cli/bin/cli platform getPaymentOrder \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value>
```

### Operation ChargePaymentOrder

```sh
$ build/install/cli/bin/cli platform chargePaymentOrder \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value> \
    --body <json string for request body>
```

### Operation RefundPaymentOrderByDedicated

```sh
$ build/install/cli/bin/cli platform refundPaymentOrderByDedicated \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value> \
    --body <json string for request body>
```

### Operation SimulatePaymentOrderNotification

```sh
$ build/install/cli/bin/cli platform simulatePaymentOrderNotification \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value> \
    --body <json string for request body>
```

### Operation GetPaymentOrderChargeStatus

```sh
$ build/install/cli/bin/cli platform getPaymentOrderChargeStatus \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value>
```

### Operation GetPsnEntitlementOwnership

```sh
$ build/install/cli/bin/cli platform getPsnEntitlementOwnership \
    --entitlementLabel <entitlementLabel value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetXboxEntitlementOwnership

```sh
$ build/install/cli/bin/cli platform getXboxEntitlementOwnership \
    --namespace <namespace value> \
    --productSku <productSku value> \
    --body <json string for request body>
```

### Operation GetPlatformEntitlementConfig

```sh
$ build/install/cli/bin/cli platform getPlatformEntitlementConfig \
    --namespace <namespace value> \
    --platform <platform value>
```

### Operation UpdatePlatformEntitlementConfig

```sh
$ build/install/cli/bin/cli platform updatePlatformEntitlementConfig \
    --namespace <namespace value> \
    --platform <platform value> \
    --body <json string for request body>
```

### Operation GetPlatformWalletConfig

```sh
$ build/install/cli/bin/cli platform getPlatformWalletConfig \
    --namespace <namespace value> \
    --platform <platform value>
```

### Operation UpdatePlatformWalletConfig

```sh
$ build/install/cli/bin/cli platform updatePlatformWalletConfig \
    --namespace <namespace value> \
    --platform <platform value> \
    --body <json string for request body>
```

### Operation ResetPlatformWalletConfig

```sh
$ build/install/cli/bin/cli platform resetPlatformWalletConfig \
    --namespace <namespace value> \
    --platform <platform value>
```

### Operation GetRevocationConfig

```sh
$ build/install/cli/bin/cli platform getRevocationConfig \
    --namespace <namespace value>
```

### Operation UpdateRevocationConfig

```sh
$ build/install/cli/bin/cli platform updateRevocationConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteRevocationConfig

```sh
$ build/install/cli/bin/cli platform deleteRevocationConfig \
    --namespace <namespace value>
```

### Operation QueryRevocationHistories

```sh
$ build/install/cli/bin/cli platform queryRevocationHistories \
    --namespace <namespace value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --source <source value - optional> \
    --startTime <startTime value - optional> \
    --status <status value - optional> \
    --transactionId <transactionId value - optional> \
    --userId <userId value - optional>
```

### Operation GetRevocationPluginConfig

```sh
$ build/install/cli/bin/cli platform getRevocationPluginConfig \
    --namespace <namespace value>
```

### Operation UpdateRevocationPluginConfig

```sh
$ build/install/cli/bin/cli platform updateRevocationPluginConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteRevocationPluginConfig

```sh
$ build/install/cli/bin/cli platform deleteRevocationPluginConfig \
    --namespace <namespace value>
```

### Operation UploadRevocationPluginConfigCert

```sh
$ build/install/cli/bin/cli platform uploadRevocationPluginConfigCert \
    --namespace <namespace value> \
    --file <file value - optional>
```

### Operation CreateReward

```sh
$ build/install/cli/bin/cli platform createReward \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation QueryRewards

```sh
$ build/install/cli/bin/cli platform queryRewards \
    --namespace <namespace value> \
    --eventTopic <eventTopic value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation ExportRewards

```sh
$ build/install/cli/bin/cli platform exportRewards \
    --namespace <namespace value>
```

### Operation ImportRewards

```sh
$ build/install/cli/bin/cli platform importRewards \
    --namespace <namespace value> \
    --replaceExisting <replaceExisting value> \
    --file <file value - optional>
```

### Operation GetReward

```sh
$ build/install/cli/bin/cli platform getReward \
    --namespace <namespace value> \
    --rewardId <rewardId value>
```

### Operation UpdateReward

```sh
$ build/install/cli/bin/cli platform updateReward \
    --namespace <namespace value> \
    --rewardId <rewardId value> \
    --body <json string for request body>
```

### Operation DeleteReward

```sh
$ build/install/cli/bin/cli platform deleteReward \
    --namespace <namespace value> \
    --rewardId <rewardId value>
```

### Operation CheckEventCondition

```sh
$ build/install/cli/bin/cli platform checkEventCondition \
    --namespace <namespace value> \
    --rewardId <rewardId value> \
    --body <json string for request body>
```

### Operation DeleteRewardConditionRecord

```sh
$ build/install/cli/bin/cli platform deleteRewardConditionRecord \
    --namespace <namespace value> \
    --rewardId <rewardId value> \
    --body <json string for request body>
```

### Operation QuerySections

```sh
$ build/install/cli/bin/cli platform querySections \
    --namespace <namespace value> \
    --end <end value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --start <start value - optional> \
    --storeId <storeId value - optional> \
    --viewId <viewId value - optional>
```

### Operation CreateSection

```sh
$ build/install/cli/bin/cli platform createSection \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation PurgeExpiredSection

```sh
$ build/install/cli/bin/cli platform purgeExpiredSection \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation GetSection

```sh
$ build/install/cli/bin/cli platform getSection \
    --namespace <namespace value> \
    --sectionId <sectionId value> \
    --storeId <storeId value - optional>
```

### Operation UpdateSection

```sh
$ build/install/cli/bin/cli platform updateSection \
    --namespace <namespace value> \
    --sectionId <sectionId value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation DeleteSection

```sh
$ build/install/cli/bin/cli platform deleteSection \
    --namespace <namespace value> \
    --sectionId <sectionId value> \
    --storeId <storeId value>
```

### Operation ListStores

```sh
$ build/install/cli/bin/cli platform listStores \
    --namespace <namespace value>
```

### Operation CreateStore

```sh
$ build/install/cli/bin/cli platform createStore \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetCatalogDefinition

```sh
$ build/install/cli/bin/cli platform getCatalogDefinition \
    --namespace <namespace value> \
    --catalogType <catalogType value>
```

### Operation DownloadCSVTemplates

```sh
$ build/install/cli/bin/cli platform downloadCSVTemplates \
    --namespace <namespace value>
```

### Operation ExportStoreByCSV

```sh
$ build/install/cli/bin/cli platform exportStoreByCSV \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetPublishedStore

```sh
$ build/install/cli/bin/cli platform getPublishedStore \
    --namespace <namespace value>
```

### Operation DeletePublishedStore

```sh
$ build/install/cli/bin/cli platform deletePublishedStore \
    --namespace <namespace value>
```

### Operation GetPublishedStoreBackup

```sh
$ build/install/cli/bin/cli platform getPublishedStoreBackup \
    --namespace <namespace value>
```

### Operation RollbackPublishedStore

```sh
$ build/install/cli/bin/cli platform rollbackPublishedStore \
    --namespace <namespace value>
```

### Operation GetStore

```sh
$ build/install/cli/bin/cli platform getStore \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation UpdateStore

```sh
$ build/install/cli/bin/cli platform updateStore \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation DeleteStore

```sh
$ build/install/cli/bin/cli platform deleteStore \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation QueryChanges

```sh
$ build/install/cli/bin/cli platform queryChanges \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --action <action value - optional> \
    --itemSku <itemSku value - optional> \
    --itemType <itemType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --selected <selected value - optional> \
    --sortBy <sortBy value - optional> \
    --status <status value - optional> \
    --type <type value - optional> \
    --updatedAtEnd <updatedAtEnd value - optional> \
    --updatedAtStart <updatedAtStart value - optional> \
    --withTotal <withTotal value - optional>
```

### Operation PublishAll

```sh
$ build/install/cli/bin/cli platform publishAll \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation PublishSelected

```sh
$ build/install/cli/bin/cli platform publishSelected \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation SelectAllRecords

```sh
$ build/install/cli/bin/cli platform selectAllRecords \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation SelectAllRecordsByCriteria

```sh
$ build/install/cli/bin/cli platform selectAllRecordsByCriteria \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --action <action value - optional> \
    --itemSku <itemSku value - optional> \
    --itemType <itemType value - optional> \
    --selected <selected value - optional> \
    --type <type value - optional> \
    --updatedAtEnd <updatedAtEnd value - optional> \
    --updatedAtStart <updatedAtStart value - optional>
```

### Operation GetStatistic

```sh
$ build/install/cli/bin/cli platform getStatistic \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --action <action value - optional> \
    --itemSku <itemSku value - optional> \
    --itemType <itemType value - optional> \
    --type <type value - optional> \
    --updatedAtEnd <updatedAtEnd value - optional> \
    --updatedAtStart <updatedAtStart value - optional>
```

### Operation UnselectAllRecords

```sh
$ build/install/cli/bin/cli platform unselectAllRecords \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation SelectRecord

```sh
$ build/install/cli/bin/cli platform selectRecord \
    --changeId <changeId value> \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation UnselectRecord

```sh
$ build/install/cli/bin/cli platform unselectRecord \
    --changeId <changeId value> \
    --namespace <namespace value> \
    --storeId <storeId value>
```

### Operation CloneStore

```sh
$ build/install/cli/bin/cli platform cloneStore \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --targetStoreId <targetStoreId value - optional>
```

### Operation QueryImportHistory

```sh
$ build/install/cli/bin/cli platform queryImportHistory \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --end <end value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --start <start value - optional> \
    --success <success value - optional>
```

### Operation ImportStoreByCSV

```sh
$ build/install/cli/bin/cli platform importStoreByCSV \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --category <category value - optional> \
    --display <display value - optional> \
    --item <item value - optional> \
    --notes <notes value - optional> \
    --section <section value - optional>
```

### Operation QuerySubscriptions

```sh
$ build/install/cli/bin/cli platform querySubscriptions \
    --namespace <namespace value> \
    --chargeStatus <chargeStatus value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sku <sku value - optional> \
    --status <status value - optional> \
    --subscribedBy <subscribedBy value - optional> \
    --userId <userId value - optional>
```

### Operation RecurringChargeSubscription

```sh
$ build/install/cli/bin/cli platform recurringChargeSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value>
```

### Operation GetTicketDynamic

```sh
$ build/install/cli/bin/cli platform getTicketDynamic \
    --boothName <boothName value> \
    --namespace <namespace value>
```

### Operation DecreaseTicketSale

```sh
$ build/install/cli/bin/cli platform decreaseTicketSale \
    --boothName <boothName value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetTicketBoothID

```sh
$ build/install/cli/bin/cli platform getTicketBoothID \
    --boothName <boothName value> \
    --namespace <namespace value>
```

### Operation IncreaseTicketSale

```sh
$ build/install/cli/bin/cli platform increaseTicketSale \
    --boothName <boothName value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation Commit

```sh
$ build/install/cli/bin/cli platform commit \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetTradeHistoryByCriteria

```sh
$ build/install/cli/bin/cli platform getTradeHistoryByCriteria \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional> \
    --type <type value - optional> \
    --userId <userId value - optional>
```

### Operation GetTradeHistoryByTransactionId

```sh
$ build/install/cli/bin/cli platform getTradeHistoryByTransactionId \
    --namespace <namespace value> \
    --transactionId <transactionId value>
```

### Operation UnlockSteamUserAchievement

```sh
$ build/install/cli/bin/cli platform unlockSteamUserAchievement \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetXblUserAchievements

```sh
$ build/install/cli/bin/cli platform getXblUserAchievements \
    --namespace <namespace value> \
    --userId <userId value> \
    --xboxUserId <xboxUserId value>
```

### Operation UpdateXblUserAchievement

```sh
$ build/install/cli/bin/cli platform updateXblUserAchievement \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AnonymizeCampaign

```sh
$ build/install/cli/bin/cli platform anonymizeCampaign \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeEntitlement

```sh
$ build/install/cli/bin/cli platform anonymizeEntitlement \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeFulfillment

```sh
$ build/install/cli/bin/cli platform anonymizeFulfillment \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeIntegration

```sh
$ build/install/cli/bin/cli platform anonymizeIntegration \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeOrder

```sh
$ build/install/cli/bin/cli platform anonymizeOrder \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizePayment

```sh
$ build/install/cli/bin/cli platform anonymizePayment \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeRevocation

```sh
$ build/install/cli/bin/cli platform anonymizeRevocation \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeSubscription

```sh
$ build/install/cli/bin/cli platform anonymizeSubscription \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AnonymizeWallet

```sh
$ build/install/cli/bin/cli platform anonymizeWallet \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetUserDLCByPlatform

```sh
$ build/install/cli/bin/cli platform getUserDLCByPlatform \
    --namespace <namespace value> \
    --userId <userId value> \
    --type <type value>
```

### Operation GetUserDLC

```sh
$ build/install/cli/bin/cli platform getUserDLC \
    --namespace <namespace value> \
    --userId <userId value> \
    --includeAllNamespaces <includeAllNamespaces value - optional> \
    --status <status value - optional> \
    --type <type value - optional>
```

### Operation QueryUserEntitlements

```sh
$ build/install/cli/bin/cli platform queryUserEntitlements \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --appType <appType value - optional> \
    --collectionId <collectionId value - optional> \
    --entitlementClazz <entitlementClazz value - optional> \
    --entitlementName <entitlementName value - optional> \
    --features <features value - optional> \
    --fuzzyMatchName <fuzzyMatchName value - optional> \
    --ignoreActiveDate <ignoreActiveDate value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --origin <origin value - optional>
```

### Operation GrantUserEntitlement

```sh
$ build/install/cli/bin/cli platform grantUserEntitlement \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetUserAppEntitlementByAppId

```sh
$ build/install/cli/bin/cli platform getUserAppEntitlementByAppId \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --appId <appId value>
```

### Operation QueryUserEntitlementsByAppType

```sh
$ build/install/cli/bin/cli platform queryUserEntitlementsByAppType \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --appType <appType value>
```

### Operation GetUserEntitlementsByIds

```sh
$ build/install/cli/bin/cli platform getUserEntitlementsByIds \
    --namespace <namespace value> \
    --userId <userId value> \
    --ids <ids value - optional>
```

### Operation GetUserEntitlementByItemId

```sh
$ build/install/cli/bin/cli platform getUserEntitlementByItemId \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --entitlementClazz <entitlementClazz value - optional> \
    --platform <platform value - optional> \
    --itemId <itemId value>
```

### Operation GetUserActiveEntitlementsByItemIds

```sh
$ build/install/cli/bin/cli platform getUserActiveEntitlementsByItemIds \
    --namespace <namespace value> \
    --userId <userId value> \
    --ids <ids value - optional> \
    --platform <platform value - optional>
```

### Operation GetUserEntitlementBySku

```sh
$ build/install/cli/bin/cli platform getUserEntitlementBySku \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --entitlementClazz <entitlementClazz value - optional> \
    --platform <platform value - optional> \
    --sku <sku value>
```

### Operation ExistsAnyUserActiveEntitlement

```sh
$ build/install/cli/bin/cli platform existsAnyUserActiveEntitlement \
    --namespace <namespace value> \
    --userId <userId value> \
    --appIds <appIds value - optional> \
    --itemIds <itemIds value - optional> \
    --platform <platform value - optional> \
    --skus <skus value - optional>
```

### Operation ExistsAnyUserActiveEntitlementByItemIds

```sh
$ build/install/cli/bin/cli platform existsAnyUserActiveEntitlementByItemIds \
    --namespace <namespace value> \
    --userId <userId value> \
    --platform <platform value - optional> \
    --itemIds <itemIds value>
```

### Operation GetUserAppEntitlementOwnershipByAppId

```sh
$ build/install/cli/bin/cli platform getUserAppEntitlementOwnershipByAppId \
    --namespace <namespace value> \
    --userId <userId value> \
    --appId <appId value>
```

### Operation GetUserEntitlementOwnershipByItemId

```sh
$ build/install/cli/bin/cli platform getUserEntitlementOwnershipByItemId \
    --namespace <namespace value> \
    --userId <userId value> \
    --entitlementClazz <entitlementClazz value - optional> \
    --platform <platform value - optional> \
    --itemId <itemId value>
```

### Operation GetUserEntitlementOwnershipByItemIds

```sh
$ build/install/cli/bin/cli platform getUserEntitlementOwnershipByItemIds \
    --namespace <namespace value> \
    --userId <userId value> \
    --ids <ids value - optional> \
    --platform <platform value - optional>
```

### Operation GetUserEntitlementOwnershipBySku

```sh
$ build/install/cli/bin/cli platform getUserEntitlementOwnershipBySku \
    --namespace <namespace value> \
    --userId <userId value> \
    --entitlementClazz <entitlementClazz value - optional> \
    --platform <platform value - optional> \
    --sku <sku value>
```

### Operation RevokeAllEntitlements

```sh
$ build/install/cli/bin/cli platform revokeAllEntitlements \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation RevokeUserEntitlements

```sh
$ build/install/cli/bin/cli platform revokeUserEntitlements \
    --namespace <namespace value> \
    --userId <userId value> \
    --entitlementIds <entitlementIds value>
```

### Operation GetUserEntitlement

```sh
$ build/install/cli/bin/cli platform getUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateUserEntitlement

```sh
$ build/install/cli/bin/cli platform updateUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ConsumeUserEntitlement

```sh
$ build/install/cli/bin/cli platform consumeUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DisableUserEntitlement

```sh
$ build/install/cli/bin/cli platform disableUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation EnableUserEntitlement

```sh
$ build/install/cli/bin/cli platform enableUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetUserEntitlementHistories

```sh
$ build/install/cli/bin/cli platform getUserEntitlementHistories \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation RevokeUserEntitlement

```sh
$ build/install/cli/bin/cli platform revokeUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation RevokeUserEntitlementByUseCount

```sh
$ build/install/cli/bin/cli platform revokeUserEntitlementByUseCount \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PreCheckRevokeUserEntitlementByUseCount

```sh
$ build/install/cli/bin/cli platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --quantity <quantity value>
```

### Operation SellUserEntitlement

```sh
$ build/install/cli/bin/cli platform sellUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation FulfillItem

```sh
$ build/install/cli/bin/cli platform fulfillItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation RedeemCode

```sh
$ build/install/cli/bin/cli platform redeemCode \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PreCheckFulfillItem

```sh
$ build/install/cli/bin/cli platform preCheckFulfillItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation FulfillRewards

```sh
$ build/install/cli/bin/cli platform fulfillRewards \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation QueryUserIAPOrders

```sh
$ build/install/cli/bin/cli platform queryUserIAPOrders \
    --namespace <namespace value> \
    --userId <userId value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --productId <productId value - optional> \
    --startTime <startTime value - optional> \
    --status <status value - optional> \
    --type <type value - optional>
```

### Operation QueryAllUserIAPOrders

```sh
$ build/install/cli/bin/cli platform queryAllUserIAPOrders \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation QueryUserIAPConsumeHistory

```sh
$ build/install/cli/bin/cli platform queryUserIAPConsumeHistory \
    --namespace <namespace value> \
    --userId <userId value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startTime <startTime value - optional> \
    --status <status value - optional> \
    --type <type value - optional>
```

### Operation MockFulfillIAPItem

```sh
$ build/install/cli/bin/cli platform mockFulfillIAPItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetIAPOrderLineItems

```sh
$ build/install/cli/bin/cli platform adminGetIAPOrderLineItems \
    --iapOrderNo <iapOrderNo value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminSyncSteamAbnormalTransaction

```sh
$ build/install/cli/bin/cli platform adminSyncSteamAbnormalTransaction \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminSyncSteamIAPByTransaction

```sh
$ build/install/cli/bin/cli platform adminSyncSteamIAPByTransaction \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation QueryUserThirdPartySubscription

```sh
$ build/install/cli/bin/cli platform queryUserThirdPartySubscription \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --groupId <groupId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platform <platform value - optional> \
    --productId <productId value - optional>
```

### Operation GetThirdPartyPlatformSubscriptionOwnershipByGroupId

```sh
$ build/install/cli/bin/cli platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace <namespace value> \
    --platform <platform value> \
    --userId <userId value> \
    --groupId <groupId value>
```

### Operation GetThirdPartyPlatformSubscriptionOwnershipByProductId

```sh
$ build/install/cli/bin/cli platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace <namespace value> \
    --platform <platform value> \
    --userId <userId value> \
    --productId <productId value>
```

### Operation QueryUserThirdPartySubscriptionTransactions

```sh
$ build/install/cli/bin/cli platform queryUserThirdPartySubscriptionTransactions \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --groupId <groupId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platform <platform value - optional> \
    --productId <productId value - optional>
```

### Operation GetThirdPartySubscriptionDetails

```sh
$ build/install/cli/bin/cli platform getThirdPartySubscriptionDetails \
    --id <id value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetSubscriptionHistory

```sh
$ build/install/cli/bin/cli platform getSubscriptionHistory \
    --id <id value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation SyncSubscriptionTransaction

```sh
$ build/install/cli/bin/cli platform syncSubscriptionTransaction \
    --id <id value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetThirdPartyUserSubscriptionDetails

```sh
$ build/install/cli/bin/cli platform getThirdPartyUserSubscriptionDetails \
    --id <id value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation SyncSubscription

```sh
$ build/install/cli/bin/cli platform syncSubscription \
    --id <id value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation QueryUserOrders

```sh
$ build/install/cli/bin/cli platform queryUserOrders \
    --namespace <namespace value> \
    --userId <userId value> \
    --discounted <discounted value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional>
```

### Operation AdminCreateUserOrder

```sh
$ build/install/cli/bin/cli platform adminCreateUserOrder \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation CountOfPurchasedItem

```sh
$ build/install/cli/bin/cli platform countOfPurchasedItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --itemId <itemId value>
```

### Operation GetUserOrder

```sh
$ build/install/cli/bin/cli platform getUserOrder \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation UpdateUserOrderStatus

```sh
$ build/install/cli/bin/cli platform updateUserOrderStatus \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation FulfillUserOrder

```sh
$ build/install/cli/bin/cli platform fulfillUserOrder \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation GetUserOrderHistories

```sh
$ build/install/cli/bin/cli platform getUserOrderHistories \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation ProcessUserOrderNotification

```sh
$ build/install/cli/bin/cli platform processUserOrderNotification \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DownloadUserOrderReceipt

```sh
$ build/install/cli/bin/cli platform downloadUserOrderReceipt \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation CreateUserPaymentOrder

```sh
$ build/install/cli/bin/cli platform createUserPaymentOrder \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation RefundUserPaymentOrder

```sh
$ build/install/cli/bin/cli platform refundUserPaymentOrder \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetUserPlatformAccountClosureHistories

```sh
$ build/install/cli/bin/cli platform getUserPlatformAccountClosureHistories \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation ApplyUserRedemption

```sh
$ build/install/cli/bin/cli platform applyUserRedemption \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DoRevocation

```sh
$ build/install/cli/bin/cli platform doRevocation \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation RegisterXblSessions

```sh
$ build/install/cli/bin/cli platform registerXblSessions \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation QueryUserSubscriptions

```sh
$ build/install/cli/bin/cli platform queryUserSubscriptions \
    --namespace <namespace value> \
    --userId <userId value> \
    --chargeStatus <chargeStatus value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sku <sku value - optional> \
    --status <status value - optional> \
    --subscribedBy <subscribedBy value - optional>
```

### Operation GetUserSubscriptionActivities

```sh
$ build/install/cli/bin/cli platform getUserSubscriptionActivities \
    --namespace <namespace value> \
    --userId <userId value> \
    --excludeSystem <excludeSystem value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --subscriptionId <subscriptionId value - optional>
```

### Operation PlatformSubscribeSubscription

```sh
$ build/install/cli/bin/cli platform platformSubscribeSubscription \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation CheckUserSubscriptionSubscribableByItemId

```sh
$ build/install/cli/bin/cli platform checkUserSubscriptionSubscribableByItemId \
    --namespace <namespace value> \
    --userId <userId value> \
    --itemId <itemId value>
```

### Operation GetUserSubscription

```sh
$ build/install/cli/bin/cli platform getUserSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value>
```

### Operation DeleteUserSubscription

```sh
$ build/install/cli/bin/cli platform deleteUserSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value>
```

### Operation CancelSubscription

```sh
$ build/install/cli/bin/cli platform cancelSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value> \
    --force <force value - optional> \
    --body <json string for request body>
```

### Operation GrantDaysToSubscription

```sh
$ build/install/cli/bin/cli platform grantDaysToSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetUserSubscriptionBillingHistories

```sh
$ build/install/cli/bin/cli platform getUserSubscriptionBillingHistories \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value> \
    --excludeFree <excludeFree value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation ProcessUserSubscriptionNotification

```sh
$ build/install/cli/bin/cli platform processUserSubscriptionNotification \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AcquireUserTicket

```sh
$ build/install/cli/bin/cli platform acquireUserTicket \
    --boothName <boothName value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation QueryUserCurrencyWallets

```sh
$ build/install/cli/bin/cli platform queryUserCurrencyWallets \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation DebitUserWalletByCurrencyCode

```sh
$ build/install/cli/bin/cli platform debitUserWalletByCurrencyCode \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ListUserCurrencyTransactions

```sh
$ build/install/cli/bin/cli platform listUserCurrencyTransactions \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CheckBalance

```sh
$ build/install/cli/bin/cli platform checkBalance \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --request <json string for request body>
```

### Operation CreditUserWallet

```sh
$ build/install/cli/bin/cli platform creditUserWallet \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DebitByWalletPlatform

```sh
$ build/install/cli/bin/cli platform debitByWalletPlatform \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --request <json string for request body>
```

### Operation PayWithUserWallet

```sh
$ build/install/cli/bin/cli platform payWithUserWallet \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation ListViews

```sh
$ build/install/cli/bin/cli platform listViews \
    --namespace <namespace value> \
    --storeId <storeId value - optional>
```

### Operation CreateView

```sh
$ build/install/cli/bin/cli platform createView \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation GetView

```sh
$ build/install/cli/bin/cli platform getView \
    --namespace <namespace value> \
    --viewId <viewId value> \
    --storeId <storeId value - optional>
```

### Operation UpdateView

```sh
$ build/install/cli/bin/cli platform updateView \
    --namespace <namespace value> \
    --viewId <viewId value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation DeleteView

```sh
$ build/install/cli/bin/cli platform deleteView \
    --namespace <namespace value> \
    --viewId <viewId value> \
    --storeId <storeId value>
```

### Operation GetWalletConfig

```sh
$ build/install/cli/bin/cli platform getWalletConfig \
    --namespace <namespace value>
```

### Operation UpdateWalletConfig

```sh
$ build/install/cli/bin/cli platform updateWalletConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkCredit

```sh
$ build/install/cli/bin/cli platform bulkCredit \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation BulkDebit

```sh
$ build/install/cli/bin/cli platform bulkDebit \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SyncOrders

```sh
$ build/install/cli/bin/cli platform syncOrders \
    --nextEvaluatedKey <nextEvaluatedKey value - optional> \
    --end <end value> \
    --start <start value>
```

### Operation TestAdyenConfig

```sh
$ build/install/cli/bin/cli platform testAdyenConfig \
    --sandbox <sandbox value - optional> \
    --body <json string for request body>
```

### Operation TestAliPayConfig

```sh
$ build/install/cli/bin/cli platform testAliPayConfig \
    --sandbox <sandbox value - optional> \
    --body <json string for request body>
```

### Operation TestCheckoutConfig

```sh
$ build/install/cli/bin/cli platform testCheckoutConfig \
    --sandbox <sandbox value - optional> \
    --body <json string for request body>
```

### Operation DebugMatchedPaymentMerchantConfig

```sh
$ build/install/cli/bin/cli platform debugMatchedPaymentMerchantConfig \
    --namespace <namespace value - optional> \
    --region <region value - optional>
```

### Operation TestNeonPayConfig

```sh
$ build/install/cli/bin/cli platform testNeonPayConfig \
    --sandbox <sandbox value - optional> \
    --body <json string for request body>
```

### Operation TestPayPalConfig

```sh
$ build/install/cli/bin/cli platform testPayPalConfig \
    --sandbox <sandbox value - optional> \
    --body <json string for request body>
```

### Operation TestStripeConfig

```sh
$ build/install/cli/bin/cli platform testStripeConfig \
    --sandbox <sandbox value - optional> \
    --body <json string for request body>
```

### Operation TestWxPayConfig

```sh
$ build/install/cli/bin/cli platform testWxPayConfig \
    --body <json string for request body>
```

### Operation TestXsollaConfig

```sh
$ build/install/cli/bin/cli platform testXsollaConfig \
    --body <json string for request body>
```

### Operation GetPaymentMerchantConfig1

```sh
$ build/install/cli/bin/cli platform getPaymentMerchantConfig1 \
    --id <id value>
```

### Operation UpdateAdyenConfig

```sh
$ build/install/cli/bin/cli platform updateAdyenConfig \
    --id <id value> \
    --sandbox <sandbox value - optional> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestAdyenConfigById

```sh
$ build/install/cli/bin/cli platform testAdyenConfigById \
    --id <id value> \
    --sandbox <sandbox value - optional>
```

### Operation UpdateAliPayConfig

```sh
$ build/install/cli/bin/cli platform updateAliPayConfig \
    --id <id value> \
    --sandbox <sandbox value - optional> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestAliPayConfigById

```sh
$ build/install/cli/bin/cli platform testAliPayConfigById \
    --id <id value> \
    --sandbox <sandbox value - optional>
```

### Operation UpdateCheckoutConfig

```sh
$ build/install/cli/bin/cli platform updateCheckoutConfig \
    --id <id value> \
    --sandbox <sandbox value - optional> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestCheckoutConfigById

```sh
$ build/install/cli/bin/cli platform testCheckoutConfigById \
    --id <id value> \
    --sandbox <sandbox value - optional>
```

### Operation UpdateNeonPayConfig

```sh
$ build/install/cli/bin/cli platform updateNeonPayConfig \
    --id <id value> \
    --sandbox <sandbox value - optional> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestNeonPayConfigById

```sh
$ build/install/cli/bin/cli platform testNeonPayConfigById \
    --id <id value> \
    --sandbox <sandbox value - optional>
```

### Operation UpdatePayPalConfig

```sh
$ build/install/cli/bin/cli platform updatePayPalConfig \
    --id <id value> \
    --sandbox <sandbox value - optional> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestPayPalConfigById

```sh
$ build/install/cli/bin/cli platform testPayPalConfigById \
    --id <id value> \
    --sandbox <sandbox value - optional>
```

### Operation UpdateStripeConfig

```sh
$ build/install/cli/bin/cli platform updateStripeConfig \
    --id <id value> \
    --sandbox <sandbox value - optional> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestStripeConfigById

```sh
$ build/install/cli/bin/cli platform testStripeConfigById \
    --id <id value> \
    --sandbox <sandbox value - optional>
```

### Operation UpdateWxPayConfig

```sh
$ build/install/cli/bin/cli platform updateWxPayConfig \
    --id <id value> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation UpdateWxPayConfigCert

```sh
$ build/install/cli/bin/cli platform updateWxPayConfigCert \
    --id <id value> \
    --file <file value - optional>
```

### Operation TestWxPayConfigById

```sh
$ build/install/cli/bin/cli platform testWxPayConfigById \
    --id <id value>
```

### Operation UpdateXsollaConfig

```sh
$ build/install/cli/bin/cli platform updateXsollaConfig \
    --id <id value> \
    --validate <validate value - optional> \
    --body <json string for request body>
```

### Operation TestXsollaConfigById

```sh
$ build/install/cli/bin/cli platform testXsollaConfigById \
    --id <id value>
```

### Operation UpdateXsollaUIConfig

```sh
$ build/install/cli/bin/cli platform updateXsollaUIConfig \
    --id <id value> \
    --body <json string for request body>
```

### Operation QueryPaymentProviderConfig

```sh
$ build/install/cli/bin/cli platform queryPaymentProviderConfig \
    --limit <limit value - optional> \
    --namespace <namespace value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional>
```

### Operation CreatePaymentProviderConfig

```sh
$ build/install/cli/bin/cli platform createPaymentProviderConfig \
    --body <json string for request body>
```

### Operation GetAggregatePaymentProviders

```sh
$ build/install/cli/bin/cli platform getAggregatePaymentProviders
```

### Operation DebugMatchedPaymentProviderConfig

```sh
$ build/install/cli/bin/cli platform debugMatchedPaymentProviderConfig \
    --namespace <namespace value - optional> \
    --region <region value - optional>
```

### Operation GetSpecialPaymentProviders

```sh
$ build/install/cli/bin/cli platform getSpecialPaymentProviders
```

### Operation UpdatePaymentProviderConfig

```sh
$ build/install/cli/bin/cli platform updatePaymentProviderConfig \
    --id <id value> \
    --body <json string for request body>
```

### Operation DeletePaymentProviderConfig

```sh
$ build/install/cli/bin/cli platform deletePaymentProviderConfig \
    --id <id value>
```

### Operation GetPaymentTaxConfig

```sh
$ build/install/cli/bin/cli platform getPaymentTaxConfig
```

### Operation UpdatePaymentTaxConfig

```sh
$ build/install/cli/bin/cli platform updatePaymentTaxConfig \
    --body <json string for request body>
```

### Operation SyncPaymentOrders

```sh
$ build/install/cli/bin/cli platform syncPaymentOrders \
    --nextEvaluatedKey <nextEvaluatedKey value - optional> \
    --end <end value> \
    --start <start value>
```

### Operation PublicGetRootCategories

```sh
$ build/install/cli/bin/cli platform publicGetRootCategories \
    --namespace <namespace value> \
    --language <language value - optional> \
    --storeId <storeId value - optional>
```

### Operation DownloadCategories

```sh
$ build/install/cli/bin/cli platform downloadCategories \
    --namespace <namespace value> \
    --language <language value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicGetCategory

```sh
$ build/install/cli/bin/cli platform publicGetCategory \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --language <language value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicGetChildCategories

```sh
$ build/install/cli/bin/cli platform publicGetChildCategories \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --language <language value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicGetDescendantCategories

```sh
$ build/install/cli/bin/cli platform publicGetDescendantCategories \
    --categoryPath <categoryPath value> \
    --namespace <namespace value> \
    --language <language value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicListCurrencies

```sh
$ build/install/cli/bin/cli platform publicListCurrencies \
    --namespace <namespace value> \
    --currencyType <currencyType value - optional>
```

### Operation GeDLCDurableRewardShortMap

```sh
$ build/install/cli/bin/cli platform geDLCDurableRewardShortMap \
    --namespace <namespace value> \
    --dlcType <dlcType value>
```

### Operation GetAppleConfigVersion

```sh
$ build/install/cli/bin/cli platform getAppleConfigVersion \
    --namespace <namespace value>
```

### Operation GetIAPItemMapping

```sh
$ build/install/cli/bin/cli platform getIAPItemMapping \
    --namespace <namespace value> \
    --platform <platform value - optional>
```

### Operation PublicGetItemByAppId

```sh
$ build/install/cli/bin/cli platform publicGetItemByAppId \
    --namespace <namespace value> \
    --language <language value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --appId <appId value>
```

### Operation PublicQueryItems

```sh
$ build/install/cli/bin/cli platform publicQueryItems \
    --namespace <namespace value> \
    --appType <appType value - optional> \
    --autoCalcEstimatedPrice <autoCalcEstimatedPrice value - optional> \
    --baseAppId <baseAppId value - optional> \
    --categoryPath <categoryPath value - optional> \
    --features <features value - optional> \
    --includeSubCategoryItem <includeSubCategoryItem value - optional> \
    --itemType <itemType value - optional> \
    --language <language value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --sortBy <sortBy value - optional> \
    --storeId <storeId value - optional> \
    --tags <tags value - optional>
```

### Operation PublicGetItemBySku

```sh
$ build/install/cli/bin/cli platform publicGetItemBySku \
    --namespace <namespace value> \
    --autoCalcEstimatedPrice <autoCalcEstimatedPrice value - optional> \
    --language <language value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --sku <sku value>
```

### Operation PublicGetEstimatedPrice

```sh
$ build/install/cli/bin/cli platform publicGetEstimatedPrice \
    --namespace <namespace value> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --itemIds <itemIds value>
```

### Operation PublicBulkGetItems

```sh
$ build/install/cli/bin/cli platform publicBulkGetItems \
    --namespace <namespace value> \
    --autoCalcEstimatedPrice <autoCalcEstimatedPrice value - optional> \
    --language <language value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --itemIds <itemIds value>
```

### Operation PublicValidateItemPurchaseCondition

```sh
$ build/install/cli/bin/cli platform publicValidateItemPurchaseCondition \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicSearchItems

```sh
$ build/install/cli/bin/cli platform publicSearchItems \
    --namespace <namespace value> \
    --autoCalcEstimatedPrice <autoCalcEstimatedPrice value - optional> \
    --itemType <itemType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --keyword <keyword value> \
    --language <language value>
```

### Operation PublicGetApp

```sh
$ build/install/cli/bin/cli platform publicGetApp \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --language <language value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicGetItemDynamicData

```sh
$ build/install/cli/bin/cli platform publicGetItemDynamicData \
    --itemId <itemId value> \
    --namespace <namespace value>
```

### Operation PublicGetItem

```sh
$ build/install/cli/bin/cli platform publicGetItem \
    --itemId <itemId value> \
    --namespace <namespace value> \
    --autoCalcEstimatedPrice <autoCalcEstimatedPrice value - optional> \
    --language <language value - optional> \
    --populateBundle <populateBundle value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicGetPaymentUrl

```sh
$ build/install/cli/bin/cli platform publicGetPaymentUrl \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetPaymentMethods

```sh
$ build/install/cli/bin/cli platform publicGetPaymentMethods \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value>
```

### Operation PublicGetUnpaidPaymentOrder

```sh
$ build/install/cli/bin/cli platform publicGetUnpaidPaymentOrder \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value>
```

### Operation Pay

```sh
$ build/install/cli/bin/cli platform pay \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value> \
    --paymentProvider <paymentProvider value - optional> \
    --zipCode <zipCode value - optional> \
    --body <json string for request body>
```

### Operation PublicCheckPaymentOrderPaidStatus

```sh
$ build/install/cli/bin/cli platform publicCheckPaymentOrderPaidStatus \
    --namespace <namespace value> \
    --paymentOrderNo <paymentOrderNo value>
```

### Operation GetPaymentPublicConfig

```sh
$ build/install/cli/bin/cli platform getPaymentPublicConfig \
    --namespace <namespace value> \
    --sandbox <sandbox value - optional> \
    --paymentProvider <paymentProvider value> \
    --region <region value>
```

### Operation PublicGetQRCode

```sh
$ build/install/cli/bin/cli platform publicGetQRCode \
    --namespace <namespace value> \
    --code <code value>
```

### Operation PublicNormalizePaymentReturnUrl

```sh
$ build/install/cli/bin/cli platform publicNormalizePaymentReturnUrl \
    --namespace <namespace value> \
    --payerID <PayerID value - optional> \
    --foreinginvoice <foreinginvoice value - optional> \
    --invoiceId <invoice_id value - optional> \
    --payload <payload value - optional> \
    --redirectResult <redirectResult value - optional> \
    --resultCode <resultCode value - optional> \
    --sessionId <sessionId value - optional> \
    --status <status value - optional> \
    --token <token value - optional> \
    --type <type value - optional> \
    --userId <user_id value - optional> \
    --orderNo <orderNo value> \
    --paymentOrderNo <paymentOrderNo value> \
    --paymentProvider <paymentProvider value> \
    --returnUrl <returnUrl value>
```

### Operation GetPaymentTaxValue

```sh
$ build/install/cli/bin/cli platform getPaymentTaxValue \
    --namespace <namespace value> \
    --zipCode <zipCode value - optional> \
    --paymentOrderNo <paymentOrderNo value> \
    --paymentProvider <paymentProvider value>
```

### Operation GetRewardByCode

```sh
$ build/install/cli/bin/cli platform getRewardByCode \
    --namespace <namespace value> \
    --rewardCode <rewardCode value>
```

### Operation QueryRewards1

```sh
$ build/install/cli/bin/cli platform queryRewards1 \
    --namespace <namespace value> \
    --eventTopic <eventTopic value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation GetReward1

```sh
$ build/install/cli/bin/cli platform getReward1 \
    --namespace <namespace value> \
    --rewardId <rewardId value>
```

### Operation PublicListStores

```sh
$ build/install/cli/bin/cli platform publicListStores \
    --namespace <namespace value>
```

### Operation PublicExistsAnyMyActiveEntitlement

```sh
$ build/install/cli/bin/cli platform publicExistsAnyMyActiveEntitlement \
    --namespace <namespace value> \
    --appIds <appIds value - optional> \
    --itemIds <itemIds value - optional> \
    --skus <skus value - optional>
```

### Operation PublicGetMyAppEntitlementOwnershipByAppId

```sh
$ build/install/cli/bin/cli platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace <namespace value> \
    --appId <appId value>
```

### Operation PublicGetMyEntitlementOwnershipByItemId

```sh
$ build/install/cli/bin/cli platform publicGetMyEntitlementOwnershipByItemId \
    --namespace <namespace value> \
    --entitlementClazz <entitlementClazz value - optional> \
    --itemId <itemId value>
```

### Operation PublicGetMyEntitlementOwnershipBySku

```sh
$ build/install/cli/bin/cli platform publicGetMyEntitlementOwnershipBySku \
    --namespace <namespace value> \
    --entitlementClazz <entitlementClazz value - optional> \
    --sku <sku value>
```

### Operation PublicGetEntitlementOwnershipToken

```sh
$ build/install/cli/bin/cli platform publicGetEntitlementOwnershipToken \
    --namespace <namespace value> \
    --appIds <appIds value - optional> \
    --itemIds <itemIds value - optional> \
    --skus <skus value - optional>
```

### Operation SyncTwitchDropsEntitlement

```sh
$ build/install/cli/bin/cli platform syncTwitchDropsEntitlement \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetMyWallet

```sh
$ build/install/cli/bin/cli platform publicGetMyWallet \
    --currencyCode <currencyCode value> \
    --namespace <namespace value>
```

### Operation SyncEpicGameDLC

```sh
$ build/install/cli/bin/cli platform syncEpicGameDLC \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncOculusDLC

```sh
$ build/install/cli/bin/cli platform syncOculusDLC \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicSyncPsnDlcInventory

```sh
$ build/install/cli/bin/cli platform publicSyncPsnDlcInventory \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicSyncPsnDlcInventoryWithMultipleServiceLabels

```sh
$ build/install/cli/bin/cli platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncSteamDLC

```sh
$ build/install/cli/bin/cli platform syncSteamDLC \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncXboxDLC

```sh
$ build/install/cli/bin/cli platform syncXboxDLC \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicQueryUserEntitlements

```sh
$ build/install/cli/bin/cli platform publicQueryUserEntitlements \
    --namespace <namespace value> \
    --userId <userId value> \
    --appType <appType value - optional> \
    --entitlementClazz <entitlementClazz value - optional> \
    --entitlementName <entitlementName value - optional> \
    --features <features value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicGetUserAppEntitlementByAppId

```sh
$ build/install/cli/bin/cli platform publicGetUserAppEntitlementByAppId \
    --namespace <namespace value> \
    --userId <userId value> \
    --appId <appId value>
```

### Operation PublicQueryUserEntitlementsByAppType

```sh
$ build/install/cli/bin/cli platform publicQueryUserEntitlementsByAppType \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --appType <appType value>
```

### Operation PublicGetUserEntitlementsByIds

```sh
$ build/install/cli/bin/cli platform publicGetUserEntitlementsByIds \
    --namespace <namespace value> \
    --userId <userId value> \
    --availablePlatformOnly <availablePlatformOnly value - optional> \
    --ids <ids value - optional>
```

### Operation PublicUserEntitlementHistory

```sh
$ build/install/cli/bin/cli platform publicUserEntitlementHistory \
    --namespace <namespace value> \
    --userId <userId value> \
    --endDate <endDate value - optional> \
    --entitlementClazz <entitlementClazz value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startDate <startDate value - optional>
```

### Operation PublicExistsAnyUserActiveEntitlement

```sh
$ build/install/cli/bin/cli platform publicExistsAnyUserActiveEntitlement \
    --namespace <namespace value> \
    --userId <userId value> \
    --appIds <appIds value - optional> \
    --itemIds <itemIds value - optional> \
    --skus <skus value - optional>
```

### Operation PublicGetUserAppEntitlementOwnershipByAppId

```sh
$ build/install/cli/bin/cli platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace <namespace value> \
    --userId <userId value> \
    --appId <appId value>
```

### Operation PublicGetUserEntitlementOwnershipByItemId

```sh
$ build/install/cli/bin/cli platform publicGetUserEntitlementOwnershipByItemId \
    --namespace <namespace value> \
    --userId <userId value> \
    --entitlementClazz <entitlementClazz value - optional> \
    --itemId <itemId value>
```

### Operation PublicGetUserEntitlementOwnershipByItemIds

```sh
$ build/install/cli/bin/cli platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace <namespace value> \
    --userId <userId value> \
    --ids <ids value - optional>
```

### Operation PublicGetUserEntitlementOwnershipBySku

```sh
$ build/install/cli/bin/cli platform publicGetUserEntitlementOwnershipBySku \
    --namespace <namespace value> \
    --userId <userId value> \
    --entitlementClazz <entitlementClazz value - optional> \
    --sku <sku value>
```

### Operation PublicGetUserEntitlement

```sh
$ build/install/cli/bin/cli platform publicGetUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicConsumeUserEntitlement

```sh
$ build/install/cli/bin/cli platform publicConsumeUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicSellUserEntitlement

```sh
$ build/install/cli/bin/cli platform publicSellUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicSplitUserEntitlement

```sh
$ build/install/cli/bin/cli platform publicSplitUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicTransferUserEntitlement

```sh
$ build/install/cli/bin/cli platform publicTransferUserEntitlement \
    --entitlementId <entitlementId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicRedeemCode

```sh
$ build/install/cli/bin/cli platform publicRedeemCode \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicFulfillAppleIAPItem

```sh
$ build/install/cli/bin/cli platform publicFulfillAppleIAPItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncEpicGamesInventory

```sh
$ build/install/cli/bin/cli platform syncEpicGamesInventory \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicFulfillGoogleIAPItem

```sh
$ build/install/cli/bin/cli platform publicFulfillGoogleIAPItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncOculusConsumableEntitlements

```sh
$ build/install/cli/bin/cli platform syncOculusConsumableEntitlements \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicReconcilePlayStationStore

```sh
$ build/install/cli/bin/cli platform publicReconcilePlayStationStore \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicReconcilePlayStationStoreWithMultipleServiceLabels

```sh
$ build/install/cli/bin/cli platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncSteamInventory

```sh
$ build/install/cli/bin/cli platform syncSteamInventory \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncSteamAbnormalTransaction

```sh
$ build/install/cli/bin/cli platform syncSteamAbnormalTransaction \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation SyncSteamIAPByTransaction

```sh
$ build/install/cli/bin/cli platform syncSteamIAPByTransaction \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicQueryUserThirdPartySubscription

```sh
$ build/install/cli/bin/cli platform publicQueryUserThirdPartySubscription \
    --namespace <namespace value> \
    --platform <platform value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --groupId <groupId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --productId <productId value - optional>
```

### Operation SyncTwitchDropsEntitlement1

```sh
$ build/install/cli/bin/cli platform syncTwitchDropsEntitlement1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation SyncXboxInventory

```sh
$ build/install/cli/bin/cli platform syncXboxInventory \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicQueryUserOrders

```sh
$ build/install/cli/bin/cli platform publicQueryUserOrders \
    --namespace <namespace value> \
    --userId <userId value> \
    --discounted <discounted value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --status <status value - optional>
```

### Operation PublicCreateUserOrder

```sh
$ build/install/cli/bin/cli platform publicCreateUserOrder \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicPreviewOrderPrice

```sh
$ build/install/cli/bin/cli platform publicPreviewOrderPrice \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetUserOrder

```sh
$ build/install/cli/bin/cli platform publicGetUserOrder \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation PublicCancelUserOrder

```sh
$ build/install/cli/bin/cli platform publicCancelUserOrder \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation PublicGetUserOrderHistories

```sh
$ build/install/cli/bin/cli platform publicGetUserOrderHistories \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation PublicDownloadUserOrderReceipt

```sh
$ build/install/cli/bin/cli platform publicDownloadUserOrderReceipt \
    --namespace <namespace value> \
    --orderNo <orderNo value> \
    --userId <userId value>
```

### Operation PublicGetPaymentAccounts

```sh
$ build/install/cli/bin/cli platform publicGetPaymentAccounts \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicDeletePaymentAccount

```sh
$ build/install/cli/bin/cli platform publicDeletePaymentAccount \
    --id <id value> \
    --namespace <namespace value> \
    --type <type value> \
    --userId <userId value>
```

### Operation PublicListActiveSections

```sh
$ build/install/cli/bin/cli platform publicListActiveSections \
    --namespace <namespace value> \
    --userId <userId value> \
    --autoCalcEstimatedPrice <autoCalcEstimatedPrice value - optional> \
    --language <language value - optional> \
    --region <region value - optional> \
    --storeId <storeId value - optional> \
    --viewId <viewId value - optional>
```

### Operation PublicQueryUserSubscriptions

```sh
$ build/install/cli/bin/cli platform publicQueryUserSubscriptions \
    --namespace <namespace value> \
    --userId <userId value> \
    --chargeStatus <chargeStatus value - optional> \
    --itemId <itemId value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sku <sku value - optional> \
    --status <status value - optional> \
    --subscribedBy <subscribedBy value - optional>
```

### Operation PublicSubscribeSubscription

```sh
$ build/install/cli/bin/cli platform publicSubscribeSubscription \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicCheckUserSubscriptionSubscribableByItemId

```sh
$ build/install/cli/bin/cli platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace <namespace value> \
    --userId <userId value> \
    --itemId <itemId value>
```

### Operation PublicGetUserSubscription

```sh
$ build/install/cli/bin/cli platform publicGetUserSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value>
```

### Operation PublicChangeSubscriptionBillingAccount

```sh
$ build/install/cli/bin/cli platform publicChangeSubscriptionBillingAccount \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value>
```

### Operation PublicCancelSubscription

```sh
$ build/install/cli/bin/cli platform publicCancelSubscription \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetUserSubscriptionBillingHistories

```sh
$ build/install/cli/bin/cli platform publicGetUserSubscriptionBillingHistories \
    --namespace <namespace value> \
    --subscriptionId <subscriptionId value> \
    --userId <userId value> \
    --excludeFree <excludeFree value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicListViews

```sh
$ build/install/cli/bin/cli platform publicListViews \
    --namespace <namespace value> \
    --userId <userId value> \
    --language <language value - optional> \
    --storeId <storeId value - optional>
```

### Operation PublicGetWallet

```sh
$ build/install/cli/bin/cli platform publicGetWallet \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicListUserWalletTransactions

```sh
$ build/install/cli/bin/cli platform publicListUserWalletTransactions \
    --currencyCode <currencyCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicGetMyDLCContent

```sh
$ build/install/cli/bin/cli platform publicGetMyDLCContent \
    --includeAllNamespaces <includeAllNamespaces value - optional> \
    --type <type value>
```

### Operation QueryFulfillments

```sh
$ build/install/cli/bin/cli platform queryFulfillments \
    --namespace <namespace value> \
    --endTime <endTime value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startTime <startTime value - optional> \
    --state <state value - optional> \
    --transactionId <transactionId value - optional> \
    --userId <userId value - optional>
```

### Operation QueryItemsV2

```sh
$ build/install/cli/bin/cli platform queryItemsV2 \
    --namespace <namespace value> \
    --appType <appType value - optional> \
    --availableDate <availableDate value - optional> \
    --baseAppId <baseAppId value - optional> \
    --categoryPath <categoryPath value - optional> \
    --features <features value - optional> \
    --includeSubCategoryItem <includeSubCategoryItem value - optional> \
    --itemName <itemName value - optional> \
    --itemStatus <itemStatus value - optional> \
    --itemType <itemType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --region <region value - optional> \
    --sectionExclusive <sectionExclusive value - optional> \
    --sortBy <sortBy value - optional> \
    --storeId <storeId value - optional> \
    --tags <tags value - optional> \
    --targetNamespace <targetNamespace value - optional> \
    --withTotal <withTotal value - optional>
```

### Operation ImportStore1

```sh
$ build/install/cli/bin/cli platform importStore1 \
    --namespace <namespace value> \
    --storeId <storeId value - optional> \
    --strictMode <strictMode value - optional> \
    --file <file value - optional>
```

### Operation ExportStore1

```sh
$ build/install/cli/bin/cli platform exportStore1 \
    --namespace <namespace value> \
    --storeId <storeId value> \
    --body <json string for request body>
```

### Operation FulfillRewardsV2

```sh
$ build/install/cli/bin/cli platform fulfillRewardsV2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation V2PublicFulfillAppleIAPItem

```sh
$ build/install/cli/bin/cli platform v2PublicFulfillAppleIAPItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation FulfillItemsV3

```sh
$ build/install/cli/bin/cli platform fulfillItemsV3 \
    --namespace <namespace value> \
    --transactionId <transactionId value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation RetryFulfillItemsV3

```sh
$ build/install/cli/bin/cli platform retryFulfillItemsV3 \
    --namespace <namespace value> \
    --transactionId <transactionId value> \
    --userId <userId value>
```

### Operation RevokeItemsV3

```sh
$ build/install/cli/bin/cli platform revokeItemsV3 \
    --namespace <namespace value> \
    --transactionId <transactionId value> \
    --userId <userId value>
```


#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..338"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListFulfillmentScripts
./ng net.accelbyte.sdk.cli.Main platform listFulfillmentScripts \
    > test.out 2>&1
eval_tap $? 2 'ListFulfillmentScripts' test.out

#- 3 TestFulfillmentScriptEval
./ng net.accelbyte.sdk.cli.Main platform testFulfillmentScriptEval \
    --body '{"context": {"item": {"appId": "FtBxyZcD", "appType": "SOFTWARE", "baseAppId": "pGlsQuJu", "boothName": "8vMf0IsJ", "boundItemIds": ["kTrd8IDc"], "categoryPath": "V2zXnTKj", "clazz": "XY1bPqam", "createdAt": "1975-08-05T00:00:00Z", "description": "xx9Cs18E", "displayOrder": 100, "entitlementType": "CONSUMABLE", "ext": {"kItqRzHU": {}}, "features": ["1oh570KQ"], "images": [{"as": "BVaewc72", "caption": "krSha68n", "height": 100, "imageUrl": "nozp1C2K", "smallImageUrl": "mIQTuBdN", "width": 61}], "itemId": "UsxFb8CJ", "itemIds": ["17M7DJZa"], "itemQty": {"MSxECbZb": 49}, "itemType": "BUNDLE", "language": "yoarORoe", "listable": false, "localExt": {"8Rh3kgs9": {}}, "longDescription": "qqJbnQso", "maxCount": 54, "maxCountPerUser": 12, "name": "iVpP8Cm3", "namespace": "yvASUoxd", "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 63, "fixedTrialCycles": 32, "graceDays": 24}, "region": "AGTJ8IEd", "regionData": [{"currencyCode": "agEtp4w2", "currencyNamespace": "9KOu9c19", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-09-24T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-11-25T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-10-30T00:00:00Z", "price": 61, "purchaseAt": "1989-10-31T00:00:00Z", "trialPrice": 11}], "seasonType": "PASS", "sku": "iX7jpkVZ", "stackable": false, "status": "ACTIVE", "tags": ["QYEmqGod"], "targetCurrencyCode": "OEGt9gPO", "targetItemId": "j0c6i0Jk", "targetNamespace": "vIas73uc", "thumbnailUrl": "YnFAJ3DK", "title": "5T4Eogg0", "updatedAt": "1996-04-22T00:00:00Z", "useCount": 23}, "namespace": "pv5bVAgt", "order": {"currency": {"currencyCode": "sDhUTDUs", "currencySymbol": "cbQDjbTQ", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "Mz2PTRlk"}, "ext": {"yU89ZPOw": {}}, "free": true}, "source": "REDEEM_CODE"}, "script": "J42cwmzB", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'SMNcoAAO' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'jKNjfcYH' \
    --body '{"grantDays": "m093aYgB"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'U1sqjyK0' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'XH45PaRS' \
    --body '{"grantDays": "OFQBtu23"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --name 'EZ8hRVX7' \
    --offset '74' \
    --tag 'GOvDdYiQ' \
    > test.out 2>&1
eval_tap $? 8 'QueryCampaigns' test.out

#- 9 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "S9i7mV1C", "items": [{"extraSubscriptionDays": 30, "itemId": "jG9gpxL6", "itemName": "ycTQdvln", "quantity": 74}], "maxRedeemCountPerCampaignPerUser": 52, "maxRedeemCountPerCode": 41, "maxRedeemCountPerCodePerUser": 89, "maxSaleCount": 85, "name": "WEXL6LFE", "redeemEnd": "1997-09-23T00:00:00Z", "redeemStart": "1978-04-10T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["HtWvbNYq"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateCampaign' test.out

#- 10 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'UqslArFP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetCampaign' test.out

#- 11 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'iHUIvaCv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8kU9dBBp", "items": [{"extraSubscriptionDays": 6, "itemId": "sJLhsVyE", "itemName": "xrkxoot0", "quantity": 54}], "maxRedeemCountPerCampaignPerUser": 97, "maxRedeemCountPerCode": 80, "maxRedeemCountPerCodePerUser": 10, "maxSaleCount": 8, "name": "rcZdpMci", "redeemEnd": "1998-08-18T00:00:00Z", "redeemStart": "1980-12-19T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["xaI3uzLt"]}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateCampaign' test.out

#- 12 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'eMbFAlt4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCampaignDynamic' test.out

#- 13 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hr7HmOYi' \
    > test.out 2>&1
eval_tap $? 13 'GetRootCategories' test.out

#- 14 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BA5ltAOX' \
    --body '{"categoryPath": "mlG6eh1d", "localizationDisplayNames": {"TdoTFpBI": "cuC1dQY9"}}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCategory' test.out

#- 15 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '3OJnJ6Te' \
    > test.out 2>&1
eval_tap $? 15 'ListCategoriesBasic' test.out

#- 16 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '9vD8ldz7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Hu8AD79k' \
    > test.out 2>&1
eval_tap $? 16 'GetCategory' test.out

#- 17 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'dWunvizU' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0q1pHyhh' \
    --body '{"localizationDisplayNames": {"ERoGgdry": "sMizBGSR"}}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCategory' test.out

#- 18 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'dP2l7DNS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Z8Aq0XiP' \
    > test.out 2>&1
eval_tap $? 18 'DeleteCategory' test.out

#- 19 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'LQXSe07Z' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ddOGTMlJ' \
    > test.out 2>&1
eval_tap $? 19 'GetChildCategories' test.out

#- 20 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'jBwj9HJH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QKseEdSX' \
    > test.out 2>&1
eval_tap $? 20 'GetDescendantCategories' test.out

#- 21 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'RDSvguau' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '44' \
    --code '1xT7eMwS' \
    --limit '22' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 21 'QueryCodes' test.out

#- 22 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'LH0NnTJ2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 41}' \
    > test.out 2>&1
eval_tap $? 22 'CreateCodes' test.out

#- 23 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'lNzBvwJa' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '84' \
    > test.out 2>&1
eval_tap $? 23 'Download' test.out

#- 24 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'a547Jllv' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '52' \
    > test.out 2>&1
eval_tap $? 24 'BulkDisableCodes' test.out

#- 25 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '8RWSpabU' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '39' \
    > test.out 2>&1
eval_tap $? 25 'BulkEnableCodes' test.out

#- 26 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '7xk6QxyW' \
    --namespace "$AB_NAMESPACE" \
    --code 'hfqoWfJw' \
    --limit '28' \
    --offset '28' \
    --userId 'WUqvPCZ2' \
    > test.out 2>&1
eval_tap $? 26 'QueryRedeemHistory' test.out

#- 27 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'HzT7NXmW' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 27 'GetCode' test.out

#- 28 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'DlXsuNId' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DisableCode' test.out

#- 29 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'QJR5lsNO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'EnableCode' test.out

#- 30 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 30 'ListCurrencies' test.out

#- 31 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "vkfwaSbn", "currencySymbol": "suLCgTox", "currencyType": "VIRTUAL", "decimals": 94, "localizationDescriptions": {"TekJgvg6": "h5HIpH0D"}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateCurrency' test.out

#- 32 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'viplEk4v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"j3LDp4yq": "Dt8QUZDp"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCurrency' test.out

#- 33 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'xlHasinG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteCurrency' test.out

#- 34 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'cjrkmRMt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetCurrencyConfig' test.out

#- 35 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'tgjDSaIV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'GetCurrencySummary' test.out

#- 36 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetDLCItemConfig' test.out

#- 37 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "Bmft3Udg", "rewards": [{"currency": {"currencyCode": "7p9PGmY2", "namespace": "H5kX4Msi"}, "item": {"itemId": "sSX28nAR", "itemSku": "xWRpv5ou", "itemType": "5xtvd28O"}, "quantity": 93, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateDLCItemConfig' test.out

#- 38 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteDLCItemConfig' test.out

#- 39 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetPlatformDLCConfig' test.out

#- 40 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"t8UJC5fl": "Nyj6HsTt"}}]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePlatformDLCConfig' test.out

#- 41 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'DeletePlatformDLCConfig' test.out

#- 42 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'CODE' \
    --entitlementName 'naaS9lqy' \
    --itemId 'ygPcfkJI' \
    --limit '47' \
    --offset '11' \
    --userId 'QZza8kNV' \
    > test.out 2>&1
eval_tap $? 42 'QueryEntitlements' test.out

#- 43 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'bDxVMq7H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetEntitlement' test.out

#- 44 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '21' \
    --status 'SUCCESS' \
    --userId '89xAc3YV' \
    > test.out 2>&1
eval_tap $? 44 'QueryFulfillmentHistories' test.out

#- 45 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetAppleIAPConfig' test.out

#- 46 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "faENtrl0", "password": "pTKZTXqz"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateAppleIAPConfig' test.out

#- 47 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAppleIAPConfig' test.out

#- 48 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetEpicGamesIAPConfig' test.out

#- 49 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "HuBMYQSA"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateEpicGamesIAPConfig' test.out

#- 50 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteEpicGamesIAPConfig' test.out

#- 51 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetGoogleIAPConfig' test.out

#- 52 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "2jz1ZOpd", "serviceAccountId": "OjSyMddB"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGoogleIAPConfig' test.out

#- 53 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'DeleteGoogleIAPConfig' test.out

#- 54 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGoogleP12File' test.out

#- 55 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetIAPItemConfig' test.out

#- 56 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "41JuMf7R", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"BHRj8IiR": "imRllHT6"}}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateIAPItemConfig' test.out

#- 57 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteIAPItemConfig' test.out

#- 58 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlayStationIAPConfig' test.out

#- 59 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "Dc40vFFA"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlaystationIAPConfig' test.out

#- 60 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlaystationIAPConfig' test.out

#- 61 GetStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetStadiaIAPConfig' test.out

#- 62 DeleteStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteStadiaIAPConfig' test.out

#- 63 UpdateStadiaJsonConfigFile
./ng net.accelbyte.sdk.cli.Main platform updateStadiaJsonConfigFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 63 'UpdateStadiaJsonConfigFile' test.out

#- 64 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetSteamIAPConfig' test.out

#- 65 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "6gpU7EW3", "publisherAuthenticationKey": "x1dCpm55"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateSteamIAPConfig' test.out

#- 66 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteSteamIAPConfig' test.out

#- 67 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetTwitchIAPConfig' test.out

#- 68 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "gOeqQIqc", "clientSecret": "JVKmBM1J", "organizationId": "1IbuTrrk"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateTwitchIAPConfig' test.out

#- 69 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteTwitchIAPConfig' test.out

#- 70 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetXblIAPConfig' test.out

#- 71 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "bmuT1whO"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateXblIAPConfig' test.out

#- 72 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteXblAPConfig' test.out

#- 73 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'qmEnDXIW' \
    > test.out 2>&1
eval_tap $? 73 'UpdateXblBPCertFile' test.out

#- 74 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rBPlSay4' \
    --body '{"categoryPath": "6mv71BAZ", "targetItemId": "AOjtFJ2v", "targetNamespace": "mTj7tT7T"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZHWDdCkI' \
    --body '{"appId": "sZoArWwP", "appType": "DEMO", "baseAppId": "yFAdAtYc", "boothName": "iLIgRwFR", "categoryPath": "r0gwB9tz", "clazz": "3vp99XVl", "displayOrder": 94, "entitlementType": "DURABLE", "ext": {"K3tE6n0s": {}}, "features": ["mip1tw3L"], "images": [{"as": "7cUd9pqt", "caption": "v6JfPZwc", "height": 57, "imageUrl": "VOXcVa80", "smallImageUrl": "TmCwtD2l", "width": 52}], "itemIds": ["H01o6Ndc"], "itemQty": {"BIgzrDyW": 31}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"YGmmBawM": {"description": "yoKyNpdA", "localExt": {"asm8xwUf": {}}, "longDescription": "zOlQiZY4", "title": "NbOQXJ7u"}}, "maxCount": 81, "maxCountPerUser": 90, "name": "zNMvuq2t", "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 98, "fixedTrialCycles": 68, "graceDays": 19}, "regionData": {"iK4DEUJR": [{"currencyCode": "VK3l9Eb0", "currencyNamespace": "R1XRb0RH", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1997-05-23T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1973-11-22T00:00:00Z", "discountedPrice": 22, "expireAt": "1977-02-22T00:00:00Z", "price": 34, "purchaseAt": "1972-12-27T00:00:00Z", "trialPrice": 99}]}, "seasonType": "TIER", "sku": "zaPBtkZM", "stackable": false, "status": "ACTIVE", "tags": ["4wcyhloV"], "targetCurrencyCode": "S3rYp8Qt", "targetNamespace": "cEmCEVc7", "thumbnailUrl": "5UfeypWj", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'NhzCL5sW' \
    --appId 'S2qwO763' \
    > test.out 2>&1
eval_tap $? 76 'GetItemByAppId' test.out

#- 77 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'EklkzLm8' \
    --baseAppId '8LpLuYRO' \
    --categoryPath '3C55yHpw' \
    --features 'K2JaqenD' \
    --itemType 'COINS' \
    --limit '1' \
    --offset '78' \
    --region 'UplWiLjq' \
    --sortBy 'createdAt' \
    --storeId '6a0rW8Ef' \
    --tags 'kpaXtwYZ' \
    --targetNamespace 'JaQ4WbwN' \
    > test.out 2>&1
eval_tap $? 77 'QueryItems' test.out

#- 78 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'msFYetjE' \
    > test.out 2>&1
eval_tap $? 78 'ListBasicItemsByFeatures' test.out

#- 79 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'urH8eloJ' \
    --sku 'zNKtRUaT' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'z1ETdsmw' \
    --populateBundle  \
    --region 'zjkkn9oi' \
    --storeId 'Ql05g7cO' \
    --sku '3ZMb6Ojl' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'o6DMNpP2' \
    --sku 'qMrTQ1Up' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'jfU6wJhy' \
    --storeId '1jOVkkUl' \
    > test.out 2>&1
eval_tap $? 82 'GetBulkItemIdBySkus' test.out

#- 83 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'S79527EZ' \
    --region '25Ia8uCe' \
    --storeId 'ZFlLtEVp' \
    --itemIds 'DAEbA82j' \
    > test.out 2>&1
eval_tap $? 83 'BulkGetLocaleItems' test.out

#- 84 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '49' \
    --offset '23' \
    --storeId 'q0pDE5xR' \
    --keyword 'wh5b45eb' \
    --language 'pcM7ScSs' \
    > test.out 2>&1
eval_tap $? 84 'SearchItems' test.out

#- 85 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '92' \
    --offset '80' \
    --sortBy 'createdAt' \
    --storeId 'AwIp9rRt' \
    > test.out 2>&1
eval_tap $? 85 'QueryUncategorizedItems' test.out

#- 86 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'n1PcCxdb' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'umeYgOdE' \
    > test.out 2>&1
eval_tap $? 86 'GetItem' test.out

#- 87 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'BWRQiW3K' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FfU8icH4' \
    --body '{"appId": "081gRB1G", "appType": "SOFTWARE", "baseAppId": "LfLg4RYu", "boothName": "EbgUDEcJ", "categoryPath": "yIvsPwOr", "clazz": "0BmV5iFv", "displayOrder": 10, "entitlementType": "DURABLE", "ext": {"FjTSmIEq": {}}, "features": ["oLyLeUGm"], "images": [{"as": "omGX9sXT", "caption": "Z0v8pqLf", "height": 4, "imageUrl": "5SwGnReU", "smallImageUrl": "ULDX4QUI", "width": 3}], "itemIds": ["b5nh68Zn"], "itemQty": {"yUtRvW9h": 78}, "itemType": "SEASON", "listable": true, "localizations": {"TtFrOmjk": {"description": "FrFVA8t0", "localExt": {"xF34Xpt6": {}}, "longDescription": "ZlTTic0k", "title": "r2a0nI2o"}}, "maxCount": 28, "maxCountPerUser": 92, "name": "HCJK5sp0", "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 43, "fixedTrialCycles": 69, "graceDays": 33}, "regionData": {"3aHVYIle": [{"currencyCode": "wLRuHY83", "currencyNamespace": "bGj0HTee", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1972-12-17T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1972-05-12T00:00:00Z", "discountedPrice": 5, "expireAt": "1980-08-26T00:00:00Z", "price": 30, "purchaseAt": "1983-02-21T00:00:00Z", "trialPrice": 100}]}, "seasonType": "PASS", "sku": "x476ED4M", "stackable": true, "status": "INACTIVE", "tags": ["hWIwHWTg"], "targetCurrencyCode": "zJFRYw6t", "targetNamespace": "1IKZLO6V", "thumbnailUrl": "4Ode46Qm", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateItem' test.out

#- 88 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'idgdpP7R' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TC587lmU' \
    > test.out 2>&1
eval_tap $? 88 'DeleteItem' test.out

#- 89 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'mBziPZBn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 31, "orderNo": "Ofkllxfq"}' \
    > test.out 2>&1
eval_tap $? 89 'AcquireItem' test.out

#- 90 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '0NsrSjw5' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Hog0blM1' \
    > test.out 2>&1
eval_tap $? 90 'GetApp' test.out

#- 91 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'd5MStYGc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zLINlEC0' \
    --body '{"carousel": [{"alt": "OEsE3yzI", "previewUrl": "sUP0Njlu", "thumbnailUrl": "OrGZTzsL", "type": "video", "url": "jfs9nIkc", "videoSource": "generic"}], "developer": "UEanjKHb", "forumUrl": "Xfk1zxdz", "genres": ["MassivelyMultiplayer"], "localizations": {"g0UXcRyH": {"announcement": "i3u8BzVW", "slogan": "u1tOmhUt"}}, "platformRequirements": {"CgcpvGrE": [{"additionals": "bcZUDExH", "directXVersion": "1tayOGXI", "diskSpace": "HzMRjMCt", "graphics": "OJsEijlr", "label": "bpyyEcQx", "osVersion": "VgJIjMZq", "processor": "cWfMl6dq", "ram": "rpD4tnc3", "soundCard": "ZRB3Ikdt"}]}, "platforms": ["Android"], "players": ["MMO"], "primaryGenre": "Simulation", "publisher": "EomwenJv", "releaseDate": "1992-02-18T00:00:00Z", "websiteUrl": "rtQSv6Ec"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateApp' test.out

#- 92 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'ALcMIPms' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5bT51M4y' \
    > test.out 2>&1
eval_tap $? 92 'DisableItem' test.out

#- 93 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'ko8S0EnG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetItemDynamicData' test.out

#- 94 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'LvGvfuSy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CTyjj4mC' \
    > test.out 2>&1
eval_tap $? 94 'EnableItem' test.out

#- 95 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'aiuMGKOF' \
    --itemId '5GJJooSX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ul3YU35Q' \
    > test.out 2>&1
eval_tap $? 95 'FeatureItem' test.out

#- 96 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'HGpBABnO' \
    --itemId 'lxDznICQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VyqBg34W' \
    > test.out 2>&1
eval_tap $? 96 'DefeatureItem' test.out

#- 97 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'TtDkn0rt' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'n6t0Yx4z' \
    --populateBundle  \
    --region '12EaQ1rU' \
    --storeId 'QYCNTiDX' \
    > test.out 2>&1
eval_tap $? 97 'GetLocaleItem' test.out

#- 98 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '4jE3M2Is' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "THu8QwNy"}' \
    > test.out 2>&1
eval_tap $? 98 'ReturnItem' test.out

#- 99 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'lXfIWd0m' \
    --offset '4' \
    --tag 'q5T4SUc7' \
    > test.out 2>&1
eval_tap $? 99 'QueryKeyGroups' test.out

#- 100 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "cWfCKK6D", "name": "ij1gFcen", "status": "INACTIVE", "tags": ["MySPfhxB"]}' \
    > test.out 2>&1
eval_tap $? 100 'CreateKeyGroup' test.out

#- 101 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'enDiTiAq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetKeyGroup' test.out

#- 102 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'FYmFKjaE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Lmmll6oe", "name": "xId1OKGU", "status": "INACTIVE", "tags": ["nd7uVa7t"]}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateKeyGroup' test.out

#- 103 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '14yvSYSV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetKeyGroupDynamic' test.out

#- 104 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '52bHifCI' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '38' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 104 'ListKeys' test.out

#- 105 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'uu6Pkam6' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 105 'UploadKeys' test.out

#- 106 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'tFSYFt4Z' \
    --limit '47' \
    --offset '53' \
    --orderNos '2PzZFRkB' \
    --sortBy 'Nlg6hn5q' \
    --startTime 'usKyZAuV' \
    --status 'FULFILLED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 106 'QueryOrders' test.out

#- 107 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetOrderStatistics' test.out

#- 108 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UvqM0lV6' \
    > test.out 2>&1
eval_tap $? 108 'GetOrder' test.out

#- 109 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UZMlEbxH' \
    --body '{"description": "NgJRiQEx"}' \
    > test.out 2>&1
eval_tap $? 109 'RefundOrder' test.out

#- 110 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetPaymentCallbackConfig' test.out

#- 111 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "unjdAqnH", "privateKey": "Uz44tx4O"}' \
    > test.out 2>&1
eval_tap $? 111 'UpdatePaymentCallbackConfig' test.out

#- 112 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '6hamPwNo' \
    --externalId 'i071ezDK' \
    --limit '71' \
    --notificationSource 'XSOLLA' \
    --notificationType 'IGe1IMUC' \
    --offset '74' \
    --paymentOrderNo 'cN0DsaD5' \
    --startDate 'FyBsFe9O' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 112 'QueryPaymentNotifications' test.out

#- 113 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'Yffmhyx6' \
    --limit '70' \
    --offset '82' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 113 'QueryPaymentOrders' test.out

#- 114 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "M4S3cB8m", "currencyNamespace": "17hEeLLg", "customParameters": {"oaYth6zc": {}}, "description": "f8eA45OM", "extOrderNo": "vObWejo9", "extUserId": "LfGeegJM", "itemType": "APP", "language": "grd_731", "metadata": {"dKvjFCFb": "SFlEWoMP"}, "notifyUrl": "dgK5zn62", "omitNotification": false, "platform": "hnFSpCTl", "price": 58, "recurringPaymentOrderNo": "NBOcygvv", "region": "2LAgfBGV", "returnUrl": "zanbKYsB", "sandbox": false, "sku": "qJ8VhYSi", "subscriptionId": "kJl2p9rB", "targetNamespace": "x8N5egap", "targetUserId": "qxDy4cLf", "title": "NjzzEZYA"}' \
    > test.out 2>&1
eval_tap $? 114 'CreatePaymentOrderByDedicated' test.out

#- 115 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '8jIkMJb7' \
    > test.out 2>&1
eval_tap $? 115 'ListExtOrderNoByExtTxId' test.out

#- 116 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cZ2bPsaL' \
    > test.out 2>&1
eval_tap $? 116 'GetPaymentOrder' test.out

#- 117 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LpEBVEMk' \
    --body '{"extTxId": "5AsKaF2P", "paymentMethod": "44lXkI3z", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 117 'ChargePaymentOrder' test.out

#- 118 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iRiC5IbP' \
    --body '{"description": "it71JWlY"}' \
    > test.out 2>&1
eval_tap $? 118 'RefundPaymentOrderByDedicated' test.out

#- 119 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Coi4nDfP' \
    --body '{"amount": 41, "currencyCode": "5V6QSYxE", "notifyType": "REFUND", "paymentProvider": "WXPAY", "salesTax": 95, "vat": 40}' \
    > test.out 2>&1
eval_tap $? 119 'SimulatePaymentOrderNotification' test.out

#- 120 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZYmgUeEP' \
    > test.out 2>&1
eval_tap $? 120 'GetPaymentOrderChargeStatus' test.out

#- 121 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 121 'GetPlatformWalletConfig' test.out

#- 122 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["System"]}' \
    > test.out 2>&1
eval_tap $? 122 'UpdatePlatformWalletConfig' test.out

#- 123 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 123 'ResetPlatformWalletConfig' test.out

#- 124 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "vk0Zthaj", "eventTopic": "0EBA4azR", "maxAwarded": 51, "maxAwardedPerUser": 7, "namespaceExpression": "56smobor", "rewardCode": "4p1PlgQB", "rewardConditions": [{"condition": "9EcNGOeB", "conditionName": "RY6G5ae0", "eventName": "7deDLaZ8", "rewardItems": [{"duration": 71, "itemId": "CvbeTfW0", "quantity": 14}]}], "userIdExpression": "gzrabLJx"}' \
    > test.out 2>&1
eval_tap $? 124 'CreateReward' test.out

#- 125 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'EwJrEBmQ' \
    --limit '14' \
    --offset '0' \
    --sortBy 'rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 125 'QueryRewards' test.out

#- 126 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'ExportRewards' test.out

#- 127 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 127 'ImportRewards' test.out

#- 128 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'OzlGu68U' \
    > test.out 2>&1
eval_tap $? 128 'GetReward' test.out

#- 129 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YyupjdDe' \
    --body '{"description": "tnoT0rfW", "eventTopic": "tVPwQfq6", "maxAwarded": 95, "maxAwardedPerUser": 13, "namespaceExpression": "bfPouNdm", "rewardCode": "P7fckVnu", "rewardConditions": [{"condition": "DGvYIb1p", "conditionName": "5tcR5z8Z", "eventName": "JLjSHcaR", "rewardItems": [{"duration": 99, "itemId": "4tZmwr0Q", "quantity": 25}]}], "userIdExpression": "OnsEg49e"}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateReward' test.out

#- 130 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Xp0xQkZ2' \
    > test.out 2>&1
eval_tap $? 130 'DeleteReward' test.out

#- 131 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'JjuwWWy0' \
    --body '{"payload": {"tU11PCeS": {}}}' \
    > test.out 2>&1
eval_tap $? 131 'CheckEventCondition' test.out

#- 132 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'ListStores' test.out

#- 133 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "rvejUKwV", "defaultRegion": "fF37Vr7m", "description": "kDzFBI1V", "supportedLanguages": ["whkVSKDl"], "supportedRegions": ["NFOUHBJs"], "title": "vTsqk9hg"}' \
    > test.out 2>&1
eval_tap $? 133 'CreateStore' test.out

#- 134 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '4hj6nUde' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 134 'ImportStore' test.out

#- 135 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetPublishedStore' test.out

#- 136 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'DeletePublishedStore' test.out

#- 137 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'GetPublishedStoreBackup' test.out

#- 138 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'RollbackPublishedStore' test.out

#- 139 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bW6UskbP' \
    > test.out 2>&1
eval_tap $? 139 'GetStore' test.out

#- 140 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kkZAk01f' \
    --body '{"defaultLanguage": "1KxCtWAD", "defaultRegion": "U2guN6U9", "description": "w13W1K9T", "supportedLanguages": ["ZQ4qRLEi"], "supportedRegions": ["5wowE36r"], "title": "fmM0CCs3"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateStore' test.out

#- 141 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '5TPUPLms' \
    > test.out 2>&1
eval_tap $? 141 'DeleteStore' test.out

#- 142 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y8WgwSx1' \
    --action 'DELETE' \
    --itemSku 'I5GH9bv9' \
    --itemType 'COINS' \
    --limit '66' \
    --offset '30' \
    --selected  \
    --sortBy 'updatedAt' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'jHpZO0E9' \
    --updatedAtStart 'iLgRPJK3' \
    > test.out 2>&1
eval_tap $? 142 'QueryChanges' test.out

#- 143 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nBae3GOg' \
    > test.out 2>&1
eval_tap $? 143 'PublishAll' test.out

#- 144 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bQrqra0P' \
    > test.out 2>&1
eval_tap $? 144 'PublishSelected' test.out

#- 145 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tkfvOpY2' \
    > test.out 2>&1
eval_tap $? 145 'SelectAllRecords' test.out

#- 146 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ramp5lnB' \
    --action 'CREATE' \
    --itemSku '6xmBkfMt' \
    --itemType 'SUBSCRIPTION' \
    --type 'CATEGORY' \
    --updatedAtEnd 'Fq0kPOkO' \
    --updatedAtStart 'Rm2XjlNE' \
    > test.out 2>&1
eval_tap $? 146 'GetStatistic' test.out

#- 147 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E5ecPzAm' \
    > test.out 2>&1
eval_tap $? 147 'UnselectAllRecords' test.out

#- 148 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'i0ySJHfP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'loP1XkYK' \
    > test.out 2>&1
eval_tap $? 148 'SelectRecord' test.out

#- 149 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '4MgIsDSF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MPyMhyw1' \
    > test.out 2>&1
eval_tap $? 149 'UnselectRecord' test.out

#- 150 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OLZPVwwx' \
    --targetStoreId 'H4BIDJuD' \
    > test.out 2>&1
eval_tap $? 150 'CloneStore' test.out

#- 151 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oShMMftl' \
    > test.out 2>&1
eval_tap $? 151 'ExportStore' test.out

#- 152 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '8N0VvChH' \
    --limit '51' \
    --offset '40' \
    --sku 'rmt7QWvE' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId '8BRuYWDT' \
    > test.out 2>&1
eval_tap $? 152 'QuerySubscriptions' test.out

#- 153 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tL6MTTRk' \
    > test.out 2>&1
eval_tap $? 153 'RecurringChargeSubscription' test.out

#- 154 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'Cbb9S5Q1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'GetTicketDynamic' test.out

#- 155 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'IVHGT88p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "rREBgYOW"}' \
    > test.out 2>&1
eval_tap $? 155 'DecreaseTicketSale' test.out

#- 156 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'dHJ9Jumo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetTicketBoothID' test.out

#- 157 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'htU13gf7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 91, "orderNo": "RigNZj5w"}' \
    > test.out 2>&1
eval_tap $? 157 'IncreaseTicketSale' test.out

#- 158 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '5y3HmK8Q' \
    --body '{"achievements": [{"id": "VOa62eQZ", "value": 38}], "steamUserId": "bLLcF671"}' \
    > test.out 2>&1
eval_tap $? 158 'UnlockSteamUserAchievement' test.out

#- 159 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLtv38He' \
    --body '{"achievements": [{"id": "cczopFme", "percentComplete": 87}], "serviceConfigId": "wpcJBZyi", "titleId": "3mLC4Kze", "xboxUserId": "kiSzeyol"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateXblUserAchievement' test.out

#- 160 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'nOQt0joV' \
    > test.out 2>&1
eval_tap $? 160 'AnonymizeCampaign' test.out

#- 161 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HgCytC6l' \
    > test.out 2>&1
eval_tap $? 161 'AnonymizeEntitlement' test.out

#- 162 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'RG98YxnH' \
    > test.out 2>&1
eval_tap $? 162 'AnonymizeFulfillment' test.out

#- 163 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRdoTKKe' \
    > test.out 2>&1
eval_tap $? 163 'AnonymizeIntegration' test.out

#- 164 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'uSjfZe9i' \
    > test.out 2>&1
eval_tap $? 164 'AnonymizeOrder' test.out

#- 165 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '1osghF1h' \
    > test.out 2>&1
eval_tap $? 165 'AnonymizePayment' test.out

#- 166 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'zi1Nl47s' \
    > test.out 2>&1
eval_tap $? 166 'AnonymizeSubscription' test.out

#- 167 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'yJ5ibzSH' \
    > test.out 2>&1
eval_tap $? 167 'AnonymizeWallet' test.out

#- 168 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZeCLIvWP' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'EqA61yTr' \
    --itemId 'MgsycTgm' \
    --limit '82' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 168 'QueryUserEntitlements' test.out

#- 169 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'c20EuO5d' \
    --body '[{"endDate": "1990-05-07T00:00:00Z", "grantedCode": "GDlSZPY0", "itemId": "7rEVSjzH", "itemNamespace": "jL6ZbXjG", "language": "sMP", "quantity": 30, "region": "8htaRLxt", "source": "PURCHASE", "startDate": "1986-03-20T00:00:00Z", "storeId": "ESTULat5"}]' \
    > test.out 2>&1
eval_tap $? 169 'GrantUserEntitlement' test.out

#- 170 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'F1Le7cR7' \
    --activeOnly  \
    --appId 'q6PWhZmm' \
    > test.out 2>&1
eval_tap $? 170 'GetUserAppEntitlementByAppId' test.out

#- 171 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kz41i1Tp' \
    --activeOnly  \
    --limit '63' \
    --offset '17' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 171 'QueryUserEntitlementsByAppType' test.out

#- 172 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHahViJv' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'YW0kdmlk' \
    > test.out 2>&1
eval_tap $? 172 'GetUserEntitlementByItemId' test.out

#- 173 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '2luqSOOA' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --sku 'oNbB98Pu' \
    > test.out 2>&1
eval_tap $? 173 'GetUserEntitlementBySku' test.out

#- 174 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SGykqFzP' \
    --appIds 'wSMXT53b' \
    --itemIds 'BuL38beO' \
    --skus 'YDVuHZQ9' \
    > test.out 2>&1
eval_tap $? 174 'ExistsAnyUserActiveEntitlement' test.out

#- 175 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'LYt6w23W' \
    --itemIds 'f8iEQo72' \
    > test.out 2>&1
eval_tap $? 175 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 176 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'sH0aRdcD' \
    --appId 'lDyGcsfI' \
    > test.out 2>&1
eval_tap $? 176 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 177 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'uI4Dv5lE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'pK1AyRlz' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementOwnershipByItemId' test.out

#- 178 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'srRXEFZi' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'QOHG6wVi' \
    > test.out 2>&1
eval_tap $? 178 'GetUserEntitlementOwnershipBySku' test.out

#- 179 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNratsvv' \
    --entitlementIds 'HLmIohfN' \
    > test.out 2>&1
eval_tap $? 179 'RevokeUserEntitlements' test.out

#- 180 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'ISLXMDWD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dm5FE4ll' \
    > test.out 2>&1
eval_tap $? 180 'GetUserEntitlement' test.out

#- 181 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'iQMnutJb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pEo4mUNH' \
    --body '{"endDate": "1986-06-02T00:00:00Z", "nullFieldList": ["dml2xNvi"], "startDate": "1994-12-27T00:00:00Z", "status": "ACTIVE", "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 181 'UpdateUserEntitlement' test.out

#- 182 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'c3Fm7Z54' \
    --namespace "$AB_NAMESPACE" \
    --userId '8uuKgoCB' \
    --body '{"useCount": 32}' \
    > test.out 2>&1
eval_tap $? 182 'ConsumeUserEntitlement' test.out

#- 183 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'S5uIdCbw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ceeq9ouE' \
    > test.out 2>&1
eval_tap $? 183 'DisableUserEntitlement' test.out

#- 184 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'dDtjOgsy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLkm2ZYe' \
    > test.out 2>&1
eval_tap $? 184 'EnableUserEntitlement' test.out

#- 185 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'w5H7Zm0g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nYyj6MXf' \
    > test.out 2>&1
eval_tap $? 185 'GetUserEntitlementHistories' test.out

#- 186 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '9G1ntyeb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'voeHenAA' \
    > test.out 2>&1
eval_tap $? 186 'RevokeUserEntitlement' test.out

#- 187 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LKt7EfxI' \
    --body '{"duration": 66, "endDate": "1999-04-21T00:00:00Z", "itemId": "UnP2S74u", "itemSku": "nXwg0JKq", "language": "VWW1rjK1", "order": {"currency": {"currencyCode": "epwkAvcs", "currencySymbol": "YvbgfBVP", "currencyType": "REAL", "decimals": 91, "namespace": "a8Yuq7TK"}, "ext": {"iNXmz7eM": {}}, "free": true}, "orderNo": "MD5TbaUx", "origin": "Steam", "quantity": 90, "region": "ng0xjtdB", "source": "OTHER", "startDate": "1975-05-28T00:00:00Z", "storeId": "3Kiykt2C"}' \
    > test.out 2>&1
eval_tap $? 187 'FulfillItem' test.out

#- 188 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'k2gOlSat' \
    --body '{"code": "ECZ2UgwQ", "language": "QdQy-bQIR", "region": "p3yxnsET"}' \
    > test.out 2>&1
eval_tap $? 188 'RedeemCode' test.out

#- 189 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'l1SvhQud' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "jIhXdxiS", "namespace": "oWpnnxgX"}, "item": {"itemId": "7BCPMqzQ", "itemSku": "IxibhpNY", "itemType": "sHtdB3Ik"}, "quantity": 19, "type": "ITEM"}], "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 189 'FulfillRewards' test.out

#- 190 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZqhJilrZ' \
    --endTime 'kSSKgP5r' \
    --limit '46' \
    --offset '56' \
    --productId 'R77G9d5C' \
    --startTime 'A1GORSbL' \
    --status 'FAILED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 190 'QueryUserIAPOrders' test.out

#- 191 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWDEupmd' \
    > test.out 2>&1
eval_tap $? 191 'QueryAllUserIAPOrders' test.out

#- 192 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQzPnNfB' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "wa_cFDh", "productId": "03otqmBu", "region": "S9V2pCZ2", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 192 'MockFulfillIAPItem' test.out

#- 193 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'k0lpJ4JL' \
    --itemId 'l01qi7L2' \
    --limit '29' \
    --offset '59' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 193 'QueryUserOrders' test.out

#- 194 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'VRUb39j2' \
    --body '{"currencyCode": "2P4Sp09c", "discountedPrice": 73, "ext": {"mjRUbZVB": {}}, "itemId": "VS7OK2Zr", "language": "dcsckMek", "platform": "Other", "price": 21, "quantity": 72, "region": "2eFaGLoS", "returnUrl": "mEEPbLyw", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 194 'AdminCreateUserOrder' test.out

#- 195 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yUie6fZg' \
    --itemId 'LllUPsO8' \
    > test.out 2>&1
eval_tap $? 195 'CountOfPurchasedItem' test.out

#- 196 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lg46Si70' \
    --userId '06vL2w4a' \
    > test.out 2>&1
eval_tap $? 196 'GetUserOrder' test.out

#- 197 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ajDAOx0i' \
    --userId 'JjYleakt' \
    --body '{"status": "DELETED", "statusReason": "v2WkljQu"}' \
    > test.out 2>&1
eval_tap $? 197 'UpdateUserOrderStatus' test.out

#- 198 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'D5mnJONq' \
    --userId 'HGq8mB7m' \
    > test.out 2>&1
eval_tap $? 198 'FulfillUserOrder' test.out

#- 199 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F2lMFcag' \
    --userId 'hFXJIJfl' \
    > test.out 2>&1
eval_tap $? 199 'GetUserOrderGrant' test.out

#- 200 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RHFcsIqC' \
    --userId 'y4xDifSS' \
    > test.out 2>&1
eval_tap $? 200 'GetUserOrderHistories' test.out

#- 201 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Q5On2ccE' \
    --userId 'cl3xeiO4' \
    --body '{"additionalData": {"cardSummary": "bwF5JOjG"}, "authorisedTime": "1978-09-15T00:00:00Z", "chargebackReversedTime": "1982-10-15T00:00:00Z", "chargebackTime": "1990-05-11T00:00:00Z", "chargedTime": "1990-01-19T00:00:00Z", "createdTime": "1973-06-03T00:00:00Z", "currency": {"currencyCode": "fLcpjFZM", "currencySymbol": "KCbp0pEb", "currencyType": "VIRTUAL", "decimals": 75, "namespace": "FpHxMYF8"}, "customParameters": {"36075xEp": {}}, "extOrderNo": "zdnYtpja", "extTxId": "5ig2isQZ", "extUserId": "ga6Vy76i", "issuedAt": "1983-11-27T00:00:00Z", "metadata": {"iQRjYa8f": "v5fIt22t"}, "namespace": "IZhjhgki", "nonceStr": "gW22zXMW", "paymentMethod": "XfbcM0GI", "paymentMethodFee": 53, "paymentOrderNo": "LIbFCQgB", "paymentProvider": "ADYEN", "paymentProviderFee": 75, "paymentStationUrl": "NT6iOQVY", "price": 46, "refundedTime": "1999-05-18T00:00:00Z", "salesTax": 97, "sandbox": false, "sku": "MsI1aYBi", "status": "CHARGED", "statusReason": "Sn3UDeKj", "subscriptionId": "97I4WYXL", "subtotalPrice": 33, "targetNamespace": "jN7ktOBT", "targetUserId": "raBxWRTV", "tax": 41, "totalPrice": 100, "totalTax": 60, "txEndTime": "1979-09-13T00:00:00Z", "type": "lKDwTKXB", "userId": "rXiQcd9I", "vat": 96}' \
    > test.out 2>&1
eval_tap $? 201 'ProcessUserOrderNotification' test.out

#- 202 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8kiCKeQJ' \
    --userId 'WZBvcq1E' \
    > test.out 2>&1
eval_tap $? 202 'DownloadUserOrderReceipt' test.out

#- 203 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvWBxYZJ' \
    --body '{"currencyCode": "h7B8gbnS", "currencyNamespace": "u9M2OxD2", "customParameters": {"udaeYpCX": {}}, "description": "YSMiy87C", "extOrderNo": "TqEQBg36", "extUserId": "my3sY2cl", "itemType": "INGAMEITEM", "language": "CAI", "metadata": {"OVF1zHwD": "TI0sJ1Q0"}, "notifyUrl": "kphMTggS", "omitNotification": false, "platform": "uAP7vU97", "price": 56, "recurringPaymentOrderNo": "zw2nbg8C", "region": "7Mvywhu6", "returnUrl": "MjOjuGzo", "sandbox": true, "sku": "z4tU0aSn", "subscriptionId": "98N8qOUA", "title": "0z92RaDe"}' \
    > test.out 2>&1
eval_tap $? 203 'CreateUserPaymentOrder' test.out

#- 204 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8ngT8LRQ' \
    --userId 'kMnG1LZy' \
    --body '{"description": "F2mdYY6Z"}' \
    > test.out 2>&1
eval_tap $? 204 'RefundUserPaymentOrder' test.out

#- 205 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'MfuTYTKs' \
    --body '{"code": "ue48qBEB", "orderNo": "NAV5BTe6"}' \
    > test.out 2>&1
eval_tap $? 205 'ApplyUserRedemption' test.out

#- 206 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ec1zA92U' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'LSGPmRBZ' \
    --limit '97' \
    --offset '41' \
    --sku 'nHW7MYvr' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 206 'QueryUserSubscriptions' test.out

#- 207 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'epc92HA9' \
    --excludeSystem  \
    --limit '8' \
    --offset '53' \
    --subscriptionId 'CdeyfUpg' \
    > test.out 2>&1
eval_tap $? 207 'GetUserSubscriptionActivities' test.out

#- 208 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPpf8nxK' \
    --body '{"grantDays": 71, "itemId": "3dnmtPwa", "language": "64Y4gPEK", "reason": "Mhhu9a6f", "region": "3xJNtUlK", "source": "LlIIAeHb"}' \
    > test.out 2>&1
eval_tap $? 208 'PlatformSubscribeSubscription' test.out

#- 209 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'm5M6LsY1' \
    --itemId 'VMuIEcRl' \
    > test.out 2>&1
eval_tap $? 209 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 210 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 's68M3MPM' \
    --userId 'RPBepyyM' \
    > test.out 2>&1
eval_tap $? 210 'GetUserSubscription' test.out

#- 211 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'z6zfR1pv' \
    --userId 'TYYtDOiE' \
    > test.out 2>&1
eval_tap $? 211 'DeleteUserSubscription' test.out

#- 212 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'i4RuEcHC' \
    --userId 'SGhpOZQF' \
    --force  \
    --body '{"immediate": false, "reason": "wOiuKGDF"}' \
    > test.out 2>&1
eval_tap $? 212 'CancelSubscription' test.out

#- 213 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gK49YuKn' \
    --userId 'Xks0m8AN' \
    --body '{"grantDays": 34, "reason": "cRal7ta3"}' \
    > test.out 2>&1
eval_tap $? 213 'GrantDaysToSubscription' test.out

#- 214 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fojA3h4M' \
    --userId 'MW3AJ5zl' \
    --excludeFree  \
    --limit '36' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 214 'GetUserSubscriptionBillingHistories' test.out

#- 215 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BwjvLYvm' \
    --userId 'g6avudQF' \
    --body '{"additionalData": {"cardSummary": "F1CPNY9u"}, "authorisedTime": "1998-01-25T00:00:00Z", "chargebackReversedTime": "1994-01-23T00:00:00Z", "chargebackTime": "1974-04-02T00:00:00Z", "chargedTime": "1991-11-18T00:00:00Z", "createdTime": "1978-08-16T00:00:00Z", "currency": {"currencyCode": "eK0kPKmB", "currencySymbol": "qVux3lXc", "currencyType": "VIRTUAL", "decimals": 0, "namespace": "ertAVCqs"}, "customParameters": {"8XT8xy3n": {}}, "extOrderNo": "J06KkseA", "extTxId": "0ARj9ric", "extUserId": "fayvnhi8", "issuedAt": "1990-08-23T00:00:00Z", "metadata": {"dY4WLHoa": "UkYnQp5e"}, "namespace": "gdmVE8Im", "nonceStr": "ivNtQxqW", "paymentMethod": "RKHohODo", "paymentMethodFee": 96, "paymentOrderNo": "Or98kjBU", "paymentProvider": "ADYEN", "paymentProviderFee": 37, "paymentStationUrl": "9jjz2Frg", "price": 16, "refundedTime": "1971-09-16T00:00:00Z", "salesTax": 35, "sandbox": false, "sku": "B7dIOVKI", "status": "REFUNDING", "statusReason": "SJJHo5W8", "subscriptionId": "tKH8ou9S", "subtotalPrice": 6, "targetNamespace": "bxSXcrEF", "targetUserId": "CwqeGNLd", "tax": 68, "totalPrice": 54, "totalTax": 87, "txEndTime": "1972-04-01T00:00:00Z", "type": "iFQVMKEz", "userId": "VUWlUWDs", "vat": 46}' \
    > test.out 2>&1
eval_tap $? 215 'ProcessUserSubscriptionNotification' test.out

#- 216 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '1EQU0oep' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EvcjaSgE' \
    --body '{"count": 14, "orderNo": "6jJnFxin"}' \
    > test.out 2>&1
eval_tap $? 216 'AcquireUserTicket' test.out

#- 217 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'IHJ1o7aq' \
    > test.out 2>&1
eval_tap $? 217 'QueryUserCurrencyWallets' test.out

#- 218 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '5Zznd5ea' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cobTsuRl' \
    --limit '15' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 218 'ListUserCurrencyTransactions' test.out

#- 219 CheckWallet
eval_tap 0 219 'CheckWallet # SKIP deprecated' test.out

#- 220 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'eQVFID3o' \
    --namespace "$AB_NAMESPACE" \
    --userId '8hJWVjKI' \
    --body '{"amount": 81, "expireAt": "1984-06-28T00:00:00Z", "origin": "Steam", "reason": "vAHhSGWU", "source": "PROMOTION"}' \
    > test.out 2>&1
eval_tap $? 220 'CreditUserWallet' test.out

#- 221 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'zq1Za3IB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C4vQFsUJ' \
    --body '{"amount": 83, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 221 'PayWithUserWallet' test.out

#- 222 GetUserWallet
eval_tap 0 222 'GetUserWallet # SKIP deprecated' test.out

#- 223 DebitUserWallet
eval_tap 0 223 'DebitUserWallet # SKIP deprecated' test.out

#- 224 DisableUserWallet
eval_tap 0 224 'DisableUserWallet # SKIP deprecated' test.out

#- 225 EnableUserWallet
eval_tap 0 225 'EnableUserWallet # SKIP deprecated' test.out

#- 226 ListUserWalletTransactions
eval_tap 0 226 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 227 QueryWallets
eval_tap 0 227 'QueryWallets # SKIP deprecated' test.out

#- 228 GetWallet
eval_tap 0 228 'GetWallet # SKIP deprecated' test.out

#- 229 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'iaJp1rt7' \
    --end 'OBgBCe6N' \
    --start '0eI65Mn5' \
    > test.out 2>&1
eval_tap $? 229 'SyncOrders' test.out

#- 230 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["tngEYXgP"], "apiKey": "VT5CqXDZ", "authoriseAsCapture": true, "blockedPaymentMethods": ["VMJyJeKF"], "clientKey": "O92YDtaZ", "dropInSettings": "vJoKS0Ox", "liveEndpointUrlPrefix": "yipZuO4N", "merchantAccount": "9S2YCgHa", "notificationHmacKey": "6XBcvGRY", "notificationPassword": "k5rUtWHC", "notificationUsername": "nhmzzppV", "returnUrl": "7tKNKYUQ", "settings": "VBXymWcN"}' \
    > test.out 2>&1
eval_tap $? 230 'TestAdyenConfig' test.out

#- 231 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "lHaFxYaG", "privateKey": "HUpmBFyO", "publicKey": "rFKtxGNA", "returnUrl": "i0fq4xCh"}' \
    > test.out 2>&1
eval_tap $? 231 'TestAliPayConfig' test.out

#- 232 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "PLd2lOop", "secretKey": "c7XoVpdd"}' \
    > test.out 2>&1
eval_tap $? 232 'TestCheckoutConfig' test.out

#- 233 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '6rCpyMrn' \
    > test.out 2>&1
eval_tap $? 233 'DebugMatchedPaymentMerchantConfig' test.out

#- 234 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "H9YHXh7K", "clientSecret": "nCVOKY2z", "returnUrl": "sBRGtd8Q", "webHookId": "Y2OLbijr"}' \
    > test.out 2>&1
eval_tap $? 234 'TestPayPalConfig' test.out

#- 235 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["vfr8hknj"], "publishableKey": "WUWdMUXH", "secretKey": "vw4pNlGL", "webhookSecret": "jdBxLM07"}' \
    > test.out 2>&1
eval_tap $? 235 'TestStripeConfig' test.out

#- 236 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "9pDAbTgm", "key": "sEYEq2Gk", "mchid": "YK1vYm9f", "returnUrl": "lXQ7CQoe"}' \
    > test.out 2>&1
eval_tap $? 236 'TestWxPayConfig' test.out

#- 237 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "mnQG0dH0", "flowCompletionUrl": "NVM9VEHT", "merchantId": 83, "projectId": 32, "projectSecretKey": "Dhkcu5vn"}' \
    > test.out 2>&1
eval_tap $? 237 'TestXsollaConfig' test.out

#- 238 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'z6GiNMbo' \
    > test.out 2>&1
eval_tap $? 238 'GetPaymentMerchantConfig' test.out

#- 239 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'BJHml0LJ' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["mpPi4mqh"], "apiKey": "ruiCZLGG", "authoriseAsCapture": false, "blockedPaymentMethods": ["HNTMapp5"], "clientKey": "SbonsUJK", "dropInSettings": "ADr60Ekd", "liveEndpointUrlPrefix": "FrpLsGt9", "merchantAccount": "yTXWUSCQ", "notificationHmacKey": "cMsHN7re", "notificationPassword": "I22ks7I1", "notificationUsername": "2tAZc8sx", "returnUrl": "xLx9XQeq", "settings": "NWLm8cNJ"}' \
    > test.out 2>&1
eval_tap $? 239 'UpdateAdyenConfig' test.out

#- 240 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'bYH5J4Wi' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 240 'TestAdyenConfigById' test.out

#- 241 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'JLv9NvHw' \
    --sandbox  \
    --validate  \
    --body '{"appId": "tw2Mjcy9", "privateKey": "ZL6Zs5Bu", "publicKey": "2XYopLWZ", "returnUrl": "eUKJJNft"}' \
    > test.out 2>&1
eval_tap $? 241 'UpdateAliPayConfig' test.out

#- 242 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'RpGgk1is' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 242 'TestAliPayConfigById' test.out

#- 243 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'eREzzRG6' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "z9wmuHdd", "secretKey": "yOdibI1L"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateCheckoutConfig' test.out

#- 244 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'VyqbdY8D' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 244 'TestCheckoutConfigById' test.out

#- 245 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'GZKAuoIK' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "z3Pp3zLW", "clientSecret": "UxMzMtSm", "returnUrl": "MmZP8nG0", "webHookId": "FoQP8q7a"}' \
    > test.out 2>&1
eval_tap $? 245 'UpdatePayPalConfig' test.out

#- 246 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'Ssb85gAh' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 246 'TestPayPalConfigById' test.out

#- 247 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '9RD3ZzN6' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["N1iJ8ltt"], "publishableKey": "9IRqCflg", "secretKey": "ln6r5f0s", "webhookSecret": "5H6lCf3Q"}' \
    > test.out 2>&1
eval_tap $? 247 'UpdateStripeConfig' test.out

#- 248 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'Ha11hLLC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 248 'TestStripeConfigById' test.out

#- 249 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'gw5av4LE' \
    --validate  \
    --body '{"appId": "xdabD8g2", "key": "cvHfMRup", "mchid": "DA5xbjs3", "returnUrl": "XRdHUJ0G"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateWxPayConfig' test.out

#- 250 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'CmflIXkg' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 250 'UpdateWxPayConfigCert' test.out

#- 251 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'J6zkTwoa' \
    > test.out 2>&1
eval_tap $? 251 'TestWxPayConfigById' test.out

#- 252 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'kq7sEejF' \
    --validate  \
    --body '{"apiKey": "Z1NtONXb", "flowCompletionUrl": "9w9hsQHs", "merchantId": 50, "projectId": 68, "projectSecretKey": "sfrlzKpQ"}' \
    > test.out 2>&1
eval_tap $? 252 'UpdateXsollaConfig' test.out

#- 253 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'dd58dZP5' \
    > test.out 2>&1
eval_tap $? 253 'TestXsollaConfigById' test.out

#- 254 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'RvrinNtv' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateXsollaUIConfig' test.out

#- 255 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '88' \
    --namespace "$AB_NAMESPACE" \
    --offset '21' \
    --region 'A68mIVYJ' \
    > test.out 2>&1
eval_tap $? 255 'QueryPaymentProviderConfig' test.out

#- 256 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "SVxBsLht", "region": "y3pecToX", "sandboxTaxJarApiToken": "A4M1oUFP", "specials": ["ALIPAY"], "taxJarApiToken": "go7Z6mwN", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 256 'CreatePaymentProviderConfig' test.out

#- 257 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 257 'GetAggregatePaymentProviders' test.out

#- 258 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Y69mM87j' \
    > test.out 2>&1
eval_tap $? 258 'DebugMatchedPaymentProviderConfig' test.out

#- 259 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 259 'GetSpecialPaymentProviders' test.out

#- 260 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'oJNOGB83' \
    --body '{"aggregate": "XSOLLA", "namespace": "6Hl5Poab", "region": "6lKoVqNB", "sandboxTaxJarApiToken": "UzIxOfgl", "specials": ["STRIPE"], "taxJarApiToken": "uS2q2DoW", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 260 'UpdatePaymentProviderConfig' test.out

#- 261 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'vFtKa2mO' \
    > test.out 2>&1
eval_tap $? 261 'DeletePaymentProviderConfig' test.out

#- 262 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 262 'GetPaymentTaxConfig' test.out

#- 263 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "AqOokV1p", "taxJarApiToken": "lxQ2YriT", "taxJarEnabled": false, "taxJarProductCodesMapping": {"ipD67jI2": "hiZkrtLn"}}' \
    > test.out 2>&1
eval_tap $? 263 'UpdatePaymentTaxConfig' test.out

#- 264 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'h2U1RQlM' \
    --end 'xkfNMPNt' \
    --start 'qv2TMz1b' \
    > test.out 2>&1
eval_tap $? 264 'SyncPaymentOrders' test.out

#- 265 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '7SnzkXOe' \
    --storeId 'k83Igm1w' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetRootCategories' test.out

#- 266 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'kSWsYvAs' \
    --storeId 'u18obUdc' \
    > test.out 2>&1
eval_tap $? 266 'DownloadCategories' test.out

#- 267 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '8mbvXcwc' \
    --namespace "$AB_NAMESPACE" \
    --language 'gMqOXMzi' \
    --storeId 'XrVdsEc3' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetCategory' test.out

#- 268 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'ClFP3mJw' \
    --namespace "$AB_NAMESPACE" \
    --language 'usCBTe4k' \
    --storeId 'LcuqL40N' \
    > test.out 2>&1
eval_tap $? 268 'PublicGetChildCategories' test.out

#- 269 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'YgekRavp' \
    --namespace "$AB_NAMESPACE" \
    --language 'aGTA9BTy' \
    --storeId 'CCyN4Fw9' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetDescendantCategories' test.out

#- 270 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 270 'PublicListCurrencies' test.out

#- 271 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '6mI2W3tj' \
    --region 'jCqPVyYs' \
    --storeId '01hEYzWw' \
    --appId '3qrcxM0D' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetItemByAppId' test.out

#- 272 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'XQBNMP7j' \
    --categoryPath '3xfPaoZa' \
    --features 'WFspkU5k' \
    --itemType 'COINS' \
    --language '6PlPqD4A' \
    --limit '12' \
    --offset '11' \
    --region 'asBfclBh' \
    --sortBy 'name:desc' \
    --storeId 'ZbLnmghK' \
    --tags 'wPyVIn3q' \
    > test.out 2>&1
eval_tap $? 272 'PublicQueryItems' test.out

#- 273 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'aHP7KNul' \
    --region 'yfrENVQk' \
    --storeId 'pcaWHf6T' \
    --sku '2xOOljn7' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetItemBySku' test.out

#- 274 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'c6c9efJI' \
    --region '02TZxrgL' \
    --storeId 'BFJEkphF' \
    --itemIds 'z0h6WpoV' \
    > test.out 2>&1
eval_tap $? 274 'PublicBulkGetItems' test.out

#- 275 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '95' \
    --region 'c2HBBmj6' \
    --storeId 'cEi02hXl' \
    --keyword '42ubCRfy' \
    --language '4GjKn5It' \
    > test.out 2>&1
eval_tap $? 275 'PublicSearchItems' test.out

#- 276 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'HXLDZqpR' \
    --namespace "$AB_NAMESPACE" \
    --language 'hqnR742G' \
    --region 'cbLuQOGM' \
    --storeId 'OEzmdjNh' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetApp' test.out

#- 277 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'T0S46kqy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 277 'PublicGetItemDynamicData' test.out

#- 278 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'fMBSaZc4' \
    --namespace "$AB_NAMESPACE" \
    --language 'SA16M8gQ' \
    --populateBundle  \
    --region 'CD7aBHWC' \
    --storeId 'YevNkfcQ' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetItem' test.out

#- 279 GetPaymentCustomization
eval_tap 0 279 'GetPaymentCustomization # SKIP deprecated' test.out

#- 280 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "vl4Oso7t", "paymentProvider": "WALLET", "returnUrl": "65zXCiTf", "ui": "jorLFqTm", "zipCode": "IUFUoonH"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetPaymentUrl' test.out

#- 281 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BI13SZFH' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetPaymentMethods' test.out

#- 282 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fm0F8vS2' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUnpaidPaymentOrder' test.out

#- 283 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BrZ3nq88' \
    --paymentProvider 'XSOLLA' \
    --zipCode '7zV0C8Fv' \
    --body '{"token": "VU3kRXBG"}' \
    > test.out 2>&1
eval_tap $? 283 'Pay' test.out

#- 284 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PXIdft1b' \
    > test.out 2>&1
eval_tap $? 284 'PublicCheckPaymentOrderPaidStatus' test.out

#- 285 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'ZHuhWyFP' \
    > test.out 2>&1
eval_tap $? 285 'GetPaymentPublicConfig' test.out

#- 286 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'HdXcyvZE' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetQRCode' test.out

#- 287 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'hYeUSy5U' \
    --foreinginvoice 'kc65naP1' \
    --invoiceId '1R8Xww9v' \
    --payload 'q9nMa2Bt' \
    --redirectResult 'gwyuf2fj' \
    --resultCode 'V30SLxi7' \
    --sessionId 'uyhaeFtc' \
    --status 'O9XNy63Q' \
    --token 'O9vW0ck7' \
    --type 'TEDE8LeE' \
    --userId 'QBeGPLiE' \
    --orderNo '6tHCr0GP' \
    --paymentOrderNo 'FvT0SAK9' \
    --paymentProvider 'WXPAY' \
    --returnUrl '5vCeBIJq' \
    > test.out 2>&1
eval_tap $? 287 'PublicNormalizePaymentReturnUrl' test.out

#- 288 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '0B9UcI6c' \
    --paymentOrderNo '5cre9eal' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 288 'GetPaymentTaxValue' test.out

#- 289 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'hcLncnjn' \
    > test.out 2>&1
eval_tap $? 289 'GetRewardByCode' test.out

#- 290 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'myU8FSxX' \
    --limit '6' \
    --offset '56' \
    --sortBy 'namespace:desc' \
    > test.out 2>&1
eval_tap $? 290 'QueryRewards1' test.out

#- 291 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'skoFqnow' \
    > test.out 2>&1
eval_tap $? 291 'GetReward1' test.out

#- 292 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'PublicListStores' test.out

#- 293 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'q9Laz1GL' \
    --itemIds 't5Mhf8Z7' \
    --skus 'ahmbVPm2' \
    > test.out 2>&1
eval_tap $? 293 'PublicExistsAnyMyActiveEntitlement' test.out

#- 294 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'g7xAFfRR' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 295 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'UjfWS9sf' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 296 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'IfHGe5bU' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 297 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'TSXOv12P' \
    --itemIds 'McRO6E2M' \
    --skus 'kre5q7Fv' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetEntitlementOwnershipToken' test.out

#- 298 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'aACp6he0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'PublicGetMyWallet' test.out

#- 299 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fzjkPNNS' \
    --body '{"serviceLabel": 54}' \
    > test.out 2>&1
eval_tap $? 299 'PublicSyncPsnDlcInventory' test.out

#- 300 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'fgF6inIR' \
    --body '{"appId": "sZ5hrqNz", "steamId": "VszGVP5P"}' \
    > test.out 2>&1
eval_tap $? 300 'SyncSteamDLC' test.out

#- 301 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '1iwhcf30' \
    --body '{"xstsToken": "C1KHRZHM"}' \
    > test.out 2>&1
eval_tap $? 301 'SyncXboxDLC' test.out

#- 302 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gy5vbfZv' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'ctEKOLxS' \
    --itemId 'Rxe0wmWB' \
    --limit '77' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 302 'PublicQueryUserEntitlements' test.out

#- 303 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NiWoobB6' \
    --appId 'o6alTQcP' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetUserAppEntitlementByAppId' test.out

#- 304 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '0EpE9wGN' \
    --limit '95' \
    --offset '44' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 304 'PublicQueryUserEntitlementsByAppType' test.out

#- 305 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'gfJJ2HIa' \
    --entitlementClazz 'CODE' \
    --itemId 'fzgRpTf9' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetUserEntitlementByItemId' test.out

#- 306 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lxF1JPBi' \
    --entitlementClazz 'MEDIA' \
    --sku 'XZtrGe8L' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetUserEntitlementBySku' test.out

#- 307 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'yOH24nne' \
    --appIds 'ZHFeRld0' \
    --itemIds 'bGA7JxWY' \
    --skus 'zaEaimvo' \
    > test.out 2>&1
eval_tap $? 307 'PublicExistsAnyUserActiveEntitlement' test.out

#- 308 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kcWX59kw' \
    --appId 'iYHgHT6I' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 309 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vd0fGpU2' \
    --entitlementClazz 'CODE' \
    --itemId 'VRclumQT' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 310 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fvr5rRyY' \
    --entitlementClazz 'MEDIA' \
    --sku 'aNmz3PjM' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 311 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'x2T89NTr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FRUCXFkr' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserEntitlement' test.out

#- 312 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'uxegpkcX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cfzgcvv0' \
    --body '{"useCount": 96}' \
    > test.out 2>&1
eval_tap $? 312 'PublicConsumeUserEntitlement' test.out

#- 313 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'E5EQhcom' \
    --body '{"code": "PS1E7cps", "language": "GRZe", "region": "yRNjEC3F"}' \
    > test.out 2>&1
eval_tap $? 313 'PublicRedeemCode' test.out

#- 314 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MDcZvwwf' \
    --body '{"excludeOldTransactions": false, "language": "iNMf", "productId": "wKyGxTF1", "receiptData": "l5q1Np0s", "region": "T1X8J2eA", "transactionId": "WOzjmh9U"}' \
    > test.out 2>&1
eval_tap $? 314 'PublicFulfillAppleIAPItem' test.out

#- 315 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'zIfnhoo6' \
    --body '{"epicGamesJwtToken": "xUmTleUn"}' \
    > test.out 2>&1
eval_tap $? 315 'SyncEpicGamesInventory' test.out

#- 316 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JFM7XhoD' \
    --body '{"autoAck": true, "language": "IKjs_134", "orderId": "AsiG31CE", "packageName": "yUOuOZhm", "productId": "nHkvek6A", "purchaseTime": 0, "purchaseToken": "5kNnoclx", "region": "s9kxcvIp"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicFulfillGoogleIAPItem' test.out

#- 317 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7mCYfWK' \
    --body '{"currencyCode": "jY9CsQYs", "price": 0.5064345254431937, "productId": "hEOntEke", "serviceLabel": 6}' \
    > test.out 2>&1
eval_tap $? 317 'PublicReconcilePlayStationStore' test.out

#- 318 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'M1A0bFqv' \
    --body '{"appId": "jxbT3YuV", "language": "Ab", "region": "cjuDvNrX", "stadiaPlayerId": "L845jfh5"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncStadiaEntitlement' test.out

#- 319 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZ0hqJLj' \
    --body '{"appId": "QUmoYUnC", "currencyCode": "849OBNuL", "language": "OFg-mPbq-606", "price": 0.08079199073336352, "productId": "pHjtvFwK", "region": "SJyZeqvp", "steamId": "evcVXTxs"}' \
    > test.out 2>&1
eval_tap $? 319 'SyncSteamInventory' test.out

#- 320 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '9LTorIyx' \
    --body '{"gameId": "23LhLy7d", "language": "GbU_yfWS", "region": "4eOwWqW8"}' \
    > test.out 2>&1
eval_tap $? 320 'SyncTwitchDropsEntitlement' test.out

#- 321 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'HiLpTi1W' \
    --body '{"currencyCode": "63HccgM5", "price": 0.16672564141657453, "productId": "u36JpTL5", "xstsToken": "5W4ws3KC"}' \
    > test.out 2>&1
eval_tap $? 321 'SyncXboxInventory' test.out

#- 322 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'yplY1ocK' \
    --itemId 'DCVaqrVe' \
    --limit '8' \
    --offset '13' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 322 'PublicQueryUserOrders' test.out

#- 323 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDIIcvuu' \
    --body '{"currencyCode": "okt8TC38", "discountedPrice": 24, "ext": {"YoUanQT4": {}}, "itemId": "Mmznv7r2", "language": "TH", "price": 12, "quantity": 9, "region": "CLX41qyO", "returnUrl": "iLgd8Wy7"}' \
    > test.out 2>&1
eval_tap $? 323 'PublicCreateUserOrder' test.out

#- 324 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '39QHzw0T' \
    --userId 'Ezpd7TV5' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserOrder' test.out

#- 325 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vhMM2i3D' \
    --userId 'M6etfI7T' \
    > test.out 2>&1
eval_tap $? 325 'PublicCancelUserOrder' test.out

#- 326 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zC3sKmts' \
    --userId 'yEKdO6HN' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserOrderHistories' test.out

#- 327 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'm3zGu71q' \
    --userId 'TSSJEbWl' \
    > test.out 2>&1
eval_tap $? 327 'PublicDownloadUserOrderReceipt' test.out

#- 328 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'ETp9XOCA' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetPaymentAccounts' test.out

#- 329 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '1X3HHMTl' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'kAWQfBuB' \
    > test.out 2>&1
eval_tap $? 329 'PublicDeletePaymentAccount' test.out

#- 330 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOCjBfYC' \
    --chargeStatus 'CHARGED' \
    --itemId 'plye2GaP' \
    --limit '79' \
    --offset '50' \
    --sku 'krgBH4ic' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 330 'PublicQueryUserSubscriptions' test.out

#- 331 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '6L36Vg2F' \
    --body '{"currencyCode": "2Q9aZDJg", "itemId": "1OT8109o", "language": "tEV_184", "region": "cHABdGtV", "returnUrl": "9jAPqon7", "source": "UmLNy9Pk"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicSubscribeSubscription' test.out

#- 332 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9SnlbWN' \
    --itemId 'cAxv8uHD' \
    > test.out 2>&1
eval_tap $? 332 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 333 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qJtYC7rz' \
    --userId 'nwNdLhqX' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetUserSubscription' test.out

#- 334 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vXVnjvc0' \
    --userId 'BMegJpW1' \
    > test.out 2>&1
eval_tap $? 334 'PublicChangeSubscriptionBillingAccount' test.out

#- 335 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZeuhpLX1' \
    --userId 'BHZ4hnOm' \
    --body '{"immediate": false, "reason": "yXu6XtjN"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicCancelSubscription' test.out

#- 336 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CqYk9TPU' \
    --userId 'KcDTfR7d' \
    --excludeFree  \
    --limit '30' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetUserSubscriptionBillingHistories' test.out

#- 337 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Eo2Oe08H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'peJBfG0n' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetWallet' test.out

#- 338 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'GZHe5lw2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TlkPIxL9' \
    --limit '42' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 338 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..340"

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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"t8UJC5fl": "Nyj6HsTt"}}]}' \
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

#- 159 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLtv38He' \
    --xboxUserId 'cczopFme' \
    > test.out 2>&1
eval_tap $? 159 'GetXblUserAchievements' test.out

#- 160 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'RwpcJBZy' \
    --body '{"achievements": [{"id": "i3mLC4Kz", "percentComplete": 9}], "serviceConfigId": "kiSzeyol", "titleId": "nOQt0joV", "xboxUserId": "HgCytC6l"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateXblUserAchievement' test.out

#- 161 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'RG98YxnH' \
    > test.out 2>&1
eval_tap $? 161 'AnonymizeCampaign' test.out

#- 162 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRdoTKKe' \
    > test.out 2>&1
eval_tap $? 162 'AnonymizeEntitlement' test.out

#- 163 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'uSjfZe9i' \
    > test.out 2>&1
eval_tap $? 163 'AnonymizeFulfillment' test.out

#- 164 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '1osghF1h' \
    > test.out 2>&1
eval_tap $? 164 'AnonymizeIntegration' test.out

#- 165 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'zi1Nl47s' \
    > test.out 2>&1
eval_tap $? 165 'AnonymizeOrder' test.out

#- 166 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'yJ5ibzSH' \
    > test.out 2>&1
eval_tap $? 166 'AnonymizePayment' test.out

#- 167 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZeCLIvWP' \
    > test.out 2>&1
eval_tap $? 167 'AnonymizeSubscription' test.out

#- 168 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'VRsdEqA6' \
    > test.out 2>&1
eval_tap $? 168 'AnonymizeWallet' test.out

#- 169 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1yTrMgsy' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'mPzc20Eu' \
    --itemId 'O5dMqGDl' \
    --limit '89' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 169 'QueryUserEntitlements' test.out

#- 170 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y07rEVSj' \
    --body '[{"endDate": "1983-09-27T00:00:00Z", "grantedCode": "jL6ZbXjG", "itemId": "6DSmpp3o", "itemNamespace": "p8htaRLx", "language": "wpV_stul", "quantity": 38, "region": "5F1Le7cR", "source": "PROMOTION", "startDate": "1991-02-25T00:00:00Z", "storeId": "ZmmKz41i"}]' \
    > test.out 2>&1
eval_tap $? 170 'GrantUserEntitlement' test.out

#- 171 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '1Tp78Fip' \
    --activeOnly  \
    --appId 'JHahViJv' \
    > test.out 2>&1
eval_tap $? 171 'GetUserAppEntitlementByAppId' test.out

#- 172 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'LYW0kdml' \
    --activeOnly  \
    --limit '21' \
    --offset '22' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 172 'QueryUserEntitlementsByAppType' test.out

#- 173 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSOOA2VO' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --itemId 'oNbB98Pu' \
    > test.out 2>&1
eval_tap $? 173 'GetUserEntitlementByItemId' test.out

#- 174 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'SGykqFzP' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'SMXT53bB' \
    > test.out 2>&1
eval_tap $? 174 'GetUserEntitlementBySku' test.out

#- 175 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uL38beOY' \
    --appIds 'DVuHZQ9L' \
    --itemIds 'Yt6w23Wf' \
    --skus '8iEQo72s' \
    > test.out 2>&1
eval_tap $? 175 'ExistsAnyUserActiveEntitlement' test.out

#- 176 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0aRdcDl' \
    --itemIds 'DyGcsfIu' \
    > test.out 2>&1
eval_tap $? 176 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 177 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'I4Dv5lEJ' \
    --appId 'pK1AyRlz' \
    > test.out 2>&1
eval_tap $? 177 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 178 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'srRXEFZi' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'QOHG6wVi' \
    > test.out 2>&1
eval_tap $? 178 'GetUserEntitlementOwnershipByItemId' test.out

#- 179 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNratsvv' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'LmIohfNI' \
    > test.out 2>&1
eval_tap $? 179 'GetUserEntitlementOwnershipBySku' test.out

#- 180 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLXMDWDd' \
    --entitlementIds 'm5FE4lli' \
    > test.out 2>&1
eval_tap $? 180 'RevokeUserEntitlements' test.out

#- 181 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'QMnutJbp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eo4mUNHF' \
    > test.out 2>&1
eval_tap $? 181 'GetUserEntitlement' test.out

#- 182 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'tdml2xNv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iWacJc3F' \
    --body '{"endDate": "1977-06-11T00:00:00Z", "nullFieldList": ["uKgoCBqS"], "startDate": "1999-06-04T00:00:00Z", "status": "ACTIVE", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateUserEntitlement' test.out

#- 183 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'bwCeeq9o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uEdDtjOg' \
    --body '{"useCount": 36}' \
    > test.out 2>&1
eval_tap $? 183 'ConsumeUserEntitlement' test.out

#- 184 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'ypLkm2ZY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ew5H7Zm0' \
    > test.out 2>&1
eval_tap $? 184 'DisableUserEntitlement' test.out

#- 185 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'gnYyj6MX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9G1ntye' \
    > test.out 2>&1
eval_tap $? 185 'EnableUserEntitlement' test.out

#- 186 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'bvoeHenA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALKt7Efx' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementHistories' test.out

#- 187 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'IH446oUn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P2S74unX' \
    > test.out 2>&1
eval_tap $? 187 'RevokeUserEntitlement' test.out

#- 188 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wg0JKqVW' \
    --body '{"duration": 97, "endDate": "1997-05-11T00:00:00Z", "itemId": "jK1epwkA", "itemSku": "vcsYvbgf", "language": "BVPpTa8Y", "order": {"currency": {"currencyCode": "uq7TKiNX", "currencySymbol": "mz7eMrMD", "currencyType": "REAL", "decimals": 0, "namespace": "UxTCTng0"}, "ext": {"xjtdBrjs": {}}, "free": false}, "orderNo": "ykt2Ck2g", "origin": "Xbox", "quantity": 23, "region": "SatECZ2U", "source": "DLC", "startDate": "1982-12-07T00:00:00Z", "storeId": "LqDqYSxT"}' \
    > test.out 2>&1
eval_tap $? 188 'FulfillItem' test.out

#- 189 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuVlBqir' \
    --body '{"code": "dp3yxnsE", "language": "LsVH_JiHx", "region": "xiSoWpnn"}' \
    > test.out 2>&1
eval_tap $? 189 'RedeemCode' test.out

#- 190 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgX7BCPM' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "zQIxibhp", "namespace": "NYsHtdB3"}, "item": {"itemId": "IkjuaZqh", "itemSku": "JilrZkSS", "itemType": "KgP5rxCR"}, "quantity": 64, "type": "CURRENCY"}], "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 190 'FulfillRewards' test.out

#- 191 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'A1GORSbL' \
    --endTime '9n0dbWDE' \
    --limit '40' \
    --offset '31' \
    --productId 'mdLQzPnN' \
    --startTime 'fBAcWArb' \
    --status 'FAILED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 191 'QueryUserIAPOrders' test.out

#- 192 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdHIZb03' \
    > test.out 2>&1
eval_tap $? 192 'QueryAllUserIAPOrders' test.out

#- 193 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'otqmBuS9' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "zuh", "productId": "0lpJ4JLl", "region": "01qi7L2o", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 193 'MockFulfillIAPItem' test.out

#- 194 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'UoVRUb39' \
    --itemId 'j22P4Sp0' \
    --limit '5' \
    --offset '73' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 194 'QueryUserOrders' test.out

#- 195 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'jRUbZVBV' \
    --body '{"currencyCode": "S7OK2Zrd", "currencyNamespace": "csckMekR", "discountedPrice": 80, "ext": {"WZ2KUTqk": {}}, "itemId": "K2eFaGLo", "language": "SmEEPbLy", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 48, "quantity": 93, "region": "ie6fZgLl", "returnUrl": "lUPsO8lg", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 195 'AdminCreateUserOrder' test.out

#- 196 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7006vL2w' \
    --itemId '4aajDAOx' \
    > test.out 2>&1
eval_tap $? 196 'CountOfPurchasedItem' test.out

#- 197 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0iJjYlea' \
    --userId 'ktqv2Wkl' \
    > test.out 2>&1
eval_tap $? 197 'GetUserOrder' test.out

#- 198 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jQuD5mnJ' \
    --userId 'ONqHGq8m' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "7mF2lMFc"}' \
    > test.out 2>&1
eval_tap $? 198 'UpdateUserOrderStatus' test.out

#- 199 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aghFXJIJ' \
    --userId 'flRHFcsI' \
    > test.out 2>&1
eval_tap $? 199 'FulfillUserOrder' test.out

#- 200 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qCy4xDif' \
    --userId 'SSQ5On2c' \
    > test.out 2>&1
eval_tap $? 200 'GetUserOrderGrant' test.out

#- 201 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cEcl3xei' \
    --userId 'O4bwF5JO' \
    > test.out 2>&1
eval_tap $? 201 'GetUserOrderHistories' test.out

#- 202 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jGoGxKM3' \
    --userId 'qMce5tfL' \
    --body '{"additionalData": {"cardSummary": "cpjFZMKC"}, "authorisedTime": "1971-05-09T00:00:00Z", "chargebackReversedTime": "1997-04-26T00:00:00Z", "chargebackTime": "1986-01-13T00:00:00Z", "chargedTime": "1989-08-14T00:00:00Z", "createdTime": "1989-09-09T00:00:00Z", "currency": {"currencyCode": "pHxMYF83", "currencySymbol": "6075xEpz", "currencyType": "REAL", "decimals": 26, "namespace": "Ytpja5ig"}, "customParameters": {"2isQZga6": {}}, "extOrderNo": "Vy76izPi", "extTxId": "QRjYa8fv", "extUserId": "5fIt22tI", "issuedAt": "1996-02-27T00:00:00Z", "metadata": {"jhgkigW2": "2zXMWXfb"}, "namespace": "cM0GIALI", "nonceStr": "bFCQgBcL", "paymentMethod": "NT6iOQVY", "paymentMethodFee": 46, "paymentOrderNo": "5rW2gMsI", "paymentProvider": "ADYEN", "paymentProviderFee": 54, "paymentStationUrl": "itSn3UDe", "price": 72, "refundedTime": "1975-10-06T00:00:00Z", "salesTax": 97, "sandbox": true, "sku": "jN7ktOBT", "status": "CHARGED", "statusReason": "aBxWRTVu", "subscriptionId": "YEqGlKDw", "subtotalPrice": 91, "targetNamespace": "KXBrXiQc", "targetUserId": "d9IW8kiC", "tax": 73, "totalPrice": 9, "totalTax": 85, "txEndTime": "1988-08-07T00:00:00Z", "type": "vcq1ETvW", "userId": "BxYZJh7B", "vat": 13}' \
    > test.out 2>&1
eval_tap $? 202 'ProcessUserOrderNotification' test.out

#- 203 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bnSu9M2O' \
    --userId 'xD2udaeY' \
    > test.out 2>&1
eval_tap $? 203 'DownloadUserOrderReceipt' test.out

#- 204 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'pCXYSMiy' \
    --body '{"currencyCode": "87CTqEQB", "currencyNamespace": "g36my3sY", "customParameters": {"2clrDcai": {}}, "description": "n0cOVF1z", "extOrderNo": "HwDTI0sJ", "extUserId": "1Q0kphMT", "itemType": "BUNDLE", "language": "sp-653", "metadata": {"bg8C7Mvy": "whu6MjOj"}, "notifyUrl": "uGzo1Fz4", "omitNotification": true, "platform": "U0aSn98N", "price": 33, "recurringPaymentOrderNo": "OUA0z92R", "region": "aDe8ngT8", "returnUrl": "LRQkMnG1", "sandbox": true, "sku": "F2mdYY6Z", "subscriptionId": "MfuTYTKs", "title": "ue48qBEB"}' \
    > test.out 2>&1
eval_tap $? 204 'CreateUserPaymentOrder' test.out

#- 205 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NAV5BTe6' \
    --userId 'ec1zA92U' \
    --body '{"description": "RCLSGPmR"}' \
    > test.out 2>&1
eval_tap $? 205 'RefundUserPaymentOrder' test.out

#- 206 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'BZWunHW7' \
    --body '{"code": "MYvr6QA7", "orderNo": "Ppepc92H"}' \
    > test.out 2>&1
eval_tap $? 206 'ApplyUserRedemption' test.out

#- 207 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'A94eACde' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'fUpgiPpf' \
    --limit '27' \
    --offset '46' \
    --sku 'KJ3dnmtP' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserSubscriptions' test.out

#- 208 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '64Y4gPEK' \
    --excludeSystem  \
    --limit '77' \
    --offset '15' \
    --subscriptionId 'hu9a6f3x' \
    > test.out 2>&1
eval_tap $? 208 'GetUserSubscriptionActivities' test.out

#- 209 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'JNtUlKLl' \
    --body '{"grantDays": 69, "itemId": "IAeHbm5M", "language": "6LsY1VMu", "reason": "IEcRls68", "region": "M3MPMRPB", "source": "epyyMz6z"}' \
    > test.out 2>&1
eval_tap $? 209 'PlatformSubscribeSubscription' test.out

#- 210 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fR1pvTYY' \
    --itemId 'tDOiEi4R' \
    > test.out 2>&1
eval_tap $? 210 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 211 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uEcHCSGh' \
    --userId 'pOZQFlwO' \
    > test.out 2>&1
eval_tap $? 211 'GetUserSubscription' test.out

#- 212 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iuKGDFgK' \
    --userId '49YuKnXk' \
    > test.out 2>&1
eval_tap $? 212 'DeleteUserSubscription' test.out

#- 213 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 's0m8ANrc' \
    --userId 'Ral7ta3f' \
    --force  \
    --body '{"immediate": false, "reason": "jA3h4MMW"}' \
    > test.out 2>&1
eval_tap $? 213 'CancelSubscription' test.out

#- 214 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3AJ5zlsF' \
    --userId 'BwjvLYvm' \
    --body '{"grantDays": 12, "reason": "6avudQFF"}' \
    > test.out 2>&1
eval_tap $? 214 'GrantDaysToSubscription' test.out

#- 215 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1CPNY9u2' \
    --userId 'dVYdglOO' \
    --excludeFree  \
    --limit '28' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 215 'GetUserSubscriptionBillingHistories' test.out

#- 216 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eK0kPKmB' \
    --userId 'qVux3lXc' \
    --body '{"additionalData": {"cardSummary": "D8aertAV"}, "authorisedTime": "1985-05-07T00:00:00Z", "chargebackReversedTime": "1980-07-03T00:00:00Z", "chargebackTime": "1983-04-16T00:00:00Z", "chargedTime": "1988-10-19T00:00:00Z", "createdTime": "1976-05-24T00:00:00Z", "currency": {"currencyCode": "eA0ARj9r", "currencySymbol": "icfayvnh", "currencyType": "REAL", "decimals": 76, "namespace": "DdY4WLHo"}, "customParameters": {"aUkYnQp5": {}}, "extOrderNo": "egdmVE8I", "extTxId": "mivNtQxq", "extUserId": "WRKHohOD", "issuedAt": "1978-11-21T00:00:00Z", "metadata": {"r98kjBUa": "s9jjz2Fr"}, "namespace": "giaGrcB7", "nonceStr": "dIOVKIPS", "paymentMethod": "JJHo5W8t", "paymentMethodFee": 72, "paymentOrderNo": "H8ou9Sdb", "paymentProvider": "WALLET", "paymentProviderFee": 89, "paymentStationUrl": "XcrEFCwq", "price": 8, "refundedTime": "1987-11-07T00:00:00Z", "salesTax": 74, "sandbox": false, "sku": "IBRdliFQ", "status": "REFUND_FAILED", "statusReason": "MKEzVUWl", "subscriptionId": "UWDs2x1E", "subtotalPrice": 85, "targetNamespace": "U0oepEvc", "targetUserId": "jaSgEh6j", "tax": 70, "totalPrice": 27, "totalTax": 62, "txEndTime": "1982-03-08T00:00:00Z", "type": "nIHJ1o7a", "userId": "q5Zznd5e", "vat": 0}' \
    > test.out 2>&1
eval_tap $? 216 'ProcessUserSubscriptionNotification' test.out

#- 217 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'cobTsuRl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hreQVFID' \
    --body '{"count": 29, "orderNo": "8hJWVjKI"}' \
    > test.out 2>&1
eval_tap $? 217 'AcquireUserTicket' test.out

#- 218 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'OAw70DvA' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserCurrencyWallets' test.out

#- 219 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'HhSGWUvz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q1Za3IBC' \
    --limit '42' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 219 'ListUserCurrencyTransactions' test.out

#- 220 CheckWallet
eval_tap 0 220 'CheckWallet # SKIP deprecated' test.out

#- 221 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'FsUJPfia' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jp1rt7OB' \
    --body '{"amount": 12, "expireAt": "1984-08-16T00:00:00Z", "origin": "GooglePlay", "reason": "6N0eI65M", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 221 'CreditUserWallet' test.out

#- 222 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '5tngEYXg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PVT5CqXD' \
    --body '{"amount": 54, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 222 'PayWithUserWallet' test.out

#- 223 GetUserWallet
eval_tap 0 223 'GetUserWallet # SKIP deprecated' test.out

#- 224 DebitUserWallet
eval_tap 0 224 'DebitUserWallet # SKIP deprecated' test.out

#- 225 DisableUserWallet
eval_tap 0 225 'DisableUserWallet # SKIP deprecated' test.out

#- 226 EnableUserWallet
eval_tap 0 226 'EnableUserWallet # SKIP deprecated' test.out

#- 227 ListUserWalletTransactions
eval_tap 0 227 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 228 QueryWallets
eval_tap 0 228 'QueryWallets # SKIP deprecated' test.out

#- 229 GetWallet
eval_tap 0 229 'GetWallet # SKIP deprecated' test.out

#- 230 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'JeKFO92Y' \
    --end 'DtaZvJoK' \
    --start 'S0OxyipZ' \
    > test.out 2>&1
eval_tap $? 230 'SyncOrders' test.out

#- 231 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["uO4N9S2Y"], "apiKey": "CgHa6XBc", "authoriseAsCapture": true, "blockedPaymentMethods": ["GRYk5rUt"], "clientKey": "WHCnhmzz", "dropInSettings": "ppV7tKNK", "liveEndpointUrlPrefix": "YUQVBXym", "merchantAccount": "WcNlHaFx", "notificationHmacKey": "YaGHUpmB", "notificationPassword": "FyOrFKtx", "notificationUsername": "GNAi0fq4", "returnUrl": "xChPLd2l", "settings": "Oopc7XoV"}' \
    > test.out 2>&1
eval_tap $? 231 'TestAdyenConfig' test.out

#- 232 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "pdd6rCpy", "privateKey": "MrnH9YHX", "publicKey": "h7KnCVOK", "returnUrl": "Y2zsBRGt"}' \
    > test.out 2>&1
eval_tap $? 232 'TestAliPayConfig' test.out

#- 233 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "d8QY2OLb", "secretKey": "ijrvfr8h"}' \
    > test.out 2>&1
eval_tap $? 233 'TestCheckoutConfig' test.out

#- 234 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'knjWUWdM' \
    > test.out 2>&1
eval_tap $? 234 'DebugMatchedPaymentMerchantConfig' test.out

#- 235 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "UXHvw4pN", "clientSecret": "lGLjdBxL", "returnUrl": "M079pDAb", "webHookId": "TgmsEYEq"}' \
    > test.out 2>&1
eval_tap $? 235 'TestPayPalConfig' test.out

#- 236 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["2GkYK1vY"], "publishableKey": "m9flXQ7C", "secretKey": "QoemnQG0", "webhookSecret": "dH0NVM9V"}' \
    > test.out 2>&1
eval_tap $? 236 'TestStripeConfig' test.out

#- 237 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "EHTPqDhk", "key": "cu5vnz6G", "mchid": "iNMboBJH", "returnUrl": "ml0LJmpP"}' \
    > test.out 2>&1
eval_tap $? 237 'TestWxPayConfig' test.out

#- 238 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "i4mqhrui", "flowCompletionUrl": "CZLGGP5U", "merchantId": 99, "projectId": 20, "projectSecretKey": "HNTMapp5"}' \
    > test.out 2>&1
eval_tap $? 238 'TestXsollaConfig' test.out

#- 239 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'SbonsUJK' \
    > test.out 2>&1
eval_tap $? 239 'GetPaymentMerchantConfig' test.out

#- 240 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'ADr60Ekd' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["FrpLsGt9"], "apiKey": "yTXWUSCQ", "authoriseAsCapture": false, "blockedPaymentMethods": ["MsHN7reI"], "clientKey": "22ks7I12", "dropInSettings": "tAZc8sxx", "liveEndpointUrlPrefix": "Lx9XQeqN", "merchantAccount": "WLm8cNJb", "notificationHmacKey": "YH5J4WiJ", "notificationPassword": "Lv9NvHwt", "notificationUsername": "w2Mjcy9Z", "returnUrl": "L6Zs5Bu2", "settings": "XYopLWZe"}' \
    > test.out 2>&1
eval_tap $? 240 'UpdateAdyenConfig' test.out

#- 241 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'UKJJNftR' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 241 'TestAdyenConfigById' test.out

#- 242 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'pGgk1ise' \
    --sandbox  \
    --validate  \
    --body '{"appId": "REzzRG6z", "privateKey": "9wmuHddy", "publicKey": "OdibI1LV", "returnUrl": "yqbdY8DG"}' \
    > test.out 2>&1
eval_tap $? 242 'UpdateAliPayConfig' test.out

#- 243 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'ZKAuoIKz' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 243 'TestAliPayConfigById' test.out

#- 244 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '3Pp3zLWU' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "xMzMtSmM", "secretKey": "mZP8nG0F"}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateCheckoutConfig' test.out

#- 245 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'oQP8q7aS' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 245 'TestCheckoutConfigById' test.out

#- 246 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'sb85gAh9' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "RD3ZzN6N", "clientSecret": "1iJ8ltt9", "returnUrl": "IRqCflgl", "webHookId": "n6r5f0s5"}' \
    > test.out 2>&1
eval_tap $? 246 'UpdatePayPalConfig' test.out

#- 247 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'H6lCf3QH' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 247 'TestPayPalConfigById' test.out

#- 248 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'a11hLLCg' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["w5av4LEx"], "publishableKey": "dabD8g2c", "secretKey": "vHfMRupD", "webhookSecret": "A5xbjs3X"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateStripeConfig' test.out

#- 249 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'RdHUJ0GC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 249 'TestStripeConfigById' test.out

#- 250 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'mflIXkgJ' \
    --validate  \
    --body '{"appId": "6zkTwoak", "key": "q7sEejFZ", "mchid": "1NtONXb9", "returnUrl": "w9hsQHsz"}' \
    > test.out 2>&1
eval_tap $? 250 'UpdateWxPayConfig' test.out

#- 251 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'IsfrlzKp' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 251 'UpdateWxPayConfigCert' test.out

#- 252 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'Qdd58dZP' \
    > test.out 2>&1
eval_tap $? 252 'TestWxPayConfigById' test.out

#- 253 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '5RvrinNt' \
    --validate  \
    --body '{"apiKey": "vBtqFSkA", "flowCompletionUrl": "68mIVYJ5", "merchantId": 31, "projectId": 89, "projectSecretKey": "VxBsLhty"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateXsollaConfig' test.out

#- 254 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '3pecToXA' \
    > test.out 2>&1
eval_tap $? 254 'TestXsollaConfigById' test.out

#- 255 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '4M1oUFPh' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateXsollaUIConfig' test.out

#- 256 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '78' \
    --namespace "$AB_NAMESPACE" \
    --offset '57' \
    --region '4FY69mM8' \
    > test.out 2>&1
eval_tap $? 256 'QueryPaymentProviderConfig' test.out

#- 257 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "oJNOGB83", "region": "Ns6Hl5Po", "sandboxTaxJarApiToken": "ab6lKoVq", "specials": ["WXPAY"], "taxJarApiToken": "UzIxOfgl", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 257 'CreatePaymentProviderConfig' test.out

#- 258 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 258 'GetAggregatePaymentProviders' test.out

#- 259 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'S2q2DoWr' \
    > test.out 2>&1
eval_tap $? 259 'DebugMatchedPaymentProviderConfig' test.out

#- 260 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 260 'GetSpecialPaymentProviders' test.out

#- 261 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '9zvFtKa2' \
    --body '{"aggregate": "ADYEN", "namespace": "OAqOokV1", "region": "plxQ2Yri", "sandboxTaxJarApiToken": "TPfipD67", "specials": ["CHECKOUT"], "taxJarApiToken": "I2hiZkrt", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 261 'UpdatePaymentProviderConfig' test.out

#- 262 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '2U1RQlMx' \
    > test.out 2>&1
eval_tap $? 262 'DeletePaymentProviderConfig' test.out

#- 263 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 263 'GetPaymentTaxConfig' test.out

#- 264 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "kfNMPNtq", "taxJarApiToken": "v2TMz1b7", "taxJarEnabled": false, "taxJarProductCodesMapping": {"zkXOek83": "Igm1wkSW"}}' \
    > test.out 2>&1
eval_tap $? 264 'UpdatePaymentTaxConfig' test.out

#- 265 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'sYvAsu18' \
    --end 'obUdc8mb' \
    --start 'vXcwcgMq' \
    > test.out 2>&1
eval_tap $? 265 'SyncPaymentOrders' test.out

#- 266 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'OXMziXrV' \
    --storeId 'dsEc3ClF' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetRootCategories' test.out

#- 267 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'P3mJwusC' \
    --storeId 'BTe4kLcu' \
    > test.out 2>&1
eval_tap $? 267 'DownloadCategories' test.out

#- 268 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'qL40NYge' \
    --namespace "$AB_NAMESPACE" \
    --language 'kRavpaGT' \
    --storeId 'A9BTyCCy' \
    > test.out 2>&1
eval_tap $? 268 'PublicGetCategory' test.out

#- 269 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'N4Fw9i6m' \
    --namespace "$AB_NAMESPACE" \
    --language 'I2W3tjjC' \
    --storeId 'qPVyYs01' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetChildCategories' test.out

#- 270 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'hEYzWw3q' \
    --namespace "$AB_NAMESPACE" \
    --language 'rcxM0DPA' \
    --storeId 'XQBNMP7j' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetDescendantCategories' test.out

#- 271 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 271 'PublicListCurrencies' test.out

#- 272 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'fPaoZaWF' \
    --region 'spkU5kn6' \
    --storeId 'PlPqD4Ag' \
    --appId 'fasBfclB' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetItemByAppId' test.out

#- 273 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --baseAppId 'ZjZbLnmg' \
    --categoryPath 'hKwPyVIn' \
    --features '3qaHP7KN' \
    --itemType 'MEDIA' \
    --language 'lyfrENVQ' \
    --limit '21' \
    --offset '31' \
    --region 'caWHf6T2' \
    --sortBy 'createdAt:desc' \
    --storeId 'OOljn7c6' \
    --tags 'c9efJI02' \
    > test.out 2>&1
eval_tap $? 273 'PublicQueryItems' test.out

#- 274 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'TZxrgLBF' \
    --region 'JEkphFz0' \
    --storeId 'h6WpoVpV' \
    --sku 'c2HBBmj6' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetItemBySku' test.out

#- 275 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'cEi02hXl' \
    --region '42ubCRfy' \
    --storeId '4GjKn5It' \
    --itemIds 'HXLDZqpR' \
    > test.out 2>&1
eval_tap $? 275 'PublicBulkGetItems' test.out

#- 276 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '32' \
    --region 'nR742Gcb' \
    --storeId 'LuQOGMOE' \
    --keyword 'zmdjNhT0' \
    --language 'S46kqyfM' \
    > test.out 2>&1
eval_tap $? 276 'PublicSearchItems' test.out

#- 277 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'BSaZc4SA' \
    --namespace "$AB_NAMESPACE" \
    --language '16M8gQCD' \
    --region '7aBHWCYe' \
    --storeId 'vNkfcQvl' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetApp' test.out

#- 278 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '4Oso7tx6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 278 'PublicGetItemDynamicData' test.out

#- 279 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '5zXCiTfj' \
    --namespace "$AB_NAMESPACE" \
    --language 'orLFqTmI' \
    --populateBundle  \
    --region 'UFUoonHB' \
    --storeId 'I13SZFHf' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetItem' test.out

#- 280 GetPaymentCustomization
eval_tap 0 280 'GetPaymentCustomization # SKIP deprecated' test.out

#- 281 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "m0F8vS2B", "paymentProvider": "STRIPE", "returnUrl": "Z3nq88YS", "ui": "SD7zV0C8", "zipCode": "FvVU3kRX"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetPaymentUrl' test.out

#- 282 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BGPXIdft' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetPaymentMethods' test.out

#- 283 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1biZHuhW' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetUnpaidPaymentOrder' test.out

#- 284 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yFPHdXcy' \
    --paymentProvider 'WALLET' \
    --zipCode 'ZEhYeUSy' \
    --body '{"token": "5Ukc65na"}' \
    > test.out 2>&1
eval_tap $? 284 'Pay' test.out

#- 285 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'P11R8Xww' \
    > test.out 2>&1
eval_tap $? 285 'PublicCheckPaymentOrderPaidStatus' test.out

#- 286 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WALLET' \
    --region 'q9nMa2Bt' \
    > test.out 2>&1
eval_tap $? 286 'GetPaymentPublicConfig' test.out

#- 287 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'gwyuf2fj' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetQRCode' test.out

#- 288 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'V30SLxi7' \
    --foreinginvoice 'uyhaeFtc' \
    --invoiceId 'O9XNy63Q' \
    --payload 'O9vW0ck7' \
    --redirectResult 'TEDE8LeE' \
    --resultCode 'QBeGPLiE' \
    --sessionId '6tHCr0GP' \
    --status 'FvT0SAK9' \
    --token '1y5vCeBI' \
    --type 'Jq0B9UcI' \
    --userId '6c5cre9e' \
    --orderNo 'alHOZphc' \
    --paymentOrderNo 'Lncnjnmy' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'SxXdCrsk' \
    > test.out 2>&1
eval_tap $? 288 'PublicNormalizePaymentReturnUrl' test.out

#- 289 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'oFqnowq9' \
    --paymentOrderNo 'Laz1GLt5' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 289 'GetPaymentTaxValue' test.out

#- 290 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'f8Z7ahmb' \
    > test.out 2>&1
eval_tap $? 290 'GetRewardByCode' test.out

#- 291 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'VPm2g7xA' \
    --limit '62' \
    --offset '10' \
    --sortBy 'rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 291 'QueryRewards1' test.out

#- 292 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RLUjfWS9' \
    > test.out 2>&1
eval_tap $? 292 'GetReward1' test.out

#- 293 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'PublicListStores' test.out

#- 294 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'sftIfHGe' \
    --itemIds '5bUTSXOv' \
    --skus '12PMcRO6' \
    > test.out 2>&1
eval_tap $? 294 'PublicExistsAnyMyActiveEntitlement' test.out

#- 295 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'E2Mkre5q' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 296 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'vaACp6he' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 297 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'zjkPNNS0' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 298 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'BfgF6inI' \
    --itemIds 'RsZ5hrqN' \
    --skus 'zVszGVP5' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetEntitlementOwnershipToken' test.out

#- 299 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'P1iwhcf3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicGetMyWallet' test.out

#- 300 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '0C1KHRZH' \
    --body '{"epicGamesJwtToken": "MGy5vbfZ"}' \
    > test.out 2>&1
eval_tap $? 300 'SyncEpicGameDLC' test.out

#- 301 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vYIFFctE' \
    --body '{"serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 301 'PublicSyncPsnDlcInventory' test.out

#- 302 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'OLxSRxe0' \
    --body '{"appId": "wmWBMcNi", "steamId": "WoobB6o6"}' \
    > test.out 2>&1
eval_tap $? 302 'SyncSteamDLC' test.out

#- 303 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'alTQcP0E' \
    --body '{"xstsToken": "pE9wGNVw"}' \
    > test.out 2>&1
eval_tap $? 303 'SyncXboxDLC' test.out

#- 304 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kgfJJ2HI' \
    --appType 'DEMO' \
    --entitlementClazz 'CODE' \
    --entitlementName 'fzgRpTf9' \
    --itemId 'lxF1JPBi' \
    --limit '51' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 304 'PublicQueryUserEntitlements' test.out

#- 305 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZtrGe8Ly' \
    --appId 'OH24nneZ' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetUserAppEntitlementByAppId' test.out

#- 306 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFeRld0b' \
    --limit '65' \
    --offset '52' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 306 'PublicQueryUserEntitlementsByAppType' test.out

#- 307 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYzaEaim' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'okcWX59k' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUserEntitlementByItemId' test.out

#- 308 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiYHgHT6' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'vd0fGpU2' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetUserEntitlementBySku' test.out

#- 309 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '09nVRclu' \
    --appIds 'mQTFvr5r' \
    --itemIds 'RyYzaNmz' \
    --skus '3PjMx2T8' \
    > test.out 2>&1
eval_tap $? 309 'PublicExistsAnyUserActiveEntitlement' test.out

#- 310 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9NTrFRUC' \
    --appId 'XFkruxeg' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 311 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pkcXCfzg' \
    --entitlementClazz 'APP' \
    --itemId 'vv0WE5EQ' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 312 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'hcomPS1E' \
    --entitlementClazz 'APP' \
    --sku 'psLgr2zE' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 313 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'njyRNjEC' \
    --namespace "$AB_NAMESPACE" \
    --userId '3FMDcZvw' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserEntitlement' test.out

#- 314 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'wf8aU98I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n31mF4jl' \
    --body '{"useCount": 45}' \
    > test.out 2>&1
eval_tap $? 314 'PublicConsumeUserEntitlement' test.out

#- 315 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'KyGxTF1l' \
    --body '{"code": "5q1Np0sT", "language": "Eawo_HuZi", "region": "nhoo6xUm"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicRedeemCode' test.out

#- 316 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TleUnJFM' \
    --body '{"excludeOldTransactions": false, "language": "dX", "productId": "2JSfZ64w", "receiptData": "WePq6103", "region": "PONKIS7F", "transactionId": "9emW4R15"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicFulfillAppleIAPItem' test.out

#- 317 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tAsiG31C' \
    --body '{"epicGamesJwtToken": "EyUOuOZh"}' \
    > test.out 2>&1
eval_tap $? 317 'SyncEpicGamesInventory' test.out

#- 318 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mnHkvek6' \
    --body '{"autoAck": true, "language": "Kn", "orderId": "clxs9kxc", "packageName": "vIpV7mCY", "productId": "fWKjY9Cs", "purchaseTime": 84, "purchaseToken": "YsGyhEOn", "region": "tEkedM1A"}' \
    > test.out 2>&1
eval_tap $? 318 'PublicFulfillGoogleIAPItem' test.out

#- 319 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '0bFqvjxb' \
    --body '{"currencyCode": "T3YuVdaB", "price": 0.609528905859618, "productId": "RSjhcjuD", "serviceLabel": 43}' \
    > test.out 2>&1
eval_tap $? 319 'PublicReconcilePlayStationStore' test.out

#- 320 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NrXL845j' \
    --body '{"appId": "fh5tZ0hq", "language": "lJqu", "region": "YUnC849O", "stadiaPlayerId": "BNuLZtof"}' \
    > test.out 2>&1
eval_tap $? 320 'SyncStadiaEntitlement' test.out

#- 321 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GAAaMpBQ' \
    --body '{"appId": "ArU4RS0F", "currencyCode": "QRy5Qz5V", "language": "YF_TVfW_315", "price": 0.0413770433373698, "productId": "XTxs9LTo", "region": "rIyx23Lh", "steamId": "Ly7ds3g3"}' \
    > test.out 2>&1
eval_tap $? 321 'SyncSteamInventory' test.out

#- 322 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BuHTPF19' \
    --body '{"gameId": "dBYFws5Y", "language": "Eo-lPtI", "region": "cgM5kYu3"}' \
    > test.out 2>&1
eval_tap $? 322 'SyncTwitchDropsEntitlement' test.out

#- 323 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6JpTL55W' \
    --body '{"currencyCode": "4ws3KCyp", "price": 0.18676759144513488, "productId": "1ocKDCVa", "xstsToken": "qrVeegT3"}' \
    > test.out 2>&1
eval_tap $? 323 'SyncXboxInventory' test.out

#- 324 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'uGDIIcvu' \
    --itemId 'uokt8TC3' \
    --limit '24' \
    --offset '28' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 324 'PublicQueryUserOrders' test.out

#- 325 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQT4Mmzn' \
    --body '{"currencyCode": "v7r2jthi", "discountedPrice": 3, "ext": {"geCLX41q": {}}, "itemId": "yOiLgd8W", "language": "qhZ-PDtv_mE", "price": 38, "quantity": 10, "region": "I7TzC3sK", "returnUrl": "mtsyEKdO"}' \
    > test.out 2>&1
eval_tap $? 325 'PublicCreateUserOrder' test.out

#- 326 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6HNm3zGu' \
    --userId '71qTSSJE' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserOrder' test.out

#- 327 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bWlETp9X' \
    --userId 'OCA1X3HH' \
    > test.out 2>&1
eval_tap $? 327 'PublicCancelUserOrder' test.out

#- 328 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MTlakAWQ' \
    --userId 'fBuBAOCj' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserOrderHistories' test.out

#- 329 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BfYCcply' \
    --userId 'e2GaPNzk' \
    > test.out 2>&1
eval_tap $? 329 'PublicDownloadUserOrderReceipt' test.out

#- 330 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'rgBH4icm' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetPaymentAccounts' test.out

#- 331 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'l6L36Vg2' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId '2Q9aZDJg' \
    > test.out 2>&1
eval_tap $? 331 'PublicDeletePaymentAccount' test.out

#- 332 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '1OT8109o' \
    --chargeStatus 'NEVER' \
    --itemId '70TevJgs' \
    --limit '3' \
    --offset '82' \
    --sku 'yFfJ6qcH' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 332 'PublicQueryUserSubscriptions' test.out

#- 333 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'dGtV9jAP' \
    --body '{"currencyCode": "qon7UmLN", "itemId": "y9PkF9Sn", "language": "Bw-874", "region": "JtYC7rzn", "returnUrl": "wNdLhqXv", "source": "XVnjvc0B"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicSubscribeSubscription' test.out

#- 334 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MegJpW1Z' \
    --itemId 'euhpLX1B' \
    > test.out 2>&1
eval_tap $? 334 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 335 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HZ4hnOmm' \
    --userId 'yXu6XtjN' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetUserSubscription' test.out

#- 336 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CqYk9TPU' \
    --userId 'KcDTfR7d' \
    > test.out 2>&1
eval_tap $? 336 'PublicChangeSubscriptionBillingAccount' test.out

#- 337 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pUEo2Oe0' \
    --userId '8HpeJBfG' \
    --body '{"immediate": false, "reason": "GZHe5lw2"}' \
    > test.out 2>&1
eval_tap $? 337 'PublicCancelSubscription' test.out

#- 338 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TlkPIxL9' \
    --userId 'v4fpCd0U' \
    --excludeFree  \
    --limit '21' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetUserSubscriptionBillingHistories' test.out

#- 339 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '1kP1pkkT' \
    --namespace "$AB_NAMESPACE" \
    --userId '08Cs6DdX' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetWallet' test.out

#- 340 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'ZWowBgZi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zMvwHszf' \
    --limit '76' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 340 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
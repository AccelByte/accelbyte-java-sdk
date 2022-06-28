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
echo "1..330"

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
    --body '{"context": {"item": {"appId": "FtBxyZcD", "appType": "DEMO", "baseAppId": "pGlsQuJu", "boothName": "8vMf0IsJ", "boundItemIds": ["kTrd8IDc"], "categoryPath": "V2zXnTKj", "clazz": "XY1bPqam", "createdAt": "1975-08-05T00:00:00Z", "description": "xx9Cs18E", "displayOrder": 100, "entitlementType": "DURABLE", "ext": {"kItqRzHU": {}}, "features": ["1oh570KQ"], "images": [{"as": "BVaewc72", "caption": "krSha68n", "height": 100, "imageUrl": "nozp1C2K", "smallImageUrl": "mIQTuBdN", "width": 61}], "itemId": "UsxFb8CJ", "itemIds": ["17M7DJZa"], "itemQty": {"MSxECbZb": 49}, "itemType": "COINS", "language": "yoarORoe", "listable": false, "localExt": {"8Rh3kgs9": {}}, "longDescription": "qqJbnQso", "maxCount": 54, "maxCountPerUser": 12, "name": "iVpP8Cm3", "namespace": "yvASUoxd", "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 63, "fixedTrialCycles": 32, "graceDays": 24}, "region": "AGTJ8IEd", "regionData": [{"currencyCode": "agEtp4w2", "currencyNamespace": "9KOu9c19", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-09-24T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-11-25T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-10-30T00:00:00Z", "price": 61, "purchaseAt": "1989-10-31T00:00:00Z", "trialPrice": 11}], "seasonType": "PASS", "sku": "iX7jpkVZ", "stackable": false, "status": "ACTIVE", "tags": ["QYEmqGod"], "targetCurrencyCode": "OEGt9gPO", "targetItemId": "j0c6i0Jk", "targetNamespace": "vIas73uc", "thumbnailUrl": "YnFAJ3DK", "title": "5T4Eogg0", "updatedAt": "1996-04-22T00:00:00Z", "useCount": 23}, "namespace": "pv5bVAgt", "order": {"currency": {"currencyCode": "sDhUTDUs", "currencySymbol": "cbQDjbTQ", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "Mz2PTRlk"}, "ext": {"yU89ZPOw": {}}, "free": true}, "source": "GIFT"}, "script": "J42cwmzB", "type": "grantDays"}' \
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
    --body '{"data": [{"id": "Bmft3Udg", "rewards": [{"currency": {"currencyCode": "7p9PGmY2", "namespace": "H5kX4Msi"}, "item": {"itemId": "sSX28nAR", "itemSku": "xWRpv5ou", "itemType": "5xtvd28O"}, "quantity": 93, "type": "ITEM"}]}]}' \
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
    --body '{"appId": "sZoArWwP", "appType": "GAME", "baseAppId": "yFAdAtYc", "boothName": "iLIgRwFR", "categoryPath": "r0gwB9tz", "clazz": "3vp99XVl", "displayOrder": 94, "entitlementType": "CONSUMABLE", "ext": {"K3tE6n0s": {}}, "features": ["mip1tw3L"], "images": [{"as": "7cUd9pqt", "caption": "v6JfPZwc", "height": 57, "imageUrl": "VOXcVa80", "smallImageUrl": "TmCwtD2l", "width": 52}], "itemIds": ["H01o6Ndc"], "itemQty": {"BIgzrDyW": 31}, "itemType": "MEDIA", "listable": true, "localizations": {"YGmmBawM": {"description": "yoKyNpdA", "localExt": {"asm8xwUf": {}}, "longDescription": "zOlQiZY4", "title": "NbOQXJ7u"}}, "maxCount": 81, "maxCountPerUser": 90, "name": "zNMvuq2t", "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 98, "fixedTrialCycles": 68, "graceDays": 19}, "regionData": {"iK4DEUJR": [{"currencyCode": "VK3l9Eb0", "currencyNamespace": "R1XRb0RH", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1997-05-23T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1973-11-22T00:00:00Z", "discountedPrice": 22, "expireAt": "1977-02-22T00:00:00Z", "price": 34, "purchaseAt": "1972-12-27T00:00:00Z", "trialPrice": 99}]}, "seasonType": "TIER", "sku": "zaPBtkZM", "stackable": false, "status": "ACTIVE", "tags": ["4wcyhloV"], "targetCurrencyCode": "S3rYp8Qt", "targetNamespace": "cEmCEVc7", "thumbnailUrl": "5UfeypWj", "useCount": 59}' \
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
    --body '{"appId": "081gRB1G", "appType": "DEMO", "baseAppId": "LfLg4RYu", "boothName": "EbgUDEcJ", "categoryPath": "yIvsPwOr", "clazz": "0BmV5iFv", "displayOrder": 10, "entitlementType": "CONSUMABLE", "ext": {"FjTSmIEq": {}}, "features": ["oLyLeUGm"], "images": [{"as": "omGX9sXT", "caption": "Z0v8pqLf", "height": 4, "imageUrl": "5SwGnReU", "smallImageUrl": "ULDX4QUI", "width": 3}], "itemIds": ["b5nh68Zn"], "itemQty": {"yUtRvW9h": 78}, "itemType": "SEASON", "listable": true, "localizations": {"TtFrOmjk": {"description": "FrFVA8t0", "localExt": {"xF34Xpt6": {}}, "longDescription": "ZlTTic0k", "title": "r2a0nI2o"}}, "maxCount": 28, "maxCountPerUser": 92, "name": "HCJK5sp0", "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 43, "fixedTrialCycles": 69, "graceDays": 33}, "regionData": {"3aHVYIle": [{"currencyCode": "wLRuHY83", "currencyNamespace": "bGj0HTee", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1972-12-17T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1972-05-12T00:00:00Z", "discountedPrice": 5, "expireAt": "1980-08-26T00:00:00Z", "price": 30, "purchaseAt": "1983-02-21T00:00:00Z", "trialPrice": 100}]}, "seasonType": "PASS", "sku": "x476ED4M", "stackable": true, "status": "INACTIVE", "tags": ["hWIwHWTg"], "targetCurrencyCode": "zJFRYw6t", "targetNamespace": "1IKZLO6V", "thumbnailUrl": "4Ode46Qm", "useCount": 57}' \
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
    --body '{"carousel": [{"alt": "OEsE3yzI", "previewUrl": "sUP0Njlu", "thumbnailUrl": "OrGZTzsL", "type": "video", "url": "jfs9nIkc", "videoSource": "generic"}], "developer": "UEanjKHb", "forumUrl": "Xfk1zxdz", "genres": ["MassivelyMultiplayer"], "localizations": {"g0UXcRyH": {"announcement": "i3u8BzVW", "slogan": "u1tOmhUt"}}, "platformRequirements": {"CgcpvGrE": [{"additionals": "bcZUDExH", "directXVersion": "1tayOGXI", "diskSpace": "HzMRjMCt", "graphics": "OJsEijlr", "label": "bpyyEcQx", "osVersion": "VgJIjMZq", "processor": "cWfMl6dq", "ram": "rpD4tnc3", "soundCard": "ZRB3Ikdt"}]}, "platforms": ["Windows"], "players": ["MMO"], "primaryGenre": "Simulation", "publisher": "EomwenJv", "releaseDate": "1992-02-18T00:00:00Z", "websiteUrl": "rtQSv6Ec"}' \
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
    --body '{"extTxId": "5AsKaF2P", "paymentMethod": "44lXkI3z", "paymentProvider": "WALLET"}' \
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
    --body '{"allowedBalanceOrigins": ["Nintendo"]}' \
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
    --itemType 'APP' \
    --limit '43' \
    --offset '91' \
    --sortBy 'createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd '6pzjHpZO' \
    --updatedAtStart '0E9iLgRP' \
    > test.out 2>&1
eval_tap $? 142 'QueryChanges' test.out

#- 143 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JK3nBae3' \
    > test.out 2>&1
eval_tap $? 143 'PublishAll' test.out

#- 144 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GOgbQrqr' \
    --targetStoreId 'a0PtkfvO' \
    > test.out 2>&1
eval_tap $? 144 'CloneStore' test.out

#- 145 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pY2ramp5' \
    > test.out 2>&1
eval_tap $? 145 'ExportStore' test.out

#- 146 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'nBn6xmBk' \
    --limit '11' \
    --offset '76' \
    --sku 'tC66hFq0' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'ORm2XjlN' \
    > test.out 2>&1
eval_tap $? 146 'QuerySubscriptions' test.out

#- 147 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'EE5ecPzA' \
    > test.out 2>&1
eval_tap $? 147 'RecurringChargeSubscription' test.out

#- 148 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'mi0ySJHf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetTicketDynamic' test.out

#- 149 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'PloP1XkY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "K4MgIsDS"}' \
    > test.out 2>&1
eval_tap $? 149 'DecreaseTicketSale' test.out

#- 150 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'FMPyMhyw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 150 'GetTicketBoothID' test.out

#- 151 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '1OLZPVww' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 46, "orderNo": "H4BIDJuD"}' \
    > test.out 2>&1
eval_tap $? 151 'IncreaseTicketSale' test.out

#- 152 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'oShMMftl' \
    > test.out 2>&1
eval_tap $? 152 'AnonymizeCampaign' test.out

#- 153 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'l8N0VvCh' \
    > test.out 2>&1
eval_tap $? 153 'AnonymizeEntitlement' test.out

#- 154 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hz9urmt7' \
    > test.out 2>&1
eval_tap $? 154 'AnonymizeFulfillment' test.out

#- 155 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWvE8s6U' \
    > test.out 2>&1
eval_tap $? 155 'AnonymizeIntegration' test.out

#- 156 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'z8BRuYWD' \
    > test.out 2>&1
eval_tap $? 156 'AnonymizeOrder' test.out

#- 157 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtL6MTTR' \
    > test.out 2>&1
eval_tap $? 157 'AnonymizePayment' test.out

#- 158 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'kCbb9S5Q' \
    > test.out 2>&1
eval_tap $? 158 'AnonymizeSubscription' test.out

#- 159 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '1IVHGT88' \
    > test.out 2>&1
eval_tap $? 159 'AnonymizeWallet' test.out

#- 160 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'prREBgYO' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'J9Jumoht' \
    --itemId 'U13gf7TR' \
    --limit '16' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 160 'QueryUserEntitlements' test.out

#- 161 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZj5w5y3' \
    --body '[{"endDate": "1987-04-11T00:00:00Z", "grantedCode": "K8QVOa62", "itemId": "eQZtbLLc", "itemNamespace": "F671WLtv", "language": "ECCZ", "quantity": 62, "region": "meRwpcJB", "source": "REWARD", "startDate": "1975-04-13T00:00:00Z", "storeId": "LC4Kzeki"}]' \
    > test.out 2>&1
eval_tap $? 161 'GrantUserEntitlement' test.out

#- 162 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SzeyolnO' \
    --activeOnly  \
    --appId 'Qt0joVHg' \
    > test.out 2>&1
eval_tap $? 162 'GetUserAppEntitlementByAppId' test.out

#- 163 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'CytC6lRG' \
    --activeOnly  \
    --limit '100' \
    --offset '47' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 163 'QueryUserEntitlementsByAppType' test.out

#- 164 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HbRdoTKK' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 'uSjfZe9i' \
    > test.out 2>&1
eval_tap $? 164 'GetUserEntitlementByItemId' test.out

#- 165 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '1osghF1h' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --sku 'i1Nl47sy' \
    > test.out 2>&1
eval_tap $? 165 'GetUserEntitlementBySku' test.out

#- 166 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'J5ibzSHZ' \
    --appIds 'eCLIvWPV' \
    --itemIds 'RsdEqA61' \
    --skus 'yTrMgsyc' \
    > test.out 2>&1
eval_tap $? 166 'ExistsAnyUserActiveEntitlement' test.out

#- 167 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TgmPzc20' \
    --itemIds 'EuO5dMqG' \
    > test.out 2>&1
eval_tap $? 167 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 168 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DlSZPY07' \
    --appId 'rEVSjzHj' \
    > test.out 2>&1
eval_tap $? 168 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 169 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6ZbXjG6' \
    --entitlementClazz 'MEDIA' \
    --itemId 'Smpp3op8' \
    > test.out 2>&1
eval_tap $? 169 'GetUserEntitlementOwnershipByItemId' test.out

#- 170 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'htaRLxtW' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'FkESTULa' \
    > test.out 2>&1
eval_tap $? 170 'GetUserEntitlementOwnershipBySku' test.out

#- 171 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 't5F1Le7c' \
    --entitlementIds 'R7q6PWhZ' \
    > test.out 2>&1
eval_tap $? 171 'RevokeUserEntitlements' test.out

#- 172 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'mmKz41i1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tp78FipJ' \
    > test.out 2>&1
eval_tap $? 172 'GetUserEntitlement' test.out

#- 173 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'HahViJvL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YW0kdmlk' \
    --body '{"endDate": "1998-03-24T00:00:00Z", "nullFieldList": ["uqSOOA2V"], "startDate": "1991-08-08T00:00:00Z", "status": "INACTIVE", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateUserEntitlement' test.out

#- 174 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'bB98PuSG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ykqFzPwS' \
    --body '{"useCount": 77}' \
    > test.out 2>&1
eval_tap $? 174 'ConsumeUserEntitlement' test.out

#- 175 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'XT53bBuL' \
    --namespace "$AB_NAMESPACE" \
    --userId '38beOYDV' \
    > test.out 2>&1
eval_tap $? 175 'DisableUserEntitlement' test.out

#- 176 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'uHZQ9LYt' \
    --namespace "$AB_NAMESPACE" \
    --userId '6w23Wf8i' \
    > test.out 2>&1
eval_tap $? 176 'EnableUserEntitlement' test.out

#- 177 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'EQo72sH0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRdcDlDy' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementHistories' test.out

#- 178 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'GcsfIuI4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dv5lEJpK' \
    > test.out 2>&1
eval_tap $? 178 'RevokeUserEntitlement' test.out

#- 179 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '1AyRlzsr' \
    --body '{"duration": 87, "endDate": "1995-08-27T00:00:00Z", "itemId": "FZivQOHG", "itemSku": "6wVicNra", "language": "tsvvHLmI", "order": {"currency": {"currencyCode": "ohfNISLX", "currencySymbol": "MDWDdm5F", "currencyType": "VIRTUAL", "decimals": 22, "namespace": "liQMnutJ"}, "ext": {"bpEo4mUN": {}}, "free": true}, "orderNo": "tdml2xNv", "origin": "Steam", "quantity": 96, "region": "acJc3Fm7", "source": "REDEEM_CODE", "startDate": "1981-10-15T00:00:00Z", "storeId": "goCBqS5u"}' \
    > test.out 2>&1
eval_tap $? 179 'FulfillItem' test.out

#- 180 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'IdCbwCee' \
    --body '{"code": "q9ouEdDt", "language": "oG-lKMz", "region": "w5H7Zm0g"}' \
    > test.out 2>&1
eval_tap $? 180 'RedeemCode' test.out

#- 181 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'nYyj6MXf' \
    --body '{"origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "1ntyebvo", "namespace": "eHenAALK"}, "item": {"itemId": "t7EfxIH4", "itemSku": "46oUnP2S", "itemType": "74unXwg0"}, "quantity": 70, "type": "CURRENCY"}], "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 181 'FulfillRewards' test.out

#- 182 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jK1epwkA' \
    --endTime 'vcsYvbgf' \
    --limit '55' \
    --offset '95' \
    --productId 'PpTa8Yuq' \
    --startTime '7TKiNXmz' \
    --status 'FAILED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserIAPOrders' test.out

#- 183 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'MD5TbaUx' \
    > test.out 2>&1
eval_tap $? 183 'QueryAllUserIAPOrders' test.out

#- 184 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TCTng0xj' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "bR_472", "productId": "2gOlSatE", "region": "CZ2UgwQL", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 184 'MockFulfillIAPItem' test.out

#- 185 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'DqYSxTPu' \
    --itemId 'VlBqirdp' \
    --limit '49' \
    --offset '47' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserOrders' test.out

#- 186 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'sETl1Svh' \
    --body '{"currencyCode": "QudsjIhX", "discountedPrice": 6, "ext": {"xiSoWpnn": {}}, "itemId": "xgX7BCPM", "language": "qzQIxibh", "platform": "Epic", "price": 79, "quantity": 100, "region": "sHtdB3Ik", "returnUrl": "juaZqhJi", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateUserOrder' test.out

#- 187 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZkSSKgP' \
    --itemId '5rxCR77G' \
    > test.out 2>&1
eval_tap $? 187 'CountOfPurchasedItem' test.out

#- 188 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9d5CA1GO' \
    --userId 'RSbL9n0d' \
    > test.out 2>&1
eval_tap $? 188 'GetUserOrder' test.out

#- 189 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bWDEupmd' \
    --userId 'LQzPnNfB' \
    --body '{"status": "REFUNDING", "statusReason": "cWArbkCf"}' \
    > test.out 2>&1
eval_tap $? 189 'UpdateUserOrderStatus' test.out

#- 190 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dHIZb03o' \
    --userId 'tqmBuS9V' \
    > test.out 2>&1
eval_tap $? 190 'FulfillUserOrder' test.out

#- 191 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2pCZ23UH' \
    --userId 'mk0lpJ4J' \
    > test.out 2>&1
eval_tap $? 191 'GetUserOrderGrant' test.out

#- 192 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ll01qi7L' \
    --userId '2oDUoVRU' \
    > test.out 2>&1
eval_tap $? 192 'GetUserOrderHistories' test.out

#- 193 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'b39j22P4' \
    --userId 'Sp09cKmj' \
    --body '{"additionalData": {"cardSummary": "RUbZVBVS"}, "authorisedTime": "1991-10-18T00:00:00Z", "chargebackReversedTime": "1998-05-14T00:00:00Z", "chargebackTime": "1972-01-18T00:00:00Z", "chargedTime": "1980-01-17T00:00:00Z", "createdTime": "1976-11-05T00:00:00Z", "currency": {"currencyCode": "ekROWZ2K", "currencySymbol": "UTqkK2eF", "currencyType": "REAL", "decimals": 64, "namespace": "LoSmEEPb"}, "customParameters": {"LywJsyUi": {}}, "extOrderNo": "e6fZgLll", "extTxId": "UPsO8lg4", "extUserId": "6Si7006v", "issuedAt": "1989-06-25T00:00:00Z", "metadata": {"4aajDAOx": "0iJjYlea"}, "namespace": "ktqv2Wkl", "nonceStr": "jQuD5mnJ", "paymentMethod": "ONqHGq8m", "paymentMethodFee": 55, "paymentOrderNo": "7mF2lMFc", "paymentProvider": "WALLET", "paymentProviderFee": 13, "paymentStationUrl": "hFXJIJfl", "price": 86, "refundedTime": "1987-09-09T00:00:00Z", "salesTax": 4, "sandbox": true, "sku": "IqCy4xDi", "status": "AUTHORISED", "statusReason": "SSQ5On2c", "subscriptionId": "cEcl3xei", "subtotalPrice": 80, "targetNamespace": "4bwF5JOj", "targetUserId": "GoGxKM3q", "tax": 76, "totalPrice": 5, "totalTax": 9, "txEndTime": "1999-05-28T00:00:00Z", "type": "fLcpjFZM", "userId": "KCbp0pEb", "vat": 74}' \
    > test.out 2>&1
eval_tap $? 193 'ProcessUserOrderNotification' test.out

#- 194 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CLFpHxMY' \
    --userId 'F836075x' \
    > test.out 2>&1
eval_tap $? 194 'DownloadUserOrderReceipt' test.out

#- 195 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'EpzdnYtp' \
    --body '{"currencyCode": "ja5ig2is", "currencyNamespace": "QZga6Vy7", "customParameters": {"6izPiQRj": {}}, "description": "Ya8fv5fI", "extOrderNo": "t22tIZhj", "extUserId": "hgkigW22", "itemType": "SEASON", "language": "wxFB_160", "metadata": {"LNT6iOQV": "Yx5rW2gM"}, "notifyUrl": "sI1aYBit", "omitNotification": false, "platform": "3UDeKj97", "price": 69, "recurringPaymentOrderNo": "4WYXLqjN", "region": "7ktOBTra", "returnUrl": "BxWRTVuY", "sandbox": true, "sku": "qGlKDwTK", "subscriptionId": "XBrXiQcd", "title": "9IW8kiCK"}' \
    > test.out 2>&1
eval_tap $? 195 'CreateUserPaymentOrder' test.out

#- 196 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'eQJWZBvc' \
    --userId 'q1ETvWBx' \
    --body '{"description": "YZJh7B8g"}' \
    > test.out 2>&1
eval_tap $? 196 'RefundUserPaymentOrder' test.out

#- 197 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'bnSu9M2O' \
    --body '{"code": "xD2udaeY", "orderNo": "pCXYSMiy"}' \
    > test.out 2>&1
eval_tap $? 197 'ApplyUserRedemption' test.out

#- 198 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '87CTqEQB' \
    --chargeStatus 'CHARGED' \
    --itemId '36my3sY2' \
    --limit '4' \
    --offset '22' \
    --sku 'rDcain0c' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 198 'QueryUserSubscriptions' test.out

#- 199 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'HwDTI0sJ' \
    --excludeSystem  \
    --limit '85' \
    --offset '21' \
    --subscriptionId 'phMTggSP' \
    > test.out 2>&1
eval_tap $? 199 'GetUserSubscriptionActivities' test.out

#- 200 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '2SLcuAP7' \
    --body '{"grantDays": 43, "itemId": "U971Czw2", "language": "nbg8C7Mv", "reason": "ywhu6MjO", "region": "juGzo1Fz", "source": "4tU0aSn9"}' \
    > test.out 2>&1
eval_tap $? 200 'PlatformSubscribeSubscription' test.out

#- 201 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '8N8qOUA0' \
    --itemId 'z92RaDe8' \
    > test.out 2>&1
eval_tap $? 201 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 202 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ngT8LRQk' \
    --userId 'MnG1LZyF' \
    > test.out 2>&1
eval_tap $? 202 'GetUserSubscription' test.out

#- 203 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2mdYY6ZM' \
    --userId 'fuTYTKsu' \
    > test.out 2>&1
eval_tap $? 203 'DeleteUserSubscription' test.out

#- 204 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'e48qBEBN' \
    --userId 'AV5BTe6e' \
    --force  \
    --body '{"immediate": false, "reason": "1zA92URC"}' \
    > test.out 2>&1
eval_tap $? 204 'CancelSubscription' test.out

#- 205 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LSGPmRBZ' \
    --userId 'WunHW7MY' \
    --body '{"grantDays": 42, "reason": "r6QA7Ppe"}' \
    > test.out 2>&1
eval_tap $? 205 'GrantDaysToSubscription' test.out

#- 206 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pc92HA94' \
    --userId 'eACdeyfU' \
    --excludeFree  \
    --limit '30' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 206 'GetUserSubscriptionBillingHistories' test.out

#- 207 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iPpf8nxK' \
    --userId 'J3dnmtPw' \
    --body '{"additionalData": {"cardSummary": "a64Y4gPE"}, "authorisedTime": "1989-11-01T00:00:00Z", "chargebackReversedTime": "1974-03-02T00:00:00Z", "chargebackTime": "1980-12-30T00:00:00Z", "chargedTime": "1973-07-10T00:00:00Z", "createdTime": "1988-11-07T00:00:00Z", "currency": {"currencyCode": "tUlKLlII", "currencySymbol": "AeHbm5M6", "currencyType": "VIRTUAL", "decimals": 95, "namespace": "MuIEcRls"}, "customParameters": {"68M3MPMR": {}}, "extOrderNo": "PBepyyMz", "extTxId": "6zfR1pvT", "extUserId": "YYtDOiEi", "issuedAt": "1999-12-06T00:00:00Z", "metadata": {"uEcHCSGh": "pOZQFlwO"}, "namespace": "iuKGDFgK", "nonceStr": "49YuKnXk", "paymentMethod": "s0m8ANrc", "paymentMethodFee": 87, "paymentOrderNo": "al7ta3fo", "paymentProvider": "ADYEN", "paymentProviderFee": 53, "paymentStationUrl": "3h4MMW3A", "price": 71, "refundedTime": "1999-07-20T00:00:00Z", "salesTax": 22, "sandbox": true, "sku": "FBwjvLYv", "status": "CHARGED", "statusReason": "g6avudQF", "subscriptionId": "F1CPNY9u", "subtotalPrice": 7, "targetNamespace": "VYdglOOo", "targetUserId": "CeK0kPKm", "tax": 55, "totalPrice": 32, "totalTax": 94, "txEndTime": "1981-07-06T00:00:00Z", "type": "3lXcD8ae", "userId": "rtAVCqs8", "vat": 98}' \
    > test.out 2>&1
eval_tap $? 207 'ProcessUserSubscriptionNotification' test.out

#- 208 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'T8xy3nJ0' \
    --namespace "$AB_NAMESPACE" \
    --userId '6KkseA0A' \
    --body '{"count": 87, "orderNo": "j9ricfay"}' \
    > test.out 2>&1
eval_tap $? 208 'AcquireUserTicket' test.out

#- 209 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnhi8MDd' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserCurrencyWallets' test.out

#- 210 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Y4WLHoaU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kYnQp5eg' \
    --limit '6' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 210 'ListUserCurrencyTransactions' test.out

#- 211 CheckWallet
eval_tap 0 211 'CheckWallet # SKIP deprecated' test.out

#- 212 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'VE8ImivN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQxqWRKH' \
    --body '{"amount": 28, "expireAt": "1974-11-20T00:00:00Z", "origin": "Twitch", "reason": "oWOr98kj", "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 212 'CreditUserWallet' test.out

#- 213 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'Uas9jjz2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FrgiaGrc' \
    --body '{"amount": 54, "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 213 'PayWithUserWallet' test.out

#- 214 GetUserWallet
eval_tap 0 214 'GetUserWallet # SKIP deprecated' test.out

#- 215 DebitUserWallet
eval_tap 0 215 'DebitUserWallet # SKIP deprecated' test.out

#- 216 DisableUserWallet
eval_tap 0 216 'DisableUserWallet # SKIP deprecated' test.out

#- 217 EnableUserWallet
eval_tap 0 217 'EnableUserWallet # SKIP deprecated' test.out

#- 218 ListUserWalletTransactions
eval_tap 0 218 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 219 QueryWallets
eval_tap 0 219 'QueryWallets # SKIP deprecated' test.out

#- 220 GetWallet
eval_tap 0 220 'GetWallet # SKIP deprecated' test.out

#- 221 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'IOVKIPSJ' \
    --end 'JHo5W8tK' \
    --start 'H8ou9Sdb' \
    > test.out 2>&1
eval_tap $? 221 'SyncOrders' test.out

#- 222 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["xSXcrEFC"], "apiKey": "wqeGNLdI", "authoriseAsCapture": true, "blockedPaymentMethods": ["RdliFQVM"], "clientKey": "KEzVUWlU", "dropInSettings": "WDs2x1EQ", "liveEndpointUrlPrefix": "U0oepEvc", "merchantAccount": "jaSgEh6j", "notificationHmacKey": "JnFxinIH", "notificationPassword": "J1o7aq5Z", "notificationUsername": "znd5eaco", "returnUrl": "bTsuRlhr", "settings": "eQVFID3o"}' \
    > test.out 2>&1
eval_tap $? 222 'TestAdyenConfig' test.out

#- 223 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "8hJWVjKI", "privateKey": "OAw70DvA", "publicKey": "HhSGWUvz", "returnUrl": "q1Za3IBC"}' \
    > test.out 2>&1
eval_tap $? 223 'TestAliPayConfig' test.out

#- 224 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "4vQFsUJP", "secretKey": "fiaJp1rt"}' \
    > test.out 2>&1
eval_tap $? 224 'TestCheckoutConfig' test.out

#- 225 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '7OBgBCe6' \
    > test.out 2>&1
eval_tap $? 225 'DebugMatchedPaymentMerchantConfig' test.out

#- 226 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "N0eI65Mn", "clientSecret": "5tngEYXg", "returnUrl": "PVT5CqXD", "webHookId": "ZBVMJyJe"}' \
    > test.out 2>&1
eval_tap $? 226 'TestPayPalConfig' test.out

#- 227 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["KFO92YDt"], "publishableKey": "aZvJoKS0", "secretKey": "OxyipZuO", "webhookSecret": "4N9S2YCg"}' \
    > test.out 2>&1
eval_tap $? 227 'TestStripeConfig' test.out

#- 228 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "Ha6XBcvG", "key": "RYk5rUtW", "mchid": "HCnhmzzp", "returnUrl": "pV7tKNKY"}' \
    > test.out 2>&1
eval_tap $? 228 'TestWxPayConfig' test.out

#- 229 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "UQVBXymW", "flowCompletionUrl": "cNlHaFxY", "merchantId": 0, "projectId": 64, "projectSecretKey": "HUpmBFyO"}' \
    > test.out 2>&1
eval_tap $? 229 'TestXsollaConfig' test.out

#- 230 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'rFKtxGNA' \
    > test.out 2>&1
eval_tap $? 230 'GetPaymentMerchantConfig' test.out

#- 231 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'i0fq4xCh' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["PLd2lOop"], "apiKey": "c7XoVpdd", "authoriseAsCapture": true, "blockedPaymentMethods": ["CpyMrnH9"], "clientKey": "YHXh7KnC", "dropInSettings": "VOKY2zsB", "liveEndpointUrlPrefix": "RGtd8QY2", "merchantAccount": "OLbijrvf", "notificationHmacKey": "r8hknjWU", "notificationPassword": "WdMUXHvw", "notificationUsername": "4pNlGLjd", "returnUrl": "BxLM079p", "settings": "DAbTgmsE"}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateAdyenConfig' test.out

#- 232 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'YEq2GkYK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 232 'TestAdyenConfigById' test.out

#- 233 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '1vYm9flX' \
    --sandbox  \
    --validate  \
    --body '{"appId": "Q7CQoemn", "privateKey": "QG0dH0NV", "publicKey": "M9VEHTPq", "returnUrl": "Dhkcu5vn"}' \
    > test.out 2>&1
eval_tap $? 233 'UpdateAliPayConfig' test.out

#- 234 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'z6GiNMbo' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 234 'TestAliPayConfigById' test.out

#- 235 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'BJHml0LJ' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "mpPi4mqh", "secretKey": "ruiCZLGG"}' \
    > test.out 2>&1
eval_tap $? 235 'UpdateCheckoutConfig' test.out

#- 236 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'P5UXkHNT' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 236 'TestCheckoutConfigById' test.out

#- 237 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'Mapp5Sbo' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "nsUJKADr", "clientSecret": "60EkdFrp", "returnUrl": "LsGt9yTX", "webHookId": "WUSCQcMs"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdatePayPalConfig' test.out

#- 238 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'HN7reI22' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 238 'TestPayPalConfigById' test.out

#- 239 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'ks7I12tA' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Zc8sxxLx"], "publishableKey": "9XQeqNWL", "secretKey": "m8cNJbYH", "webhookSecret": "5J4WiJLv"}' \
    > test.out 2>&1
eval_tap $? 239 'UpdateStripeConfig' test.out

#- 240 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '9NvHwtw2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 240 'TestStripeConfigById' test.out

#- 241 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'Mjcy9ZL6' \
    --validate  \
    --body '{"appId": "Zs5Bu2XY", "key": "opLWZeUK", "mchid": "JJNftRpG", "returnUrl": "gk1iseRE"}' \
    > test.out 2>&1
eval_tap $? 241 'UpdateWxPayConfig' test.out

#- 242 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'zzRG6z9w' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 242 'UpdateWxPayConfigCert' test.out

#- 243 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'muHddyOd' \
    > test.out 2>&1
eval_tap $? 243 'TestWxPayConfigById' test.out

#- 244 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'ibI1LVyq' \
    --validate  \
    --body '{"apiKey": "bdY8DGZK", "flowCompletionUrl": "AuoIKz3P", "merchantId": 31, "projectId": 50, "projectSecretKey": "LWUxMzMt"}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateXsollaConfig' test.out

#- 245 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'SmMmZP8n' \
    > test.out 2>&1
eval_tap $? 245 'TestXsollaConfigById' test.out

#- 246 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'G0FoQP8q' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 246 'UpdateXsollaUIConfig' test.out

#- 247 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '52' \
    --namespace "$AB_NAMESPACE" \
    --offset '15' \
    --region '9RD3ZzN6' \
    > test.out 2>&1
eval_tap $? 247 'QueryPaymentProviderConfig' test.out

#- 248 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "J8ltt9IR", "region": "qCflgln6", "sandboxTaxJarApiToken": "r5f0s5H6", "specials": ["ADYEN"], "taxJarApiToken": "Cf3QHa11", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 248 'CreatePaymentProviderConfig' test.out

#- 249 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 249 'GetAggregatePaymentProviders' test.out

#- 250 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'gw5av4LE' \
    > test.out 2>&1
eval_tap $? 250 'DebugMatchedPaymentProviderConfig' test.out

#- 251 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 251 'GetSpecialPaymentProviders' test.out

#- 252 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'xdabD8g2' \
    --body '{"aggregate": "XSOLLA", "namespace": "vHfMRupD", "region": "A5xbjs3X", "sandboxTaxJarApiToken": "RdHUJ0GC", "specials": ["STRIPE"], "taxJarApiToken": "flIXkgJ6", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 252 'UpdatePaymentProviderConfig' test.out

#- 253 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'Twoakq7s' \
    > test.out 2>&1
eval_tap $? 253 'DeletePaymentProviderConfig' test.out

#- 254 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 254 'GetPaymentTaxConfig' test.out

#- 255 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "EejFZ1Nt", "taxJarApiToken": "ONXb9w9h", "taxJarEnabled": true, "taxJarProductCodesMapping": {"QHszIsfr": "lzKpQdd5"}}' \
    > test.out 2>&1
eval_tap $? 255 'UpdatePaymentTaxConfig' test.out

#- 256 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '8dZP5Rvr' \
    --end 'inNtvBtq' \
    --start 'FSkA68mI' \
    > test.out 2>&1
eval_tap $? 256 'SyncPaymentOrders' test.out

#- 257 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'VYJ5pSVx' \
    --storeId 'BsLhty3p' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetRootCategories' test.out

#- 258 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ecToXA4M' \
    --storeId '1oUFPhgo' \
    > test.out 2>&1
eval_tap $? 258 'DownloadCategories' test.out

#- 259 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '7Z6mwNC4' \
    --namespace "$AB_NAMESPACE" \
    --language 'FY69mM87' \
    --storeId 'joJNOGB8' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetCategory' test.out

#- 260 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '3Ns6Hl5P' \
    --namespace "$AB_NAMESPACE" \
    --language 'oab6lKoV' \
    --storeId 'qNBUzIxO' \
    > test.out 2>&1
eval_tap $? 260 'PublicGetChildCategories' test.out

#- 261 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'fglquS2q' \
    --namespace "$AB_NAMESPACE" \
    --language '2DoWr9zv' \
    --storeId 'FtKa2mOA' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetDescendantCategories' test.out

#- 262 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 262 'PublicListCurrencies' test.out

#- 263 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'OokV1plx' \
    --region 'Q2YriTPf' \
    --storeId 'ipD67jI2' \
    --appId 'hiZkrtLn' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetItemByAppId' test.out

#- 264 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --baseAppId '2U1RQlMx' \
    --categoryPath 'kfNMPNtq' \
    --features 'v2TMz1b7' \
    --itemType 'COINS' \
    --language 'zkXOek83' \
    --limit '68' \
    --offset '13' \
    --region 'm1wkSWsY' \
    --sortBy 'createdAt:desc' \
    --storeId 'Asu18obU' \
    --tags 'dc8mbvXc' \
    > test.out 2>&1
eval_tap $? 264 'PublicQueryItems' test.out

#- 265 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'wcgMqOXM' \
    --region 'ziXrVdsE' \
    --storeId 'c3ClFP3m' \
    --sku 'JwusCBTe' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetItemBySku' test.out

#- 266 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language '4kLcuqL4' \
    --region '0NYgekRa' \
    --storeId 'vpaGTA9B' \
    --itemIds 'TyCCyN4F' \
    > test.out 2>&1
eval_tap $? 266 'PublicBulkGetItems' test.out

#- 267 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '17' \
    --region '6mI2W3tj' \
    --storeId 'jCqPVyYs' \
    --keyword '01hEYzWw' \
    --language '3qrcxM0D' \
    > test.out 2>&1
eval_tap $? 267 'PublicSearchItems' test.out

#- 268 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'PAXQBNMP' \
    --namespace "$AB_NAMESPACE" \
    --language '7j3xfPao' \
    --region 'ZaWFspkU' \
    --storeId '5kn6PlPq' \
    > test.out 2>&1
eval_tap $? 268 'PublicGetApp' test.out

#- 269 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'D4AgfasB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 269 'PublicGetItemDynamicData' test.out

#- 270 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'fclBhZjZ' \
    --namespace "$AB_NAMESPACE" \
    --language 'bLnmghKw' \
    --populateBundle  \
    --region 'PyVIn3qa' \
    --storeId 'HP7KNuly' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetItem' test.out

#- 271 GetPaymentCustomization
eval_tap 0 271 'GetPaymentCustomization # SKIP deprecated' test.out

#- 272 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "frENVQkp", "paymentProvider": "WALLET", "returnUrl": "aWHf6T2x", "ui": "OOljn7c6", "zipCode": "c9efJI02"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetPaymentUrl' test.out

#- 273 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TZxrgLBF' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetPaymentMethods' test.out

#- 274 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JEkphFz0' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUnpaidPaymentOrder' test.out

#- 275 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'h6WpoVpV' \
    --paymentProvider 'ADYEN' \
    --zipCode '2HBBmj6c' \
    --body '{"token": "Ei02hXl4"}' \
    > test.out 2>&1
eval_tap $? 275 'Pay' test.out

#- 276 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2ubCRfy4' \
    > test.out 2>&1
eval_tap $? 276 'PublicCheckPaymentOrderPaidStatus' test.out

#- 277 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'Kn5ItHXL' \
    > test.out 2>&1
eval_tap $? 277 'GetPaymentPublicConfig' test.out

#- 278 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'DZqpRhqn' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetQRCode' test.out

#- 279 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'R742GcbL' \
    --foreinginvoice 'uQOGMOEz' \
    --invoiceId 'mdjNhT0S' \
    --payload '46kqyfMB' \
    --redirectResult 'SaZc4SA1' \
    --resultCode '6M8gQCD7' \
    --sessionId 'aBHWCYev' \
    --status 'NkfcQvl4' \
    --token 'Oso7tx65' \
    --type 'zXCiTfjo' \
    --userId 'rLFqTmIU' \
    --orderNo 'FUoonHBI' \
    --paymentOrderNo '13SZFHfm' \
    --paymentProvider 'XSOLLA' \
    --returnUrl '8vS2BrZ3' \
    > test.out 2>&1
eval_tap $? 279 'PublicNormalizePaymentReturnUrl' test.out

#- 280 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'nq88YSSD' \
    --paymentOrderNo '7zV0C8Fv' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 280 'GetPaymentTaxValue' test.out

#- 281 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'RXBGPXId' \
    > test.out 2>&1
eval_tap $? 281 'GetRewardByCode' test.out

#- 282 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ft1biZHu' \
    --limit '15' \
    --offset '97' \
    --sortBy 'rewardCode' \
    > test.out 2>&1
eval_tap $? 282 'QueryRewards1' test.out

#- 283 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'FPHdXcyv' \
    > test.out 2>&1
eval_tap $? 283 'GetReward1' test.out

#- 284 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'PublicListStores' test.out

#- 285 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ZEhYeUSy' \
    --itemIds '5Ukc65na' \
    --skus 'P11R8Xww' \
    > test.out 2>&1
eval_tap $? 285 'PublicExistsAnyMyActiveEntitlement' test.out

#- 286 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '9vq9nMa2' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 287 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'tgwyuf2f' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 288 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'V30SLxi7' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 289 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'uyhaeFtc' \
    --itemIds 'O9XNy63Q' \
    --skus 'O9vW0ck7' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetEntitlementOwnershipToken' test.out

#- 290 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'TEDE8LeE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'PublicGetMyWallet' test.out

#- 291 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'QBeGPLiE' \
    --body '{"serviceLabel": 38}' \
    > test.out 2>&1
eval_tap $? 291 'PublicSyncPsnDlcInventory' test.out

#- 292 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCr0GPFv' \
    --body '{"appId": "T0SAK91y", "steamId": "5vCeBIJq"}' \
    > test.out 2>&1
eval_tap $? 292 'SyncSteamDLC' test.out

#- 293 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '0B9UcI6c' \
    --body '{"xstsToken": "5cre9eal"}' \
    > test.out 2>&1
eval_tap $? 293 'SyncXboxDLC' test.out

#- 294 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HOZphcLn' \
    --appType 'DEMO' \
    --entitlementClazz 'CODE' \
    --entitlementName 'jnmyU8FS' \
    --itemId 'xXdCrsko' \
    --limit '63' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 294 'PublicQueryUserEntitlements' test.out

#- 295 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nowq9Laz' \
    --appId '1GLt5Mhf' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetUserAppEntitlementByAppId' test.out

#- 296 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '8Z7ahmbV' \
    --limit '82' \
    --offset '24' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 296 'PublicQueryUserEntitlementsByAppType' test.out

#- 297 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '7xAFfRRL' \
    --entitlementClazz 'CODE' \
    --itemId 'fWS9sftI' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUserEntitlementByItemId' test.out

#- 298 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'fHGe5bUT' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '12PMcRO6' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetUserEntitlementBySku' test.out

#- 299 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'E2Mkre5q' \
    --appIds '7FvaACp6' \
    --itemIds 'he0fzjkP' \
    --skus 'NNS0BfgF' \
    > test.out 2>&1
eval_tap $? 299 'PublicExistsAnyUserActiveEntitlement' test.out

#- 300 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '6inIRsZ5' \
    --appId 'hrqNzVsz' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 301 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GVP5P1iw' \
    --entitlementClazz 'APP' \
    --itemId 'cf30C1KH' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 302 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZHMGy5v' \
    --entitlementClazz 'APP' \
    --sku 'fZvYIFFc' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 303 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'tEKOLxSR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xe0wmWBM' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetUserEntitlement' test.out

#- 304 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'cNiWoobB' \
    --namespace "$AB_NAMESPACE" \
    --userId '6o6alTQc' \
    --body '{"useCount": 82}' \
    > test.out 2>&1
eval_tap $? 304 'PublicConsumeUserEntitlement' test.out

#- 305 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '0EpE9wGN' \
    --body '{"code": "VwkgfJJ2", "language": "iALF_tFLX-xz", "region": "trGe8LyO"}' \
    > test.out 2>&1
eval_tap $? 305 'PublicRedeemCode' test.out

#- 306 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'H24nneZH' \
    --body '{"excludeOldTransactions": true, "language": "rL", "productId": "GA7JxWYz", "receiptData": "aEaimvok", "region": "cWX59kwi", "transactionId": "YHgHT6Iv"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicFulfillAppleIAPItem' test.out

#- 307 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'd0fGpU20' \
    --body '{"epicGamesJwtToken": "9nVRclum"}' \
    > test.out 2>&1
eval_tap $? 307 'SyncEpicGamesInventory' test.out

#- 308 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'QTFvr5rR' \
    --body '{"autoAck": true, "language": "AnM_tntR-455", "orderId": "egpkcXCf", "packageName": "zgcvv0WE", "productId": "5EQhcomP", "purchaseTime": 89, "purchaseToken": "1E7cpsLg", "region": "r2zEnjyR"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicFulfillGoogleIAPItem' test.out

#- 309 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'NjEC3FMD' \
    --body '{"currencyCode": "cZvwwf8a", "price": 0.7311690074438644, "productId": "8In31mF4", "serviceLabel": 18}' \
    > test.out 2>&1
eval_tap $? 309 'PublicReconcilePlayStationStore' test.out

#- 310 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lwKyGxTF' \
    --body '{"appId": "1l5q1Np0", "language": "txj-Hu", "region": "zIfnhoo6", "stadiaPlayerId": "xUmTleUn"}' \
    > test.out 2>&1
eval_tap $? 310 'SyncStadiaEntitlement' test.out

#- 311 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'JFM7XhoD' \
    --body '{"appId": "xGik2JSf", "currencyCode": "Z64wWePq", "language": "onki_wrTa_651", "price": 0.2003955111850252, "productId": "Hkvek6Aa", "region": "5kNnoclx", "steamId": "s9kxcvIp"}' \
    > test.out 2>&1
eval_tap $? 311 'SyncSteamInventory' test.out

#- 312 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7mCYfWK' \
    --body '{"gameId": "jY9CsQYs", "language": "YHeo-Dm", "region": "1A0bFqvj"}' \
    > test.out 2>&1
eval_tap $? 312 'SyncTwitchDropsEntitlement' test.out

#- 313 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'xbT3YuVd' \
    --body '{"currencyCode": "aBN5RSjh", "price": 0.04262713451537725, "productId": "uDvNrXL8", "xstsToken": "45jfh5tZ"}' \
    > test.out 2>&1
eval_tap $? 313 'SyncXboxInventory' test.out

#- 314 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0hqJLjQU' \
    --itemId 'moYUnC84' \
    --limit '80' \
    --offset '55' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 314 'PublicQueryUserOrders' test.out

#- 315 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'uLZtofGA' \
    --body '{"currencyCode": "AaMpBQAr", "discountedPrice": 93, "ext": {"4RS0FQRy": {}}, "itemId": "5Qz5Vcyf", "language": "PhJ-Wksj_315", "price": 5, "quantity": 95, "region": "XTxs9LTo", "returnUrl": "rIyx23Lh"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicCreateUserOrder' test.out

#- 316 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ly7ds3g3' \
    --userId 'BuHTPF19' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserOrder' test.out

#- 317 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dBYFws5Y' \
    --userId 'a4eOwWqW' \
    > test.out 2>&1
eval_tap $? 317 'PublicCancelUserOrder' test.out

#- 318 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8HiLpTi1' \
    --userId 'W63HccgM' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserOrderHistories' test.out

#- 319 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5kYu36Jp' \
    --userId 'TL55W4ws' \
    > test.out 2>&1
eval_tap $? 319 'PublicDownloadUserOrderReceipt' test.out

#- 320 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '3KCyplY1' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetPaymentAccounts' test.out

#- 321 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'ocKDCVaq' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'VeegT3uG' \
    > test.out 2>&1
eval_tap $? 321 'PublicDeletePaymentAccount' test.out

#- 322 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'DIIcvuuo' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 't8TC38mY' \
    --limit '28' \
    --offset '93' \
    --sku 'anQT4Mmz' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 322 'PublicQueryUserSubscriptions' test.out

#- 323 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '7r2jthib' \
    --body '{"currencyCode": "geCLX41q", "itemId": "yOiLgd8W", "language": "qhZ-PDtv_mE", "region": "tfI7TzC3", "returnUrl": "sKmtsyEK", "source": "dO6HNm3z"}' \
    > test.out 2>&1
eval_tap $? 323 'PublicSubscribeSubscription' test.out

#- 324 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gu71qTSS' \
    --itemId 'JEbWlETp' \
    > test.out 2>&1
eval_tap $? 324 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 325 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9XOCA1X3' \
    --userId 'HHMTlakA' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserSubscription' test.out

#- 326 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WQfBuBAO' \
    --userId 'CjBfYCcp' \
    > test.out 2>&1
eval_tap $? 326 'PublicChangeSubscriptionBillingAccount' test.out

#- 327 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lye2GaPN' \
    --userId 'zkrgBH4i' \
    --body '{"immediate": false, "reason": "ml6L36Vg"}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCancelSubscription' test.out

#- 328 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2F2Q9aZD' \
    --userId 'Jg1OT810' \
    --excludeFree  \
    --limit '28' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserSubscriptionBillingHistories' test.out

#- 329 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '70TevJgs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b2PyFfJ6' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetWallet' test.out

#- 330 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'qcHABdGt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V9jAPqon' \
    --limit '92' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 330 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE